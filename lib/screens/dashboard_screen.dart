//Here We are declaring Dashboard Screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/test_screen.dart';
import 'package:provider/provider.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'evaluation_history_screen.dart';
import 'faqscreen.dart';
import 'longitudinal_evaluation_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  bool isInternet = true;

  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
        print(isInternet);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    NetworkingProviderState networkingproviderstate =
        Provider.of<NetworkingProviderState>(context);

    return Scaffold(
      backgroundColor: const Color(0xffFDF7F2),
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          providerstate.dashboard,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff212121)),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
            child: Icon(
              Icons.info_rounded,
              color: Color(0xff212121),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
      ),
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
      :Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${providerstate.hello} ${networkingproviderstate.uName}!",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: queryData.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TestScreen()));
                          },
                          child: SizedBox(
                            width: queryData.size.width * 0.4,
                            height: queryData.size.height * 0.2,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          child:
                                              Image.asset("images/icons/icon1.png"),
                                        )),
                                    Text(
                                      providerstate.beginevaluation,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EvaluationHistoryScreen()));
                          },
                          child: SizedBox(
                            width: queryData.size.width * 0.4,
                            height: queryData.size.height * 0.2,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          child:
                                              Image.asset("images/icons/icon2.png"),
                                        )),
                                     Text(
                                      providerstate.evaluationhistory,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LongitudinalEvaluationScreen()));
                          },
                          child: SizedBox(
                            width: queryData.size.width * 0.4,
                            height: queryData.size.height * 0.2,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          child:
                                              Image.asset("images/icons/icon3.png"),
                                        )),
                                     Text(
                                      providerstate.longitudinalevaluation,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          child: SizedBox(
                            width: queryData.size.width * 0.4,
                            height: queryData.size.height * 0.2,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          child:
                                              Image.asset("images/icons/icon4.png"),
                                        )),
                                     Text(
                                      providerstate.neurologyconsult,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutScreen()));
                          },
                          child: SizedBox(
                            width: queryData.size.width * 0.4,
                            height: queryData.size.height * 0.2,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          child:
                                              Image.asset("images/icons/icon5.png"),
                                        )),
                                    Text(
                                      providerstate.about,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FAQScreen()));
                          },
                          child: SizedBox(
                            width: queryData.size.width * 0.4,
                            height: queryData.size.height * 0.2,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          child:
                                              Image.asset("images/icons/icon6.png"),
                                        )),
                                     Text(
                                      providerstate.faq,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const BottomFooter()
          ],
        ),
      ),
    );
  }
}
