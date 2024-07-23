import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      this.onChanged,
      this.hintText,
      this.obscureText,
      this.isNumber, this.controller});

  final Function(String)? onChanged;
  final String? hintText;
  final bool? obscureText;
  final bool? isNumber;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText ?? false,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return 'field is reqired';
        //   }
        //   return null;
        // },
        keyboardType:
            isNumber == true ? TextInputType.number : TextInputType.text,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(16)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}
