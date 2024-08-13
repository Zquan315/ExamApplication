import 'package:examapp/Views/joinAndcreate/createClass.dart';
import 'package:examapp/Views/joinAndcreate/joinClass.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset()
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/LogoApp.png"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: <Widget>[
              SizedBox(height: 30),
              FloatingActionButton.extended(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const createClass())),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Create a Class",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const joinClass())),
                icon: Icon(
                  Icons.class_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  "Join in a Class",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
            ])
          ],
        )
      ],
    );
  }
}