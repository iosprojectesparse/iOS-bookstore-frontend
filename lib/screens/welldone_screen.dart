//Well done screen after test.

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/test_questions.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'dashboard_screen.dart';

class WellDoneScreen extends StatefulWidget {
  const WellDoneScreen({Key? key}) : super(key: key);

  @override
  State<WellDoneScreen> createState() => _WellDoneScreenState();
}

class _WellDoneScreenState extends State<WellDoneScreen> with WidgetsBindingObserver{
  bool isInternet = true;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      audioPlayer.stop();
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    audioPlayer = AudioPlayer();

    if(providerstate.language != "English"){
      final splitted = providerstate.language.split(' ');
      if(splitted.length > 0 && splitted[1] == "Hindi") {
        audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1Y24JE2Ly-Xwvhei9JKzjBgZQ4jNcChMP'));
      }else if(splitted.length > 0 && splitted[1] == "Japanese"){
        audioPlayer.play(UrlSource('https://maayamind.com/instructionsaudio/Japanese/screen1.m4a'));
      } else{
        audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1zSdaI37AuygWsVKRGOITpBSYBkAjrYHi'));
      }
    }else{
      audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1zSdaI37AuygWsVKRGOITpBSYBkAjrYHi'));
    }

    void navigatingFunction() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TestQuestionScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: TextButton(
          onPressed: () {
            showDialog(
                        context:  context,
                        builder: (context) => AlertDialog(
                          title: const Text("Do you wish to leave test?"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                Navigator.pop(context);
                               WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const DashBoard()));
            });
                              },
                            ),
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ])
                      );
          },
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xff212121),
          ),
        ),
        title: Text(
                providerstate.test,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121)),
              ),
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
        actions:  [
          // Center(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       border: const Border(
          //           top: BorderSide(width: 2),
          //           bottom: BorderSide(width: 2),
          //           left: BorderSide(width: 2),
          //           right: BorderSide(width: 2)),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     width: 100,
          //     height: 30,
          //     child: Center(
          //       child: Text(
          //         "${widget.totalNumberOfQuestions - _noOfQuestions} remaining",
          //         style: const TextStyle(
          //             color: Colors.black, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 30,
          ),
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
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            onPressed: () {
              audioPlayer.stop();
              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TestQuestionScreen()));
            },
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Image(image: AssetImage("images/icons/right.png"),color: Color(0xffFDF7F2),),
          ),
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
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      providerstate.welldone,
                      style:
                          const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      providerstate.welldonedesc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
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
        ),
    );
  }
}
