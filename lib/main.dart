import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/reponsive/mobile_screen_layout.dart';
import 'package:instagram/reponsive/responsive.dart';
import 'package:instagram/reponsive/web_screen_layout.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyANab3o_767Ij-QRnXt3_Jh3LSwxo1cEZ4",
        appId: "1:389928649111:web:187f22be282498aa8604d2",
        messagingSenderId: "389928649111",
        projectId: "instagram-clone-e9318",
        storageBucket: "instagram-clone-e9318.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
      // home: ResponiveLayout(
      //     mobileScreenLayout: MobileScreenLayout(),
      //     webScreenLayout: WebScreenLayout()),
      home: const LogInScreen(),
    );
  }
}
