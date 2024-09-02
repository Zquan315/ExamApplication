import 'package:flutter/material.dart';

class dropDownMenu extends StatefulWidget {
  final List<String> list;
  final TextEditingController controller;

  const dropDownMenu({
    super.key,
    required this.list,
    required this.controller,
  });

  @override
  State<dropDownMenu> createState() => _dropDownMenuState();
}

class _dropDownMenuState extends State<dropDownMenu> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
    widget.controller.text = dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            dropdownValue = newValue;
            widget.controller.text = dropdownValue; // Cập nhật giá trị controller
          });
        }
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Icon(
                value == 'Male' ? Icons.male : Icons.female,
                color: value == 'Male' ? Colors.blue : Colors.pink,
              ),
              const SizedBox(width: 25),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: value == 'Male' ? Colors.blue : Colors.pink,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
