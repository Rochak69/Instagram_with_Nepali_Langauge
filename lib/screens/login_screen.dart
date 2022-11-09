import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/app_images.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/ui_helper.dart';
import 'package:instagram/widgets/text_field_input.dart';

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
            Flexible(
              flex: 1,
              child: Container(),
            ),
            SvgPicture.asset(
              AppImages.instagramIcon,
              color: AppColors.primaryColor,
            ),
            UiHelper.verticalSpace(vspace: Spacing.xxlarge),
            TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next),
            UiHelper.verticalSpace(vspace: Spacing.medium),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Enter your password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
            UiHelper.verticalSpace(vspace: Spacing.medium),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Sign In")),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account?"),
                  UiHelper.horizontaSpace(hspace: Spacing.small),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: AppColors.blueColor),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
