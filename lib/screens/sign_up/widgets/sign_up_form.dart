import 'package:bfproperty/constants/constants.dart';
import 'package:bfproperty/widgets/custom_surfix_icon.dart';
import 'package:bfproperty/widgets/default_button.dart';
import 'package:bfproperty/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/constants/size_config.dart';
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String conform_password;
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
    final labels = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(labels),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(labels),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(labels),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(labels),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: labels?.auth?.signUpLabelButton,
            press: () async {
              if (_formKey.currentState.validate()) {
                SystemChannels.textInput.invokeMethod(
                    'TextInput.hide'); //to hide the keyboard - if any
                authController.registerWithEmailAndPassword(context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField(AppLocalizations_Labels labels) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labels?.auth?.confirmPasswordFormField,
        hintText: labels?.auth?.hintconfirmPasswordFormField,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        password = value;
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

  TextFormField buildNameFormField(AppLocalizations_Labels labels) {
    return TextFormField(
      controller: authController.nameController,
      onSaved: (value) => authController.nameController.text = value,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labels?.auth?.nameFormField,
        hintText: labels?.auth?.hintNameFormField,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
