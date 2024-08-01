import 'package:examapp/Components/button.dart';
import 'package:examapp/Components/text_field.dart';
import 'package:examapp/Views/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  final formKey = GlobalKey<FormState>();
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
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email_rounded,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phone is required";
                    }
                    return null;
                  },
                ),
                InputField(
                  controller: sexController,
                  hintText: "Sex",
                  icon: Icons.male,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Sex is required";
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
                      return "Password is required";
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
                      return "Confirm Password is required";
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                ),
                Button(
                  label: "SIGN UP",
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
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
