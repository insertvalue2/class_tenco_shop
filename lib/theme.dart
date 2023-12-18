import 'package:demo_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // 앱의 두껍기 테마를 정의하는 정적 메서드
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      // 스캐폴드 배경 색상을 흰색으로 설정
      scaffoldBackgroundColor: Colors.white,
      // 앱바 테마를 정의
      appBarTheme: const AppBarTheme(
        color: Colors.white, // 앱바 배경색을 흰색으로 설정
        elevation: 0.0, // 앱바 그림자 효과를 제거
        iconTheme: IconThemeData(color: Colors.black), // 아이콘 테마를 검정색으로 설정
        titleTextStyle: TextStyle(color: Colors.black), // 타이틀 텍스트 색상을 검정색으로 설정
      ),
      // 텍스트 테마를 정의
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColor), // 대형 텍스트의 색상을 kTextColor로 설정
        bodyMedium: TextStyle(color: kTextColor), // 중형 텍스트의 색상을 kTextColor로 설정
        bodySmall: TextStyle(color: kTextColor), // 소형 텍스트의 색상을 kTextColor로 설정
      ),
      // 들어올려진 버튼 테마를 정의
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0, // 버튼 그림자 효과를 제거
          backgroundColor: kPrimaryColor, // 버튼 배경색을 kPrimaryColor로 설정
          foregroundColor: Colors.white, // 버튼 전경색을 흰색으로 설정
          minimumSize: const Size(double.infinity, 48), // 버튼의 최소 크기를 설정
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
