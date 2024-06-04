
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/start_practice_screen.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import 'dashboard_screen.dart';

class InstructionScreen2 extends StatefulWidget {
  const InstructionScreen2({Key? key}) : super(key: key);

  @override
  State<InstructionScreen2> createState() => _InstructionScreen2State();
}

class _InstructionScreen2State extends State<InstructionScreen2> with WidgetsBindingObserver{

  late AudioPlayer audioPlayer = AudioPlayer();
  bool isInternet = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
        print(hasInternet);
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused){
      audioPlayer.stop();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    audioPlayer.stop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    void navigatingFunction() {
      audioPlayer.stop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const StartPracticeTest(practiceOrTest: false)));
    }

    return Scaffold(
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
      :SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: queryData.size.width * 0.8,
                  height: queryData.size.height * 0.5,
                  child: ClipRRect(
                    child: Image.asset("images/instruction/spec.gif"),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: const Color(0xff212121),
              //       borderRadius: BorderRadius.circular(10)),
              //   width: queryData.size.width * 0.7,
              //   height: 40,
              //   child: Center(
              //     child: Text(
              //       Provider.of<ProviderState>(context).instruction,
              //       style: const TextStyle(
              //           fontSize: 24,
              //           fontWeight: FontWeight.w600,
              //           color: Colors.white),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: queryData.size.height * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        providerstate.spec,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  audioPlayer.stop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StartPracticeTest(practiceOrTest: false)));
                },
                child: Container(
                  width: queryData.size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54, width: 1),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      providerstate.beginpractice,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  audioPlayer.stop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                },
                child: Center(
                  child: Text(
                    providerstate.skippractice,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
