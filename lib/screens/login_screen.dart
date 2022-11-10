import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/app_images.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/ui_helper.dart';
import 'package:instagram/widgets/text_field_input.dart';

import '../utils/language_constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(flex: 1, child: Container()),
            _buildInstagramLogo(),
            UiHelper.verticalSpace(vspace: Spacing.xxlarge),
            _buildEmailTextField(),
            UiHelper.verticalSpace(vspace: Spacing.medium),
            _buildPasswordInputField(),
            UiHelper.verticalSpace(vspace: Spacing.medium),
            _buildButton(),
            Flexible(flex: 1, child: Container()),
            _buildBottomText(context)
          ],
        ),
      ),
    ));
  }

  _buildInstagramLogo() {
    return SvgPicture.asset(
      AppImages.instagramIcon,
      color: AppColors.primaryColor,
    );
  }

  _buildEmailTextField() {
    return TextFieldInput(
        textEditingController: _emailController,
        hintText: translation(context).enterYourEmail,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next);
  }

  _buildPasswordInputField() {
    return TextFieldInput(
      textEditingController: _passwordController,
      hintText: translation(context).enterYourPassword,
      textInputType: TextInputType.text,
      isPass: true,
    );
  }

  _buildButton() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {}, child: Text(translation(context).logIn)),
    );
  }

  _buildBottomText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(translation(context).dontHaveAnAccount),
          UiHelper.horizontaSpace(hspace: Spacing.small),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: Text(
                translation(context).signUp,
                style: const TextStyle(color: AppColors.blueColor),
              ))
        ],
      ),
    );
  }
}
