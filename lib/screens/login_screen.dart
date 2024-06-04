//This is the login screen of the application.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/register_screen.dart';
import 'package:provider/provider.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/register_login_button.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver{
  bool isInternet = true;
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;
  bool key = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    print(queryData.viewInsets.top);
    NetworkingProviderState networkingproviderstate =
        Provider.of<NetworkingProviderState>(context);
    //TextEditingController _emailContoller = TextEditingController();
    // TextEditingController _passwordContoller = TextEditingController();
    print("${providerstate.welcome[0]} ${providerstate.welcome[1]}");
    audioPlayer = AudioPlayer();
    //AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
    final splitted = providerstate.language.split(' ');

    if(key){
    if(providerstate.language != "English"){
      final splitted = providerstate.language.split(' ');
      if(splitted.length > 0 && splitted[1] == "Hindi") {
        audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1n7iGntFMNS0e6qVUyWcFfAtbZy37cBOg'));
        setState(() {
          key=false;
        });
      }else if(splitted.length > 0 && splitted[1] == "Japanese"){
        audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1zm3zbHpUVA_9-S1vEKWOK-a27ffFXn1_'));
        setState(() {
          key=false;
        });
      } else{
        audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1Ydi_qH-oGtqsyf42Q65b7U5zTJ14Iuem'));
        setState(() {
          key=false;
        });
      }
    }else{
      audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1Ydi_qH-oGtqsyf42Q65b7U5zTJ14Iuem'));
      setState(() {
          key=false;
        });
    }
  }


    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            Center(
              child: SizedBox(
                height: queryData.size.height * 0.3,
                width: queryData.size.width * 0.3,
                child: ClipRRect(
                  child: Image.asset("images/logo/maayamind_logo.png"),
                ),
              ),
            ),
            Text(
              "${providerstate.welcome[0]} ${providerstate.welcome[1]}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: Colors.white),
            ),
            SizedBox(
              height: queryData.size.height * 0.02,
            ),
            SizedBox(
              width: queryData.size.width * 0.8,
              height: queryData.size.height * 0.07,
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (val) {
                  networkingproviderstate.setEmail(val);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: providerstate.email),
              ),
            ),
            SizedBox(
              height: queryData.size.height * 0.01,
            ),
            SizedBox(
              width: queryData.size.width * 0.8,
              height: queryData.size.height * 0.07,
              child: TextField(
                onChanged: (val) {
                  networkingproviderstate.setPass(val);
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: providerstate.password),
              ),
            ),
            SizedBox(
              height: queryData.size.height * 0.02,
            ),
            RegisterLoginButton(login: true),
            SizedBox(
              height: queryData.size.height * 0.002,
            ),
            SizedBox(
              width: queryData.size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      audioPlayer.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen()));
                    },
                    child: Text(
                      providerstate.forgot,
                      maxLines: 2,
                    ),
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  providerstate.donthave,
                  style: const TextStyle(color: Colors.white),
                ),
                TextButton(
                  // style: TextButton.styleFrom(
                  //     padding: EdgeInsets.all(0),
                  //     tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    audioPlayer.stop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text(providerstate.register),
                ),
                 SizedBox(
                  height: queryData.size.height *0.01,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}