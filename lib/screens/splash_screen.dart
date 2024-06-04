//This is the splash screen.

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'about_screen.dart';
import 'edit_profile_screen.dart';
import 'faqscreen.dart';
import 'feedback_screen.dart';
import 'first_screen.dart';
import 'instruction_screen1.dart';
import 'language_selection_screen.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInternet = true;
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    Future.delayed(Duration(seconds: 6),(){
       Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const LoginScreen()));
    });

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: SafeArea(
        child: !isInternet
      ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: queryData.size.height * 0.4,
              width: queryData.size.width * 0.4,
              child: Image.asset(
                "images/icons/noInternet.png"
              ),
            ),
            const Text(
              "No Internet Access",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      )
      :GestureDetector(
          onTap: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             const FirstScreen())); //onTap change to load
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff212121),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: queryData.size.width * 0.3,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: TextLiquidFill(
                          loadDuration: const Duration(seconds: 4),
                          text: 'Real Vision',
                          waveColor: Colors.white,
                          boxBackgroundColor: const Color(0xff212121),
                          textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w700,
                          ),
                          boxHeight: 300.0,
                        ),
                      ),
                      Center(
                        child: DelayedDisplay(
                          delay: const Duration(seconds: 4),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: ClipRRect(
                              child:
                                  Image.asset("images/logo/maayamind_logo.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Center(
//   child: SizedBox(
//     height: 200,
//     width: 200,
//     child: ClipRRect(
//       child: Image.asset("images/logo/maayamind_logo.png"),
//     ),
//   ),
// ),
