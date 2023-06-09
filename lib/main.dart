import 'package:bk_flutter/home.dart';
import 'package:bk_flutter/master.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'detail.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AnimatedSplashScreen(
            centered: true,
            duration: 5000,
            backgroundColor: Color.fromARGB(255, 49, 78, 207),
            splash: Container(
                child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 35, left: 18),
                  child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_fetkcs3q.json',
                  ),
                ),
                Image.asset('assets/images/Logo.png'),
              ],
            )),
            nextScreen: HomePage(),
            splashTransition: SplashTransition.sizeTransition,
            pageTransitionType: PageTransitionType.fade,
          ),
        ));
  }
}
