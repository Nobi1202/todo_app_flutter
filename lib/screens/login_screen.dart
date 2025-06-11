import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/components/app_button.dart';
import 'package:todo_app/components/app_text_field.dart';
import 'package:todo_app/constants/app_color_path.dart';
import 'package:todo_app/constants/app_image_path.dart';
import 'package:todo_app/screens/dashboard_screen.dart';
import 'package:todo_app/screens/registration_screen.dart';
import 'package:todo_app/screens/widgets/blue_circle_img_appbar_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPath.lightWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBlueCircleImgWidget(),
            const SizedBox(height: 20),
            _buildWelcomBackTextWidget(),
            const SizedBox(height: 10),
            _buildPersonImageWidget(),
            const SizedBox(height: 40),
            ..._buildListTextFieldWidget(),
            const SizedBox(height: 20),
            _buildForgetPasswordTextWidget(),
            const SizedBox(height: 20),
            _buildSignInButtonWidget(),
            const SizedBox(height: 20),
            _buildSignUpTextWidget(),
          ],
        ),
      ),
    );
  }

  Row _buildBlueCircleImgWidget() {
    return const Row(
      children: [BlueCircleImgAppbarWidget()],
    );
  }

  Text _buildWelcomBackTextWidget() {
    return const Text(
      'Welcome back!',
      style: TextStyle(
          fontFamily: 'PopPins', fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  DottedBorder _buildPersonImageWidget() {
    return DottedBorder(
      padding: const EdgeInsets.all(24),
      color: Colors.grey.shade400,
      strokeWidth: 2,
      dashPattern: const [8, 4],
      child: SvgPicture.asset(AppImagePath.personInPhoneImg),
    );
  }

  List<Widget> _buildListTextFieldWidget() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppTextField(
          textEditingController: _emailController,
          hintText: 'Enter your email',
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppTextField(
          textEditingController: _passwordController,
          hintText: 'Enter your password',
        ),
      ),
    ];
  }

  InkWell _buildForgetPasswordTextWidget() {
    return InkWell(
      onTap: () {},
      child: const Text(
        'Forget Password',
        style: TextStyle(
          fontFamily: 'PopPins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColorPath.lightBlue,
        ),
      ),
    );
  }

  Padding _buildSignInButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        ),
        title: 'Sign In',
      ),
    );
  }

  Row _buildSignUpTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account ? ',
          style: TextStyle(
            fontFamily: 'PopPins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColorPath.black,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegistrationScreen(),
            ),
          ),
          child: const Text(
            'Sign Up ',
            style: TextStyle(
              fontFamily: 'PopPins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColorPath.lightBlue,
            ),
          ),
        )
      ],
    );
  }
}
