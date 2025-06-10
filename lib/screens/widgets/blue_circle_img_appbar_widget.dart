import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants/app_image_path.dart';

class BlueCircleImgAppbarWidget extends StatelessWidget {
  const BlueCircleImgAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImagePath.blueCircleImg,
      height: 200,
      width: 200,
    );
  }
}
