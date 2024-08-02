import 'dart:ui';

import 'package:examapp/Components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
class mainScreen extends StatefulWidget {

  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  String user = "";

  @override
  void initState() {
    super.initState();
    user = "user";
    _tabControllers = TabController(length: 4, vsync: this);
    _tabControllers.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    _tabControllers.dispose();
    super.dispose();
  }

  Widget _buildPage() {
    if (_tabControllers.index == 0) {
      return const HomePage();
    } else if (_tabControllers.index == 1) {
      return const ClassPage();
    } else if (_tabControllers.index == 2) {
      return const SettingPage();
    } else {
      return const AccountPage();
    }
  }

  int index()
  {
    return _tabControllers.index;
  }

  @override
  Widget build(BuildContext context) {
    int a = index();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(a == 0)
              const Text(
                "Home",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
            else if( a== 1)
              const Text(
                "List of classes",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
            else if(a == 2)
                const Text(
                  "Setting",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                )
              else
                const Text(
                  "Account",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _buildPage(),
            ),
          ),
          Container(
            color: Colors.blue,
            child: TabBar(
              controller: _tabControllers,
              tabs:const [
                Tab(text: 'Home', icon: Icon(Icons.home)),
                Tab(text: 'Class', icon: Icon(Icons.class_)),
                Tab(text: 'Setting', icon: Icon(Icons.settings)),
                Tab(text: 'Account', icon: Icon(Icons.account_circle)),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  FloatingActionButton.extended(
                    onPressed: null,
                    icon: Icon(Icons.add, color: Colors.white,),
                    label: Text("Create a Class",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(height: 20,),
                  FloatingActionButton.extended(
                    onPressed: null,
                    icon: Icon(Icons.class_outlined, color: Colors.white,),
                    label: Text("Join in a Class",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    backgroundColor: Colors.blue,
                  ),
                ]
            )
          ],
        )
      ],
    );
  }
}

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15,),
          const Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 40,
                child: SearchBar(
                  leading: Icon(Icons.search),
                  hintText: "ID class",
                  controller: null,
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 10.0)
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 20,),
          listClass(15, "1111",56, "quan123")
        ]
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset("assets/LogoApp.png",
                scale: 1.5,),
            )
          ],
        ),
        Column(
          children: [
            Button(
              label: "Edit information",
              onTap: (){},
            ),
            Button(
              label: "Change password",
              onTap: (){},
            ),
            Button(
              label: "Response us",
              onTap: (){},
            ),
            Button(
              label: "Delete account",
              onTap: (){},
            ),
          ],
        )
      ],
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Image.asset("assets/account_image.png"),
        ),
        const SizedBox(height: 15,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("To Cong Quan",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red
              ),
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("0123456789",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue
              ),
            )
          ],
        ),
        const SizedBox(height: 30,),
        const Padding(child: Row(
          children: [
            Column(
              children: [
                Icon(Icons.email,
                  color: Colors.blue,)
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                Text(
                  "ExamApp312@gmail.com",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ),
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

        const Padding(child: Row(
          children: [
            Column(
              children: [
                Icon(Icons.male,
                  color: Colors.blue,)
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                Text(
                  "Male/Female",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ),
                )
              ],
            )
          ],
        ),
          padding: EdgeInsets.all(20.0),),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),

        const SizedBox(height: 100,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              label: Text(
                "Log out",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),
              ),
              backgroundColor: Colors.blue,
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: null,
                child: Row(
                  children: [
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          decoration: TextDecoration.underline
                      ),
                    )
                  ],
                )
            )
          ],
        )
      ],
    );
  }
}

Widget createFAB(String id, String mem, String teacher) {
  return Padding(
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.teal,
              label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ID: $id",
                        style: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Members: $mem",
                        style: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Teacher: $teacher",
                        style: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      )

  );
}

Widget listClass(int amount, String id, int mem, String teacher)
{
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Số cột
        mainAxisSpacing: 0.0, // Khoảng cách giữa các hàng
        crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
        childAspectRatio: 2, // Tỷ lệ giữa chiều rộng và chiều cao
      ),
      itemCount: amount,
      itemBuilder: (BuildContext context, int index) {
        return createFAB(id, '$mem', teacher);
      },
    ),
  );
}