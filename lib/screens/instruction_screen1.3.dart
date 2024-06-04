//This is the 3rd Instruction Screen.

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import '../widgets/BulletPointedText.dart';
import '../widgets/test_practice_button.dart';
import 'dashboard_screen.dart';
import 'instruction_screen1.4.dart';

class InstructionScreen13 extends StatefulWidget {
  const InstructionScreen13({Key? key}) : super(key: key);

  @override
  State<InstructionScreen13> createState() => _InstructionScreen13State();
}

class _InstructionScreen13State extends State<InstructionScreen13> with WidgetsBindingObserver{
  late AudioPlayer audioPlayer;
  bool isInternet = true;
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
      if (state == AppLifecycleState.paused) {
        audioPlayer.stop();
      }
    }
    @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    void navigatingFunction() {
      audioPlayer.stop();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InstructionScreen14()));
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
      :Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: queryData.size.width * 0.9,
                height: queryData.size.height * 0.5,
                child: ClipRRect(
                  child: Image.asset("images/instruction/single.jpg"),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff212121),
                  borderRadius: BorderRadius.circular(10)),
              width: queryData.size.width * 0.7,
              height: 60,
              child: Center(
                child: Text(
                  Provider.of<ProviderState>(context).instruction,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BulletPointedText(
                            text: providerstate.instruction133[0],
                            colr: Colors.black),
                        BulletPointedText(
                            text: providerstate.instruction133[1],
                            colr: Colors.black),
                        BulletPointedText(
                            text: providerstate.instruction133[2],
                            colr: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      providerstate.skip,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                // TextButton(
                //   child: Icon(Icons.surround_sound),
                //   onPressed: () {
                //     // final player = AudioCache();
                //     // player.play("audio/Dartmouth College");
                //   },
                // ),
                TestPracticeButton(
                  function: navigatingFunction,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
