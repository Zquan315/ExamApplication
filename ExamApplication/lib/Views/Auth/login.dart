import 'package:examapp/Components/button.dart';
import 'package:examapp/Components/text_field.dart';
import 'package:examapp/Views/Auth/mainScreen.dart';
import 'package:examapp/Views/Auth/signup.dart';
import 'package:examapp/Views/Password/ForgotPass.dart';
import 'package:examapp/Views/class/leader/main_leader.dart';
import 'package:examapp/Views/class/member/main_member.dart';
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
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
                    'ĐĂNG NHẬP',
                    style: TextStyle(fontSize: 30),
                  ),
                ),

                InputField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email_rounded,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Vui lòng nhập Email";
                    }
                    return null;
                  },
                ),

                InputField(
                  controller: passwordController,
                  hintText: "Mật khẩu",
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
                      return "Vui lòng nhập mật khẩu";
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
                    const Text('Nhớ lấy tôi'),
                    const Spacer(),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPass())),
                        child: const Text('Quên mật khẩu?')),
                  ],
                ),

                Button(
                  label: "Đăng Nhập",
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                    if(emailController.text == 'admin' && passwordController.text == 'admin')
                      {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mainScreen()));
                        });
                      }
                    else if(emailController.text == 'member' && passwordController.text == 'member')
                    {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const mainScreen()));
                      });

                    }
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Bạn chưa có tài khoản?'),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp())),
                        child: const Text('Đăng ký ngay'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
