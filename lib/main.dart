import 'package:flutter/material.dart';
import 'package:instagram/login.dart';
import 'package:instagram/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppColors.mobileBackgroundColor),
      home: const LogInScreen(),
    );
  }
}
