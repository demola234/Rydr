import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;

  final void Function(String)? onChanged;

  final void Function(String)? onSubmitted;
  const CustomTextField({
    Key? key,
    this.controller,
    this.label,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}