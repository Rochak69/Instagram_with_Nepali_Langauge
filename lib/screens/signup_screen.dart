import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/utils/app_images.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/ui_helper.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            const TextFieldInput(
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress),
            UiHelper.verticalSpace(vspace: Spacing.medium),
            const TextFieldInput(
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
                      onTap: () {},
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
