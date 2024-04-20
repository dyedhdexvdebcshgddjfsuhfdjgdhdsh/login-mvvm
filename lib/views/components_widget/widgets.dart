
import 'package:flutter/material.dart';
import 'package:login_task/colors/appcolors.dart';

class TextFormFieldWidget extends StatelessWidget {
   TextFormFieldWidget({
    super.key,
    required this.controller,
     this.validator ,
     this.suffixIcon ,
     this.obscure=false ,
     required this.text,
     required this.prefixIcon
  });

  final TextEditingController controller;
  String? Function(String?)? validator;
   Widget? suffixIcon;
   bool obscure;
   final String text;
   Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscure,
      validator:validator ,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon:suffixIcon,
        prefixIcon:prefixIcon,
        labelText:text,
        fillColor: kWhiteColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(
              12), // Rounded corners when focused
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
          BorderRadius.circular(12), // Rounded corners
        ),
      ),
    );
  }
}
