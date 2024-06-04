//This is the Evaluation History Screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import '../widgets/report.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';

class EvaluationHistoryScreen extends StatefulWidget {
  const EvaluationHistoryScreen({Key? key}) : super(key: key);

  @override
  State<EvaluationHistoryScreen> createState() => _EvaluationHistoryScreenState();
}

class _EvaluationHistoryScreenState extends State<EvaluationHistoryScreen> {
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
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Center(
            child: Text(
              providerstate.evaluationhistory,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff212121)),
            ),
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
              width: queryData.size.width * 0.01,
            )
          ],
          elevation: 4,
          backgroundColor: const Color(0xffFDF7F2),
        ),
        backgroundColor: const Color(0xffFDF7F2),
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
      :Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: const [
                    Report(
                      number: 1,
                    ),
                    Report(
                      number: 2,
                    ),
                    Report(
                      number: 3,
                    ),
                    Report(
                      number: 4,
                    ),
                    Report(
                      number: 5,
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomFooter(),
              )
            ],
          ),
        ));
  }
}
