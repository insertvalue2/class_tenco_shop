import 'package:demo_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatefulWidget {
  // Dart에서 const 생성자를 사용할 때는 몇 가지 규칙이 있습니다
  // const 생성자를 사용할 때는 해당 클래스의
  // 모든 필드가 final이거나 const로 선언되어야 합니다.
  // 또한 const 생성자의 모든 매개변수와 필드는 상수여야 합니다.
  //const 상위 클래스의 생성자 호출은 클래스의 초기화 리스트에서만 수행되어야 합니다.
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;
  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          "Tenco",
          style: TextStyle(
            fontSize: 32,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // widget 키워드를 통해 SplashContent 위젯의 인스턴스 변수에 접근이 가능
        // widget.text는 SplashContent의 text 필드에 해당
        Text(widget.text ?? ""),
        const Spacer(flex: 2),
        Image.asset(
          widget.image!, // 강제
          height: 265,
          width: 235,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
