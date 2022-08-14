
import 'package:flutter/material.dart';

import '../../../core/localization/localizations.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../widgets/custom_surfix_icon.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/no_account_text.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight* 0.04),
              Text(
                labels!.auth!.resetPasswordTitle,
                style: themeData.textTheme.headline6,
              ),
              Text(
                "${labels.auth!.resetPasswordSubTitle}\n${labels.auth!.resetPasswordSubTitle2}",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight* 0.1),
              ForgotPassForm(labels),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  ForgotPassForm(AppLocalizations_Labels labels);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> errors = [];
  String email = "";
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: authController.emailController,
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => authController.emailController.text = value!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: labels!.auth!.emailFormField,
              hintText: labels.auth!.hintEmailFormField,
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight* 0.1),
          DefaultButton(
            text: labels.auth!.continueButton,
            press: () {
              if (_formKey.currentState!.validate()) {
                authController.sendPasswordResetEmail(context);
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight* 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
