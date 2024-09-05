import 'package:examapp/Components/button.dart';
import 'package:examapp/Views/Auth/login.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController sexController;

  const AccountPage({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.sexController,
  });

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = widget.nameController;
    emailController = widget.emailController;
    phoneController = widget.phoneController;
    sexController = widget.sexController;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Image.asset("assets/account_image.png"),
        ),
        const SizedBox(
          height: 15,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameController.text,
              style: TextStyle(fontSize: 25, color: Colors.red),
            )
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              phoneController.text,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
         Padding(
          child: Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.blue,
                  )
                ],
              ),
              SizedBox(width: 30,
              ),
              Text(
                emailController.text,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )

            ],
          ),
          padding: EdgeInsets.all(20.0),
        ),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        Padding(
          child: Row(
            children: [
              Column(
                children: [
                  Icon(
                    sexController.text == "Nam" ? Icons.male : Icons.female,
                    color: sexController.text == "Nam" ? Colors.blue : Colors.pink
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    sexController.text,
                    style: TextStyle(fontSize: 20,
                    color: sexController.text == "Nam" ? Colors.blue : Colors.pink),
                  )
                ],
              )
            ],
          ),
          padding: EdgeInsets.all(20.0),
        ),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Bạn có chắc chắn đăng xuất?',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.blue),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Hủy",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.blue),
                                    ),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Login())),
                                    child: const Text(
                                      "Chắc rồi",
                                      style: TextStyle(
                                          color: Colors.white),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              },
              label: Text(
                "Đăng xuất",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: null,
                child: Row(
                  children: [
                    Text(
                      "Trợ giúp",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ))
          ],
        )
      ],
    );
  }
}
