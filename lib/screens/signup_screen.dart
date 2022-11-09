import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/utils/app_images.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/ui_helper.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
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
              UiHelper.verticalSpace(vspace: Spacing.xlarge),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              UiHelper.verticalSpace(vspace: Spacing.medium),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Enter your username",
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              UiHelper.verticalSpace(vspace: Spacing.medium),
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
                  textInputAction: TextInputAction.next),
              UiHelper.verticalSpace(vspace: Spacing.medium),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
              ),
              UiHelper.verticalSpace(vspace: Spacing.medium),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      String res = await AuthMethods().signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                          bio: _bioController.text);
                      debugPrint(res);
                    },
                    child: Text("Sign Up")),
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
                    const Text("Already have an account?"),
                    UiHelper.horizontaSpace(hspace: Spacing.small),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()));
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(color: AppColors.blueColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
