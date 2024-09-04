import 'package:examapp/Views/Auth/mainScreen.dart';
import 'package:flutter/material.dart';


class createClass extends StatefulWidget {
  const createClass({super.key});

  @override
  State<createClass> createState() => _createClassState();
}

class _createClassState extends State<createClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tạo lớp học",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 7,),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "ID",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 60,),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius. circular(40.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(
                      "Tên",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 25,),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius. circular(40.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(
                      "Số lượng",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      height: 50,
                      width: 195,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius. circular(40.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(
                      "Mô tả",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    const SizedBox(width: 10,),
                    SizedBox(
                      height: 50,
                      width: 194,
                      child: TextField(
                        maxLines: null,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius. circular(40.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.blue,
                    onPressed: (){},
                    label: const Text(
                      'Tạo',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    )
                ),
              ),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const mainScreen())),
                  child: const Text(
                    "Thoát",
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
