import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mayaamind/screens/start_practice_screen.dart';
import 'package:mayaamind/screens/welldone_screen.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';


import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'dashboard_screen.dart';

class PracticeQuestionScreen extends StatefulWidget {
  const PracticeQuestionScreen(
      {Key? key, required this.totalNumberOfQuestions, required this.test})
      : super(key: key);

  final bool test;
  final int totalNumberOfQuestions;

  @override
  State<PracticeQuestionScreen> createState() => _PracticeQuestionScreenState();
}

int seconds = 0;
Timer? timer;
int _noOfQuestions = 0;
int _imageNO = Random().nextInt(40) + 1;
bool whyWrong = false;

void random() {
  _imageNO = Random().nextInt(40) + 1;
}

void sequential() {
  _imageNO = 1;
}

bool answer = true;
bool isPressed = false;
stt.SpeechToText _speech = stt.SpeechToText();
bool _isListening = false;
bool available = false;
String _textSpeech =
    "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
    var topis = 95.0;
    var leftis = 85.0;
    var sizeis = 200.0;
    bool showIcons = true;

class _PracticeQuestionScreenState extends State<PracticeQuestionScreen> {
  void initState() {
    super.initState();
    countDown();
    if (widget.test) {
      random();
    } else {
      sequential();
    }
  }

  //timer..................................................................
  void counterSetter() {
    if (seconds < 30) {
      seconds++;
    } else {
      timer?.cancel();
    }
  }

  void countDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() => counterSetter());
      }
    });
  }

