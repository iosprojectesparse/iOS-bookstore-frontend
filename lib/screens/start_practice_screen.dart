//Starting test button screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/practice_questions.dart';
import 'package:mayaamind/screens/test_screen.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'dashboard_screen.dart';

class StartPracticeTest extends StatefulWidget {
  const StartPracticeTest({Key? key, required this.practiceOrTest})
      : super(key: key);
  final bool practiceOrTest;

  @override
  State<StartPracticeTest> createState() => _StartPracticeTestState();
}

class _StartPracticeTestState extends State<StartPracticeTest> {
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
    ProviderState providerstate = Provider.of<ProviderState>(context);

    return Scaffold(
      backgroundColor: const Color(0xffFDF7F2),
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.practiceOrTest?providerstate.startcalibration:providerstate.starttest,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff212121)),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
            child: const Icon(
              Icons.info_rounded,
              color: Color(0xff212121),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
      ),
      body: !isInternet
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
      :Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (!widget.practiceOrTest) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PracticeQuestionScreen(
                                      totalNumberOfQuestions: 3,
                                      test: false,
                                    )));
                      } else {
                        timer?.cancel();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TestScreen()));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff212121),
                          borderRadius: BorderRadius.circular(10)),
                      width: queryData.size.width * 0.7,
                      height: 40,
                      child: Center(
                          child: !widget.practiceOrTest
                              ? Text(
                                  providerstate.startpractice,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              : Text(
                                  providerstate.startcalibration,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      timer?.cancel();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const DashBoard()));
                    },
                    child: Text(
                      providerstate.notnow,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff212121)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.practiceOrTest?true:false,
            child: const BottomFooter(),
          )
        ],
      ),
    );
  }
}
