//In this we are genrating results.

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'dashboard_screen.dart';

class Generating extends StatefulWidget {
  const Generating({Key? key}) : super(key: key);

  @override
  State<Generating> createState() => _GeneratingState();
}

class _GeneratingState extends State<Generating> {
  bool isInternet = true;
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState((){
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
        leading: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const DashBoard()));
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xff212121),
            ),
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          providerstate.test,
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
            Container(),
            SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      providerstate.thanks,
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(providerstate.genrating),
                    const SizedBox(
                      height: 10,
                    ),
                    DelayedDisplay(
                      delay: const Duration(seconds: 3),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashBoard()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff212121),
                              borderRadius: BorderRadius.circular(10)),
                          width: queryData.size.width * 0.4,
                          height: 40,
                          child: Center(
                            child: Text(
                              providerstate.next,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
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
