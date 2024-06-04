//In this Screen we are showing About Us Screen.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pro_state_mangement.dart';
import 'bottom_footer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

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
            providerstate.about,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        actions: const [
          Icon(
            Icons.info_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 4,
        backgroundColor: const Color(0xff212121),
      ),
      body: SafeArea(
          child:!isInternet
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
      : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                          SizedBox(
                            width: queryData.size.width,
                            child: ClipRRect(
                              child: Image.asset("images/instruction/about.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                            child: Text(
                              Provider.of<ProviderState>(context).heading1,
                              style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20),
                            child: Text(
                              Provider.of<ProviderState>(context).cleanervision,
                              maxLines: 2,
                              style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              providerstate.aboutsen1,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              providerstate.aboubtsen2,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              providerstate.aboutsen3,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: Row(
                              children: [
                                Text(
                                  providerstate.aboutsen4,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "www.maya-mind.com",
                                    style: TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()..onTap =() {
                                      launch('www.maya-mind.com');
                                    }
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: queryData.size.height*0.2,
                          )
                        ]),
                  ),
      const Align(
        alignment: Alignment.bottomCenter,
        child: BottomFooter())
                ],
              ),
              ),
    );
  }
}
