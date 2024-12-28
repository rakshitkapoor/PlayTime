import 'package:flutter/material.dart';
import 'package:tictacktoe/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.controller,required this.hintText,this.isReadOnly=false});
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 2
          )
        ]
      ),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration:  InputDecoration(
          fillColor: bg,
          filled: true,
          hintText: hintText,
          border: InputBorder.none
        ),
      ),
    ) ;
  }
}