import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Enter...',
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}
