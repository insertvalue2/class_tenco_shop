import 'package:demo_commerce_app/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

// WidgetBuilder 이 함수는 라우트가 생성될 때 호출되며 해당 라우트에 표시할 위젯을 반환합니다.
// WidgetBuilder는 Flutter에서 사용되는 콜백 함수 입니다.
// WidgetBuilder는 주어진 컨텍스트에서 위젯을 빌드하는 함수
// BuildContext를 매개변수로 받아 해당 위치에서 필요한 위젯을 생성하고 반환
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen()
};
