import 'package:flutter/material.dart';

// BuildContext를 사용하여 현재 화면에서 키보드를 감추는 유틸리티 클래스
// 화면 간 전환이나 특정 액션에 의해 키보드가 자동으로 감춰져야 하는 경우 사용
class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    // BuildContext를 사용하여 현재 포커스 스코프를 가져오고,
    // 이를 currentFocus 변수에 할당합니다
    FocusScopeNode currentFocus = FocusScope.of(context);

    //현재 포커스 스코프가 주 포커스를 가지고 있지 않으면,
    // unfocus() 메서드를 호출하여 현재 포커스를 해제합니다.
    // 즉, 현재 키보드에 포커스가 있는 경우에만 포커스를 해제하고 키보드를 감춥니다.
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
