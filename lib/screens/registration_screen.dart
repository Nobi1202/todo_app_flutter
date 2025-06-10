import 'package:flutter/material.dart';
import 'package:todo_app/components/app_button.dart';
import 'package:todo_app/components/app_text_field.dart';
import 'package:todo_app/constants/app_color_path.dart';
import 'package:todo_app/screens/dashboard_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/widgets/blue_circle_img_appbar_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            const SizedBox(height: 60),
            _buildWelcomeTextWidget(),
            const SizedBox(height: 20),
            _buildWelcomeDescriptionTextWidget(),
            ..._buildListTextFieldWidget(),
            const SizedBox(height: 20),
            _buildRegisterButtonWidget(),
            const SizedBox(height: 20),
            _buildSignInTextWidget(),
          ],
        ),
      ),
    );
  }

  Row _buildBlueCircleImgWidget() {
    return const Row(
      children: [
        BlueCircleImgAppbarWidget(),
      ],
    );
  }

  Padding _buildWelcomeTextWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Welcome Onboard!',
        style: TextStyle(
            fontSize: 24, fontFamily: 'PopPins', fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding _buildWelcomeDescriptionTextWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Let’s help you meet up your tasks',
        style: TextStyle(
            fontSize: 14, fontFamily: 'PopPins', fontWeight: FontWeight.normal),
      ),
    );
  }

  List<Widget> _buildListTextFieldWidget() {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
        child: AppTextField(
            textEditingController: _nameController,
            hintText: 'Enter your full name'),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: AppTextField(
            textEditingController: _emailController,
            hintText: 'Enter your email'),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: AppTextField(
            textEditingController: _passwordController,
            hintText: 'Enter password'),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: AppTextField(
            textEditingController: _confirmPasswordController,
            hintText: 'Confirm Password'),
      ),
    ];
  }

  Padding _buildRegisterButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
        title: 'Register',
      ),
    );
  }

  Row _buildSignInTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account ? ',
          style: TextStyle(
            fontFamily: 'PopPins',
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          ),
          child: const Text(
            'Sign In',
            style: TextStyle(
                fontFamily: 'PopPins',
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: AppColorPath.lightBlue),
          ),
        )
      ],
    );
  }
}
