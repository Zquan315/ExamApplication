import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "To Cong Quan",
              style: TextStyle(fontSize: 25, color: Colors.red),
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "0123456789",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
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
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    "ExamApp312@gmail.com",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
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
        const Padding(
          child: Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.male,
                    color: Colors.blue,
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    "Male/Female",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              label: Text(
                "Log out",
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
                      "Help",
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