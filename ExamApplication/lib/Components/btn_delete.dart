import 'package:flutter/material.dart';

class BtnDelete extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final double buttonHeight;
  const BtnDelete(
      {super.key, required this.label, this.onTap, this.buttonHeight = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      width: 400,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.red),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
