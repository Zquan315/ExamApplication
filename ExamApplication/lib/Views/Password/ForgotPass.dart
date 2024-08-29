import 'dart:io';

import 'package:examapp/Views/Password/ChangePass.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final _formKey = GlobalKey<FormState>();
  String? otpValue;
  String? emailValue;
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
                    "Forgot password",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(color: Colors.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          "OTP",
                          style: TextStyle(color: Colors.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.code,
                          color: Colors.blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Get code',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 20,),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePass()),
                          );
                        }
                      },
                      child: Text("Confirm"),
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
}
bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );
  return emailRegex.hasMatch(email);
}