import 'package:examapp/Components/DropDown-Menu.dart';
import 'package:examapp/Components/button.dart';
import 'package:examapp/Components/text_field.dart';
import 'package:examapp/Views/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AuthRegis.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final sexController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Color nameFieldColor = Colors.blue.withOpacity(.5);
  Color emailFieldColor = Colors.blue.withOpacity(.5);
  Color repassFieldColor = Colors.blue.withOpacity(.5);
  Color phoneFieldColor = Colors.blue.withOpacity(.5);
  Color passFieldColor = Colors.blue.withOpacity(.5);
  final formKey = GlobalKey<FormState>();
  List<String> list = <String>['Male', 'Female'];
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/LogoApp.png"),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.only(left: 140),
                  title: Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                InputField(
                  controller: usernameController,
                  hintText: "Name",
                  icon: Icons.person,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name is invalid";
                    }
                    return null;
                  },
                ),
                InputField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email_rounded,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is invalid";
                    }
                    return null;
                  },
                ),
                InputField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phone is invalid";
                    }
                    return null;
                  },
                ),

                InputField(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is invalid";
                    }

                    return null;
                  },
                ),
                InputField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: _obscureConfirmText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmText
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmText = !_obscureConfirmText;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Confirm Password is invalid";
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                ),

                 dropDownMenu(
                  list: ['Male', 'Female'],
                  controller: sexController,
                ),
                Button(
                  label: "SIGN UP",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if(!isValidEmail(emailController.text)){
                        setState(() {
                          emailController.text = "";
                          emailFieldColor = Colors.red.withOpacity(.5);
                        });
                        return;
                      }
                      if(!isValidPhoneNumber(phoneController.text)){
                        setState(() {
                          phoneController.text = "";
                          phoneFieldColor = Colors.red.withOpacity(.5);
                        });
                        return;
                      }
                      if(!isValidPass(passwordController.text)){
                        setState(() {
                          passwordController.text = "";
                          passFieldColor = Colors.red.withOpacity(.5);
                        });
                        return;
                      }
                      print(sexController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthRegis()),
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                        child: const Text('Login'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );
  return emailRegex.hasMatch(email);
}
bool isValidPhoneNumber(String phone) {
  String phoneNumber = phone.replaceAll(RegExp(r'\s+|-'), '');

  final regex = RegExp(r'^(0|\+84)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-4|6-9])[0-9]{7}$');

  return regex.hasMatch(phoneNumber);
}

bool isValidPass(String pass)
{
  if(pass.length < 8) return false;
  return true;
}