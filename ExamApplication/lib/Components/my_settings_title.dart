import 'package:flutter/material.dart';

class MySettingsTitle extends StatelessWidget {
  final String title;
  final Widget action;
  const MySettingsTitle({super.key, required this.title, required this.action});

  //Build UI
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only( bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            action,
          ],
        ),
      ),
    );
  }
}
