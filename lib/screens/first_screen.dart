//This is the very first Screen of the application.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import 'login_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin{
  bool onchanged = false;
  late AnimationController _animationController;

  late double currentvol;
  bool isInternet = true;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    Future.delayed(Duration.zero,() async {
        currentvol = await PerfectVolumeControl.getVolume();
    });

    PerfectVolumeControl.stream.listen((volume) {
       setState(() {
         currentvol = volume;
       });
    });
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
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);


//.............................lang dropdown................................

    // DropdownButton<String> androidDropdown() {
    //   List<DropdownMenuItem<String>> dropDownItems = [];
    //   for (String i in languages) {
    //     DropdownMenuItem<String> lang = DropdownMenuItem(
    //       child: Text(
    //         i,
    //         style: const TextStyle(
    //             color: Color(0xff212121),
    //             fontSize: 20,
    //             fontWeight: FontWeight.w600),
    //       ),
    //       value: i,
    //     );
    //     dropDownItems.add(lang);
    //   }
    //
    //   return DropdownButton<String>(
    //       isDense: true,
    //       underline: const SizedBox.shrink(),
    //       style: TextStyle(color: Colors.yellow),
    //       items: dropDownItems,
    //       hint: Text(
    //         providerstate.langString,
    //         style: const TextStyle(
    //             color: Color(0xff212121),
    //             fontSize: 20,
    //             fontWeight: FontWeight.w600),
    //       ),
    //       value:
    //           !onchanged ? null : Provider.of<ProviderState>(context).language,
    //       onChanged: (value) {
    //         onchanged = true;
    //         Provider.of<ProviderState>(context, listen: false)
    //             .translate(value!);
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => LoginScreen()));
    //       });
    // }

    //.............................end lang dropdown................................

    Future<double> volume = PerfectVolumeControl.getVolume();
    return Scaffold(
      backgroundColor: const Color(0xff212121),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: queryData.size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              height: queryData.size.height * 0.48,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 180, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          "images/register_screen_images/regimg1.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 100, 20, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          "images/register_screen_images/regimg3.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 20, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          "images/register_screen_images/regimg2.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 40, 20, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          "images/register_screen_images/regimg4.png"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                Provider.of<ProviderState>(context).heading1,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20.0, right: 20),
              child: Text(
                Provider.of<ProviderState>(context).wehelp,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: queryData.size.height * 0.01,
            ),
            // Center(
            //   child: BlinkText(
            //     "${providerstate.volume} 🔊",
            //     style:
            //         const TextStyle(fontSize: 18.0, color: Color(0xffFDF7F2)),
            //     beginColor: Colors.white,
            //     endColor: Colors.black12,
            //     duration: const Duration(seconds: 2),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: queryData.size.width * 0.15,
                  height: queryData.size.height * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                    )
                  ),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                        context:  context,
                        builder: (context) => AlertDialog(
                          title: const Text("Please Turn Volume Up"),
                          content: const Text("This will help for audio instruction"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                Navigator.pop(context);
                               PerfectVolumeControl.setVolume(currentvol + 0.05);
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
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
                        height: queryData.size.height * 0.05,
                        width: queryData.size.width *0.05,
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color(0xFF212121),
                          shape: BoxShape.circle
                        ),
                        child: const Icon(Icons.volume_up_outlined,color: Color(0xFFFDF7F2)),
                      ),
                    ),
                  ),
                )
              ],
            ),
             SizedBox(
              height: queryData.size.height * 0.01,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      width: queryData.size.width * 0.75,
                      height: queryData.size.width * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(
                            top: BorderSide(width: 1, color: Colors.white),
                            bottom: BorderSide(width: 1, color: Colors.white),
                            left: BorderSide(width: 1, color: Colors.white),
                            right: BorderSide(width: 1, color: Colors.white)),
                      ),
                      child: Center(
                          child: Text(providerstate.selectlanguage,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff212121),
                              ))),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   width: queryData.size.width * 0.5,
            //   child: Center(child: androidDropdown()),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: const Color(0xffFDF7F2),
            //   ),
            // ),
            SizedBox(
              height: queryData.size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
