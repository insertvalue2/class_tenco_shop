import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  // List<String?> errors는 런타임에 동적으로 변경될 수 있는 리스트이기 때문에, 이를 상수 생성자에서 사용할 수 없습니다.
  final List<String?> errors;
  // 단일 라인 생성자 - 컴파일러는 자동으로 필드를 초기화하는 코드를 생성해줍니다.
  // Dart의 상수 생성자는 컴파일 타임에 이미 알려진 값만 사용할 수 있습니다.
  // 따라서, 상수 생성자에서는 런타임에 계산되는 표현식이나 동적인 값으로 부모 클래스를 초기화할 수 없습니다.
  // 단일 라인 생성자에서는 부모 클래스의 초기화를 수행하기 위해 이니셜라이저 리스트를 사용하는 것이 일반적입니다.
  const FormError({required this.errors, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/error.svg",
          height: 16,
          width: 16,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }
}
