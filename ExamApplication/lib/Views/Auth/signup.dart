import 'package:examapp/Components/DropDown-Menu.dart';
import 'package:examapp/Components/button.dart';
import 'package:examapp/Components/text_field.dart';
import 'package:examapp/ConnectDB/connectDB.dart';
import 'package:examapp/ConnectDB/insertDB/register.dart';
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
  List<String> list = <String>['Nam', 'Nữ'];
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/LogoApp.png"),
                ),
                const Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20,),
                InputField(
                  controller: usernameController,
                  hintText: "Họ tên",
                  icon: Icons.person,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Tên không hợp lệ";
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
                      return "Email không hợp lệ";
                    }
                    return null;
                  },
                ),
                InputField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  hintText: "Số điện thoại",
                  icon: Icons.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Số điện thoại không hợp lệ";
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
                      return "Mật khẩu không hợp lệ";
                    }

                    return null;
                  },
                ),
                InputField(
                  controller: confirmPasswordController,
                  hintText: "Xác nhận mật khẩu",
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
                      return "Xác nhận mật khẩu không hợp lệ";
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Mật khẩu không trùng nhau";
                    }
                    return null;
                  },
                ),

                 dropDownMenu(
                  list: ['Nam', 'Nữ'],
                  controller: sexController,
                ),
                Button(
                  label: "Đăng Ký",
                  onTap: ()  {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthRegis(
                            usernameController: usernameController,
                            phoneController: phoneController,
                            emailController: emailController,
                            sexController: sexController,
                            passwordController: passwordController,
                          ),
                        ),
                      );

                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Bạn đã có tài khoản?'),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                        child: const Text('Đăng nhập'))
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