//..............................................................................

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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

                  if (_textSpeech == "yes") {
                    if (widget.test) {
                      if (_imageNO == 1 ||
                          _imageNO == 5 ||
                          _imageNO == 9 ||
                          _imageNO == 14 ||
                          _imageNO == 17 ||
                          _imageNO == 25 ||
                          _imageNO == 30 ||
                          _imageNO == 39 ||
                          _imageNO == 35) {
                        answer = true;
                        _isListening = false;
                        isPressed = true;
                        timer?.cancel();
                      } else {
                        answer = false;
                        whyWrong = false;
                        _isListening = false;
                        isPressed = true;
                        timer?.cancel();
                      }
                    } else {
                      if (_imageNO == 1 || _imageNO == 3) {
                        answer = true;
                        _isListening = false;
                        isPressed = true;
                        timer?.cancel();
                      } else {
                        answer = false;
                        whyWrong = false;
                        _isListening = false;
                        isPressed = true;
                        timer?.cancel();
                      }
                    }
                  } else if (_textSpeech == "no") {
                    if (widget.test) {
                      if (_imageNO == 1 ||
                          _imageNO == 5 ||
                          _imageNO == 9 ||
                          _imageNO == 14 ||
                          _imageNO == 17 ||
                          _imageNO == 25 ||
                          _imageNO == 30 ||
                          _imageNO == 39 ||
                          _imageNO == 35) {
                        answer = false;
                        isPressed = true;
                        _isListening = false;
                        timer?.cancel();
                      } else {
                        answer = true;
                        isPressed = true;
                        _isListening = false;
                        timer?.cancel();
                      }
                    } else {
                      if (_imageNO == 2) {
                        answer = true;
                        _isListening = false;
                        isPressed = true;
                        timer?.cancel();
                      } else {
                        answer = false;
                        whyWrong = true;
                        _isListening = false;
                        isPressed = true;
                        timer?.cancel();
                      }
                    }
                  }
                  _textSpeech =
                      "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
                  _isListening = false;
                }));
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

  AudioPlayer audioPlayer = AudioPlayer();
  bool onlyOnce = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);

    if (onlyOnce) {
      if (!widget.test) {
        if (providerstate.language != "English") {
          final splitted = providerstate.language.split(' ');
          if (splitted.length > 0 && splitted[1] == "Hindi") {
            audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1s2o32MSXlIts8S8l1W6-ddIfO9hV9t6s'));
            setState(() {
              onlyOnce = false;
            });
          } else if (splitted.length > 0 && splitted[1] == "Japanese") {
            audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1Nrv5FaavNHCIIFjXXmYBfH-Og0pm4PR5'));
            setState(() {
              onlyOnce = false;
            });
            print(onlyOnce);
          } else {
            audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1CRzOivQinIR2SnvF0fnWcUkFwekXHt5d'));
            setState(() {
              onlyOnce = false;
            });
          }
        } else {
          audioPlayer.play(UrlSource('https://drive.google.com/uc?export=view&id=1CRzOivQinIR2SnvF0fnWcUkFwekXHt5d'));
          setState(() {
            onlyOnce = false;
          });
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: !isPressed
          ? const Color(0xffFDF7F2)
          : !answer
              ? const Color(0xffFF6969)
              : const Color(0xffFDF7F2),
      appBar: AppBar(
        centerTitle: false,
        leading: TextButton(
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => DashBoard()));
            });
          },
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xff212121),
          ),
        ),
        title: widget.test
            ? Text(
                providerstate.test,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121)),
              )
            : Text(
                providerstate.practice,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121)),
              ),
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
        actions: [
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()));
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          audioPlayer.stop;
          setState(() {
            //print(_noOfQuestions);
            //_noOfQuestions<5?print("true"):print("false");
            topis = 120.0;
            leftis = 40.0;
            sizeis = 135.0;

            if(_imageNO == 1){
              showIcons = false;
            }else{
              showIcons = true;
            }
            print("$_imageNO, $showIcons");

            if (_noOfQuestions == 3 &&
                widget.totalNumberOfQuestions == 3 &&
                !widget.test) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const StartPracticeTest(practiceOrTest: true)));
            }

            seconds = 0;
            countDown();

            if (_noOfQuestions < widget.totalNumberOfQuestions) {
              if (widget.test) {
                _imageNO++;
              } else {
                if(_imageNO<3){
                  _imageNO++;
                }
              }

              isPressed = false;
              _noOfQuestions += 1;
              _textSpeech =
                  "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
            }
            if (_noOfQuestions >= widget.totalNumberOfQuestions) {
              if (widget.totalNumberOfQuestions == 3) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const StartPracticeTest(practiceOrTest: true)));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WellDoneScreen()));
              }

              imageCache.clear();
              //_noOfQuestions = 0;
              timer?.cancel();
            }
            print(_noOfQuestions);
            if (_noOfQuestions == 40) {}
          });
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Image(image: AssetImage("images/icons/right.png")),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: queryData.size.width * 0.6,
                      height: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.black45,
                          color: const Color(0xff212121),
                          value: (1 / widget.totalNumberOfQuestions) *
                              _noOfQuestions,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 40,
                    // ),
                    // SizedBox(
                    //   height: 50,
                    //   child: Center(
                    //     child: Stack(
                    //       children: [
                    //         Center(
                    //           child: SizedBox(
                    //             width: 50,
                    //             height: 50,
                    //             child: CircularProgressIndicator(
                    //               strokeWidth: 10,
                    //               value: (1 / 30) * seconds,
                    //               backgroundColor: Colors.black45,
                    //               color: const Color(0xff212121),
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 50,
                    //           height: 50,
                    //           child: Center(
                    //             child: Text(
                    //               "$seconds",
                    //               style: const TextStyle(
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  SizedBox(
                      width: queryData.size.width,
                      height: queryData.size.height * 0.5,
                      child: GestureDetector(
                        onTap: () {
                          isPressed = true;
                              answer = false;
                              whyWrong = true;
                        },
                        child: ClipRRect(
                            child: widget.test
                                ? Image.asset("images/test_images/$_imageNO.png")
                                : Image.asset(
                                    "images/practice/_Practice$_imageNO.png")),
                      )),
                  Visibility(
                    visible: showIcons,
                    child: Positioned(
                        left: leftis,
                        top: topis,
                        child: GestureDetector(
                            onTap: () {
                              isPressed = true;
                              answer = true;
                              print("object");
                            },
                            child:  Icon(
                              Icons.rectangle,
                              size: sizeis,
                              color: Colors.transparent,
                            ))),
                  ),
                ],
              ),
              Container(
                  child: isPressed
                      ? Container(
                          child: answer
                              ? const Text(
                                  "Correct Answer",
                                  style: TextStyle(
                                      color: Color(0xff04CC00),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                )
                              : whyWrong
                                  ? Column(
                                      children: const [
                                        Text(
                                          "Wrong Answer",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24),
                                        ),
                                        Text(
                                          "Here is face. So answer is ‘Yes’.",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                        children: const [
                                          Text(
                                            "Wrong Answer",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Text(
                                              "There is no face in this image.Therfore answer is ‘No’. Look for features like eyes, nose and mouth when identifying face.",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                      : Column(
                          children: [
                            Text(
                              providerstate.dousee,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24),
                            ),
                          ],
                        )),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: isPressed
                    ? Container()
                    // TextButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         seconds = 0;
                    //         countDown();

                    //         if (_noOfQuestions <
                    //             widget.totalNumberOfQuestions) {
                    //           if (widget.test) {
                    //             random();
                    //           } else {
                    //             _imageNO++;
                    //           }

                    //           isPressed = false;
                    //           _noOfQuestions += 1;
                    //           _textSpeech =
                    //               "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
                    //         }
                    //         if (_noOfQuestions >=
                    //             widget.totalNumberOfQuestions) {
                    //           if (widget.totalNumberOfQuestions == 3) {
                    //             Navigator.pushReplacement(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         const StartPracticeTest(
                    //                             practiceOrTest: true)));
                    //           } else {
                    //             Navigator.pushReplacement(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         const TestQuestionScreen()));
                    //           }

                    //           imageCache?.clear();
                    //           _noOfQuestions = 0;
                    //           timer?.cancel();
                    //         }
                    //       });
                    //     },
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           color: const Color(0xff212121),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       width: queryData.size.width * 0.4,
                    //       height: 40,
                    //       child: Center(
                    //         child: Text(
                    //           providerstate.next,
                    //           style: const TextStyle(
                    //               fontSize: 24,
                    //               fontWeight: FontWeight.w600,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    : TextButton(
                        onLongPress: () {
                          audioPlayer.stop();
                          onListen();
                        },
                        onPressed: () {},
                        child: AvatarGlow(
                            shape: BoxShape.circle,
                            endRadius: 30,
                            animate: _isListening,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xff212121),
                              child: _isListening
                                  ? const Icon(
                                      Icons.mic,
                                      size: 40,
                                      color: Color(0xffFF6969),
                                    )
                                  : const Icon(
                                      Icons.mic_off,
                                      size: 40,
                                      color: Color(0xffFF6969),
                                    ),
                            )),
                      ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
