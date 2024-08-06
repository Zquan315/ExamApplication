import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  final String name;
  final String phone;
  const Student({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Icon(Icons.person),
          Column(
            children: [Text(name), Text(phone)],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
