//This is the FAQ Screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import '../widgets/BulletPointedText.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
    final fieldText = TextEditingController();
    Object? val;

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        title: Center(
          child: Text(
            providerstate.faq,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        actions:  [
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
        backgroundColor: const Color(0xff212121),
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
      :Stack(
          children: [SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: queryData.size.height *0.05,
                      ),
                      Text(
                        providerstate.faq1,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        "${providerstate.answer} :",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: queryData.size.height *0.01,
                      ),
                      BulletPointedText(
                          text: providerstate.faqans[0] + providerstate.faqans[1], colr: Colors.white),
                      BulletPointedText(
                          text: providerstate.faqans[2], colr: Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        providerstate.faq2,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.02
                        ),
                      Text(
                        "${providerstate.answer} :",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.01,
                      ),
                      BulletPointedText(
                          text: providerstate.faqans[3], colr: Colors.white),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        providerstate.faq3,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        "${providerstate.answer} :",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.01,
                      ),
                      BulletPointedText(text: providerstate.faqans[3], colr: Colors.white),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        providerstate.faq4,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        "${providerstate.answer} :",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.01,
                      ),
                      BulletPointedText(
                          text: providerstate.faqans[4], colr: Colors.white),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        providerstate.faq5,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      ),
                      Text(
                        "${providerstate.answer} :",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                       SizedBox(
                        height: queryData.size.height *0.01,
                      ),
                      BulletPointedText(
                        text: providerstate.faqans[5],
                        colr: Colors.white,
                      ),
                      BulletPointedText(
                          text: providerstate.faqans[6], colr: Colors.white),
                      BulletPointedText(
                          text: providerstate.faqans[7], colr: Colors.white),
                       SizedBox(
                        height: queryData.size.height *0.02,
                      )
                    ],
                  ),
                ),
                SizedBox(
                            height: queryData.size.height*0.2,
                          )
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomFooter(),
          )
          ]
        ),
      ),
    );
  }
}
