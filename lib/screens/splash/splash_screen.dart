import 'package:demo_commerce_app/constants.dart';
import 'package:demo_commerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:demo_commerce_app/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to TenCo Shop, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround Korean",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]['image'],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => AnimatedContainer(
                      duration: kAnimationDuration,
                      margin: const EdgeInsets.only(right: 5),
                      height: 6,
                      width: currentPage == index ? 20 : 6,
                      decoration: BoxDecoration(
                          color: currentPage == index
                              ? kPrimaryColor
                              : const Color(0xFFD8D8D8),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // 차이점 살펴 보기
                    //Navigator.pushNamed(context, SignInScreen.routeName);

                    // 현재 페이지에서 새로운 페이지로 이동하면서 히스토리를 모두 비우기
                    // (route) => false
                    Navigator.pushNamedAndRemoveUntil(
                        context, SignInScreen.routeName, (route) => false);
                  },
                  child: const Text('Continue'),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
