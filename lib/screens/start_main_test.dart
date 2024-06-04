//In this screen we have start main test button.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/practice_test.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'dashboard_screen.dart';

class StartMainTest extends StatefulWidget {
  const StartMainTest({ Key? key }) : super(key: key);

  @override
  _StartMainTestState createState() => _StartMainTestState();
}

class _StartMainTestState extends State<StartMainTest> {
bool isInternet = true;
  @override
  void initState() {
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    });
    super.initState();
  }
  Future result() async{
    isInternet = await InternetConnectionChecker().hasConnection;
  }
  @override
  Widget build(BuildContext context) {
    result();
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFDF7F2),
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        title:  Text(
          providerstate.starttest,
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
          SizedBox(
            width: 10,
          )
        ],
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
      ),
      body:  !isInternet
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
      : Column(
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
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PracticeScreen(
                                      totalNumberOfQuestions: 40,
                                      test: true,
                                    )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff212121),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(5, 5),
                              blurRadius: 8.0,
                              spreadRadius: 2.0
                            ),
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0
                            )
                          ]
                          ),
                      width: queryData.size.width * 0.7,
                      height: 40,
                      child: Center(
                          child: Text(
                                  providerstate.starttest,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                          ),
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
          const BottomFooter(),
        ],
      ),
    );
  }
}