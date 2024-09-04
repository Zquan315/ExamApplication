import 'package:examapp/Components/button.dart';
import 'package:examapp/Components/text_field.dart';
import 'package:examapp/Views/Auth/mainScreen.dart';
import 'package:examapp/Views/Auth/signup.dart';
import 'package:examapp/Views/Password/ForgotPass.dart';
import 'package:examapp/Views/class/leader/main_leader.dart';
import 'package:examapp/Views/class/member/main_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../ConnectDB/connectDB.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final infoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isloading = false;
  final errorController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoController.text ="";
    errorController.text = "E";
  }
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

                const Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20,),
                InputField(
                  keyboardType: TextInputType.emailAddress,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPass())),
                        child: const Text('Quên mật khẩu?')),
                  ],
                ),

                _isloading
                    ? CircularProgressIndicator()
                    : Button(
                  label: "Đăng Nhập",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        _isloading = true;
                      });

                      await Future.delayed(Duration(microseconds: 500));

                      var acc = await connectMongoDb.querryAccount(emailController.text);

                      setState(() {
                        _isloading = false;
                      });

                      if (acc != null) {
                        if (passwordController.text != acc['password']) {
                          failLogin();
                        } else {
                          successLogin();
                          await Future.delayed(Duration(seconds: 1));
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          );

                          await Future.delayed(Duration(milliseconds: 1500)); // Chờ 0.5 giây

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const mainScreen(),
                            ),
                          );
                          reset();
                        }
                      } else {
                        Warning();
                      }
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
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(infoController.text,
                    style: TextStyle(
                      fontSize: 15,
                      color: errorController.text == 'E' ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void Warning()
  {
    setState(() {
      passwordController.text = "";
      emailController.text = "";
      infoController.text ="Email không tồn tại";
      errorController.text = "E";
    });
  }
  void failLogin()
  {
    setState(() {
      errorController.text = "E";
      passwordController.text = "";
      infoController.text ="Đăng nhập thất bại";
    });
  }
  void successLogin()
  {
    setState(()  {
      errorController.text = "O";
      infoController.text ="Đăng nhập thành công";
    });
  }
  void reset()
  {
    emailController.text = passwordController.text = infoController.text ="";
    errorController.text = "E";
  }
}

