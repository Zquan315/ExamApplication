import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:examapp/Views/Auth/login.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';
import 'package:examapp/Views/Password/ChangePass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../ConnectDB/connectDB.dart';
import '../../ConnectDB/insertDB/register.dart';
import '../Auth/otp.dart';

class AuthRegis extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController sexController;
  final TextEditingController passwordController;
  const AuthRegis({
    super.key,
    required this.usernameController,
    required this.phoneController,
    required this.emailController,
    required this.sexController,
    required this.passwordController,
  });
  @override
  State<AuthRegis> createState() => _AuthRegisState();
}

class _AuthRegisState extends State<AuthRegis> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String? otpValue;
  Color emailFieldColor = Colors.blue.withOpacity(.5);
  Color otpFieldColor = Colors.blue.withOpacity(.5);

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/LogoApp.png",
                    scale: 1.5,
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Xác Thực",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 15,),

              //Email
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text(
                          "Email",
                          style: TextStyle(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: emailFieldColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    readOnly: true,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              //OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: otpController,
                      decoration: InputDecoration(
                        label: const Text(
                          "OTP",
                          style: TextStyle(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(
                          Icons.code,
                          color: Colors.blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: otpFieldColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () async {
                        String? generatedOTP = await getOTP(emailController.text);
                        if (generatedOTP != null) {
                          setState(() {
                            otpValue = generatedOTP;
                          });
                        }
                      },
                      child: const Text(
                        'Lấy mã',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.blue),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.black87),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if(emailController.text == "" ||
                              !isValidEmail(emailController.text) ||
                              otpController.text == "" ||
                              !isValidOTP(otpController.text) ||
                              otpValue != otpController.text || otpValue == null){
                            setState(() {
                              otpController.text ="";
                              emailFieldColor = Colors.red.withOpacity(.5);
                              otpFieldColor = Colors.red.withOpacity(.5);
                            });
                            return;
                          }
                          // const CircularProgressIndicator(
                          //
                          // );
                          _register(widget.usernameController.text,emailController.text,
                              widget.phoneController.text, widget.passwordController.text, widget.sexController.text);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                title: const Text("Đăng ký"),
                                content: const Text("Đăng ký thành công!",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Login()));
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                          setState(() {
                            emailController.text = otpController.text ="";
                            emailFieldColor = Colors.blue.withOpacity(.5);
                            otpFieldColor = Colors.blue.withOpacity(.5);
                          });
                        }
                      },
                      child: const Text("Xác nhận"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _register(String name, String email, String phone, String pass, String sex) async{
    final data = Register(name: name, email: email, phone: phone, password: pass, sex: sex);
    var res = await connectMongoDb.register(data);
  }
}
bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );
  return emailRegex.hasMatch(email);
}

bool isValidOTP(String otp)
{
  if(otp.length != 6)
    return false;
  for(int i = 0 ; i< otp.length;i++) {
    if(!isDigit(otp[i]))
      return false;
  }
  return true;
}

bool isDigit(String char) {
  return RegExp(r'^[0-9]$').hasMatch(char);
}

