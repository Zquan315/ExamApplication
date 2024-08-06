import 'dart:ui';

import 'package:examapp/pages/account_page.dart';
import 'package:examapp/pages/class_page.dart';
import 'package:examapp/pages/home_page.dart';
import 'package:examapp/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  String user = "";

  @override
  void initState() {
    super.initState();
    user = "user";
    _tabControllers = TabController(length: 4, vsync: this);
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
      return const HomePage();
    } else if (_tabControllers.index == 1) {
      return const ClassPage();
    } else if (_tabControllers.index == 2) {
      return const SettingsPage();
    } else {
      return const AccountPage();
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
                "Home",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else if (a == 1)
              const Text(
                "List of classes",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else if (a == 2)
              const Text(
                "Setting",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else
              const Text(
                "Account",
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
