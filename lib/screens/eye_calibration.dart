import 'package:flutter/material.dart';
import 'package:mayaamind/screens/start_main_test.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';

class EyeCallibrationScreen extends StatefulWidget {
  const EyeCallibrationScreen({Key? key}) : super(key: key);

  @override
  State<EyeCallibrationScreen> createState() => _EyeCallibrationScreenState();
}

class _EyeCallibrationScreenState extends State<EyeCallibrationScreen> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 18), () async {
      setState(() {
        show = true;
      });
    });
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffFDF7F2),
      appBar: AppBar(
        leadingWidth: 50,
        centerTitle: false,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffFDF7F2),
        title: Text(
          providerstate.calibration,
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
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        providerstate.eyecalibration,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xff212121)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        providerstate.trackball,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Color(0xff212121)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        child: ClipRRect(
                          child: Image.asset("images/instruction/eyecalibration.gif"),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: show,
                      child: Column(
                        children: [
                           Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Text(
                                providerstate.eyesucess,
                                style: const TextStyle(fontSize: 28, color: Colors.green),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const StartMainTest()));
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
                                          spreadRadius: 2.0),
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0)
                                    ]),
                                width: queryData.size.width * 0.7,
                                height: 40,
                                child: Center(
                                    child: Text(
                                  providerstate.starttest,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: queryData.size.height * 0.15,)
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomFooter(),
          )
        ],
      ),
    );
  }
}
