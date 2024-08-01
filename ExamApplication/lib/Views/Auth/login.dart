import 'package:examapp/Components/button.dart';
import 'package:examapp/Components/text_field.dart';
import 'package:examapp/Views/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/LogoApp.png"),
                ),

                const ListTile(
                  contentPadding: EdgeInsets.only(left: 150),
                  title: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 30),
                  ),
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

                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?')),
                  ],
                ),

                Button(
                  label: "LOGIN",
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account?'),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp())),
                        child: const Text('Sign up'))
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
