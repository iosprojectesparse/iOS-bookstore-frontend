import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/practice_test.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'eye_calibration.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool isInternet = true;
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool _isListening = false;
  bool available = false;
  late String _textSpeech;
  bool isPressed = false;
  bool voiceCalibre = false;
  late bool voiceCalibreSuccessful;
  int _noOfTimes = 0;
  String baseText =
      "The cat always hides";
  String _text = 'Press the button and start speaking';
  String _text11 = 'The cat always hides';

  void onListen() async {
    if (!_isListening) {
      available = await _speech.initialize();

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
            onResult: (val) => setState(() {
                  _textSpeech = val.recognizedWords;
                  _text = val.recognizedWords;
                  _isListening = false;
                  if (_textSpeech == "yes or no") {
                    print(_textSpeech);
                    voiceCalibre = true;
                    isPressed = true;
                    _noOfTimes += 1;
                  } else {
                    voiceCalibre = false;
                    isPressed = true;
                  }
                }));
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

  void navigatingFunction() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PracticeScreen(
                  totalNumberOfQuestions: 40,
                  test: true,
                )));
  }

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

    void next() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PracticeScreen(
                    totalNumberOfQuestions: 40,
                    test: true,
                  )));
    }

    void _listen() async {
      if (!_isListening) {
        bool available = await _speech.initialize(
          onStatus: (val) => {print('onStatus: $val')},
          onError: (val) => print('onError: $val'),
        );

        if (available) {
          setState(() => _isListening = true);
          _speech.listen(
            onResult: (val) => setState(() {
              _text = val.recognizedWords;
              print(_text);
              if (_text11.toLowerCase() == _text.toLowerCase()) {
                _isListening = false;
                isPressed = true;
                voiceCalibre = true;
                _speech.stop();
              }
              else{
                isPressed = true;
                voiceCalibre = false;
                _isListening = false;
              }
              // if (val.hasConfidenceRating && val.confidence > 0) {
              //   _confidence = val.confidence;
              // }
            }),
          );
        }
      }
      else {
        _isListening = false;
        if (_text11.toLowerCase() != _text.toLowerCase()) {
          const snackBar = SnackBar(
            content: Text('Voice Calibration failed. Try Again!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            isPressed = false;
            _isListening = false;
          });
          // isPressed = true;
          // voiceCalibre = true;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const PracticeScreen(
          //               totalNumberOfQuestions: 40,
          //               test: true,
          //             )));
        // } else {
        //   const snackBar = SnackBar(
        //     content: Text('Voice Calibration failed. Try Again!'),
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }

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
          const SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
            child: const Icon(
              Icons.info_rounded,
              color: Color(0xff212121),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EyeCallibrationScreen()));
          },
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Image(image: AssetImage("images/icons/right.png")),
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
                      child: Image.asset("images/icons/noInternet.png"),
                    ),
                    const Text(
                      "No Internet Access",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          child: Image.asset(
                              "images/test_question_imogi/Vector.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          providerstate.voicecalibration,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Color(0xff212121)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          providerstate.pressmic,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xff212121)),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   width: queryData.size.width * 0.8,
                      //   child: Text(
                      //     _text,
                      //     style: const TextStyle(
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 14,
                      //         color: Colors.black45),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.8,
                        child: Text(
                          providerstate.calibrationsentence,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.05,
                      ),
                      Center(
                        child: SizedBox(
                          height: queryData.size.height * 0.2,
                          width: queryData.size.width * 0.2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape:
                                    const CircleBorder(side: BorderSide.none)),
                            onPressed: _listen,
                            child: Icon(
                              _isListening ? Icons.mic : Icons.mic_off,
                              size: 38,
                              color: const Color(0xFFFDF7F2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Visibility(
                        visible: isPressed,
                        child: SizedBox(
                            child: voiceCalibre
                                ? Text(
                                    providerstate.voiceresult1,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff04CC00)),
                                  )
                                : Text(
                                    providerstate.voiceresult2,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFF6969)),
                                  )),
                      ),
                      /*TestPracticeButton(
                  function: navigatingFunction,
                ),*/
                    ],
                  ),
                ),
                const Align(
                    alignment: Alignment.bottomCenter, child: BottomFooter())
              ]),
      ),
    );
  }
}
