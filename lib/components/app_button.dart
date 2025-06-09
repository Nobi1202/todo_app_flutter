import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_color_path.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const AppButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorPath.lightBlue,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColorPath.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
