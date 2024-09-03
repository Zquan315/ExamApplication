import 'dart:ui';
import 'package:examapp/Views/class/leader/manager_page.dart';
import 'package:examapp/Views/class/leader/member_page.dart';
import 'package:examapp/Views/class/leader/test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MainLeader extends StatefulWidget {
  const MainLeader({super.key});

  @override
  State<MainLeader> createState() => _MainLeaderState();
}

class _MainLeaderState extends State<MainLeader>
    with SingleTickerProviderStateMixin {
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
      return const MemberPage();
    } else {
      return const ManagerPage();
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
                "Bài kiểm tra",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else if (a == 1)
              const Text(
                "Thành viên",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else
              const Text(
                "Quản lý",
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
                Tab(text: 'Bài kiểm tra', icon: Icon(Icons.task)),
                Tab(text: 'Thành viên', icon: Icon(Icons.people)),
                Tab(text: 'Quản lý', icon: Icon(Icons.manage_accounts)),
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
