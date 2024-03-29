import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label:AppText.small(label, color: Colors.blue),
          border: InputBorder.none,
        ),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
