import 'package:demo_commerce_app/helper/keyboard.dart';
import 'package:demo_commerce_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../complete_profile/complete_profile_screen.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // 폼은 사용자의 입력값에 따라 상태를 추적하고 데이터가
  // 적절한지 유효성 검사를 해야 한다.
  // GlobalKey 키는 위젯은 전체 생명주기 동안 유지 되는 전역 키 이다.
  // 이 키를 사용하면 해당 위젯의 상태를 다른 부분에서도 접근할 수 있다. !!
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password = '12345678';
  String? conformPassword = '12345678';
  bool remember = false;
  final List<String?> errors = [];

  // 오류를 추가하는 메서드
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  // 오류를 제거하는 메서드
  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: 'devnote1@naver.com',
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: '12345678',
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: '12345678',
            obscureText: true,
            onSaved: (newValue) => conformPassword = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.isNotEmpty && password == conformPassword) {
                removeError(error: kMatchPassError);
              }
              conformPassword = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if ((password != value)) {
                addError(error: kMatchPassError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-enter your password",
              suffixIcon: Icon(Icons.lock),
            ),
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // 코드 수정 및 초기 데이터 처리
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
