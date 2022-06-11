import 'package:bfproperty/constants/constants.dart';
import 'package:bfproperty/widgets/custom_surfix_icon.dart';
import 'package:bfproperty/widgets/default_button.dart';
import 'package:bfproperty/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/constants/app_themes.dart';
import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:get/route_manager.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final labels = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(labels),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(labels),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: AppThemes.dodgerBlue,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(labels?.auth?.rememberCheckBox),
              Spacer(),
              GestureDetector(
                onTap: () => Get.toNamed("/forgetpassword"),
                child: Text(
                  labels?.auth?.forgetPassword,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: labels?.auth?.continueButton,
            press: () async {
              if (_formKey.currentState.validate()) {
                authController.signInWithEmailAndPassword(context);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            color: AppThemes.google,
            text: labels?.auth?.googleButton,
            press: () async {
              authController.signInWithGoogle();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            color: AppThemes.facbook,
            text: labels?.auth?.facbookButton,
            press: () async {
              // authController.signInWithFacbook();
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField(AppLocalizations_Labels labels) {
    return TextFormField(
      controller: authController.passwordController,
      obscureText: true,
      onSaved: (value) => authController.passwordController.text = value,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labels?.auth?.passwordFormField,
        hintText: labels?.auth?.hintPasswordFormField,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField(AppLocalizations_Labels labels) {
    return TextFormField(
      controller: authController.emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => authController.emailController.text = value,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labels?.auth?.emailFormField,
        hintText: labels?.auth?.hintEmailFormField,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
