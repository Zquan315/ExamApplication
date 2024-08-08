
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/painting/box_decoration.dart';

import '../member/test_page.dart';
import 'history_page.dart';
class MainMember extends StatefulWidget {

  const MainMember({super.key});

  @override
  State<MainMember> createState() => _MainMemberState();
}

class _MainMemberState extends State<MainMember> with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  String user = "";

  @override
  void initState() {
    super.initState();
    user = "user";
    _tabControllers = TabController(length: 2, vsync: this);
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
      return const TestPage();
    }
    else {
      return const HistoryPage();
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
                "Test",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
            else if( a== 1)
              const Text(
                "History",
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
                Tab(text: 'Test', icon: Icon(Icons.note_alt)),
                Tab(text: 'History', icon: Icon(Icons.history)),
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
