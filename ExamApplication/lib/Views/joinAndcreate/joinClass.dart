import 'package:flutter/material.dart';

class joinClass extends StatefulWidget {
  const joinClass({super.key});

  @override
  State<joinClass> createState() => _joinClassState();
}

class _joinClassState extends State<joinClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter ID of class",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            )
          ],
        ),
        backgroundColor: Colors.blue,
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 100,
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius. circular(40.0)),
                      ),
                      labelText: 'ID',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                    child: FloatingActionButton.extended(
                        backgroundColor: Colors.blue,
                        onPressed: (){},
                        label: Text(
                          'Join',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        )
                    )
                )

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () { },
                  child: Text(
                    "Exit",
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline
                    ),
                  ),
                )
              ],
            ),
          ]
      ),
    );
  }
}
