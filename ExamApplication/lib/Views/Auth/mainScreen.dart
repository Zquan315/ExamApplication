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
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController sexController;
  const mainScreen(
      {super.key,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.sexController,});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = widget.nameController;
    emailController = widget.emailController;
    phoneController = widget.phoneController;
    sexController = widget.sexController;
    setState(() {
      print("mainScreen: ${emailController.text}");
    });
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
      return  AccountPage(nameController: nameController,
        phoneController: phoneController,
        emailController: emailController,
        sexController: sexController,);
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (a == 0)
              const Text(
                "Trang chủ",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else if (a == 1)
              const Text(
                "Danh sách lớp học",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else if (a == 2)
              const Text(
                "Cài đặt",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            else
              const Text(
                "Tài khoản",
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
                Tab(text: 'Trang chủ', icon: Icon(Icons.home)),
                Tab(text: 'Lớp', icon: Icon(Icons.class_)),
                Tab(text: 'Cài đặt', icon: Icon(Icons.settings)),
                Tab(text: 'Tài khoản', icon: Icon(Icons.account_circle)),
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
