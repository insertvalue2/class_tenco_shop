import 'package:demo_commerce_app/routes.dart';
import 'package:demo_commerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:demo_commerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:demo_commerce_app/screens/splash/splash_screen.dart';
import 'package:demo_commerce_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-commerce template',
      theme: AppTheme.lightTheme(context),
      // 앱이 시작될 때 초기에 보여질 라우트
      initialRoute: SignInScreen.routeName,
      // 앱의 라우트 매핑 정보가 정의된 routes.dart 파일을 참조
      routes: routes,
    );
  }
}
