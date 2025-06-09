import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/components/app_button.dart';
import 'package:todo_app/constants/app_image_path.dart';
import 'package:todo_app/screens/registration_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildBlueCicleImgWidget(),
          const SizedBox(height: 40),
          _buildPersonPhoneImgWidget(),
          const SizedBox(height: 40),
          _buildTodoTextWidget(),
          const SizedBox(height: 40),
          _buildTodoDescriptionTextWidget(),
          const Spacer(),
          _buildGetStartedButtonWidget(context),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Row _buildBlueCicleImgWidget() {
    return Row(
      children: [
        SvgPicture.asset(
          AppImagePath.blueCircleImg,
          height: 200,
          width: 200,
        )
      ],
    );
  }

  SvgPicture _buildPersonPhoneImgWidget() {
    return SvgPicture.asset(
      AppImagePath.personIphoneImg,
      height: 170,
      width: 170,
    );
  }

  Padding _buildTodoTextWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Gets things done with TODO',
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'PopPins'),
      ),
    );
  }

  Padding _buildTodoDescriptionTextWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        textAlign: TextAlign.center,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.',
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'PopPins'),
      ),
    );
  }

  Padding _buildGetStartedButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegistrationScreen(),
          ),
        ),
        title: 'Get Started',
      ),
    );
  }
}
