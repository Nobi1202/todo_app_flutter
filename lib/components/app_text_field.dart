import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_color_path.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const AppTextField({
    required this.textEditingController,
    required this.hintText,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColorPath.white),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
