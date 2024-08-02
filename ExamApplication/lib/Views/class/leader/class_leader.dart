import 'dart:ui';
import 'package:examapp/Components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class Class extends StatefulWidget {
  const Class({super.key});

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  String user = "";

  @override
  void initState() {
    super.initState();
    user = "user";
    _tabControllers = TabController(length: 3, vsync: this);
    _tabControllers.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabControllers.dispose();
    super.dispose();
  }

  Widget _buildPage() {
    if (_tabControllers.index == 0) {
      return const TestPage();
    } else if (_tabControllers.index == 1) {
      return MemberPage();
    } else {
      return const ManagePage();
    }
  }

  int index() {
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
            if (a == 0)
              const Text(
                "Test",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else if (a == 1)
              const Text(
                "Member",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else
              const Text(
                "Manage",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
              tabs: const [
                Tab(text: 'Test', icon: Icon(Icons.task)),
                Tab(text: 'Member', icon: Icon(Icons.people)),
                Tab(text: 'Manage', icon: Icon(Icons.manage_accounts)),
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

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          const Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 40,
                child: SearchBar(
                  leading: Icon(Icons.search),
                  hintText: "ID test",
                  controller: null,
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 10.0)),
                ),
              ),
              FloatingActionButton(
                onPressed: null,
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          listTest(15, "1111", 56)
        ]);
  }
}

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  List<String> entries = <String>['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        const Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 40,
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "ID test",
                controller: null,
                padding: MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 10.0)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ]),
    );
  }
}

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
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

Widget fabTest(String id, String time) {
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
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Members: $time",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ));
}

Widget listTest(int amount, String id, int time) {
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
        return fabTest(
          id,
          '$time',
        );
      },
    ),
  );
}
