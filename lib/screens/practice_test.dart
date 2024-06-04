//This is the test screen. practice test or 40 question test both.

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mayaamind/screens/start_practice_screen.dart';
import 'package:mayaamind/screens/test_questions.dart';
import 'package:mayaamind/screens/welldone_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_smartlook/flutter_smartlook.dart';

import '../networking.dart';
import '../pro_state_mangement.dart';
import 'dashboard_screen.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen(
      {Key? key, required this.totalNumberOfQuestions, required this.test})
      : super(key: key);

  final bool test;
  final int totalNumberOfQuestions;

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

int seconds = 0;
Timer? timer;
int _noOfQuestions = 0;
int _imageNO = 1;
bool whyWrong = false;

bool answer = true;
bool isPressed = false;
stt.SpeechToText _speech = stt.SpeechToText();
bool _isListening = false;
bool available = false;
String _textSpeech =
    "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
var sizeis = 130.0;
var alignis = Alignment.topRight;
bool showIcons = true;
//EdScreenRecorder? screenRecorder;
Map<String, dynamic>? _response;
bool inProgress = false;
final Smartlook smartlook = Smartlook.instance;
bool isSet = false;

class _PracticeScreenState extends State<PracticeScreen> {
  bool isInternet = true;
  String? recordFilePath;
  String statusText = "";
  bool isComplete = false;
  int i = 0;
  CameraController? previewController;
  bool _isCameraInitialized = false;

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted &&
        !await Permission.storage.isGranted) {
      PermissionStatus microphone = await Permission.microphone.request();
      PermissionStatus storage = await Permission.storage.request();
      if (microphone != PermissionStatus.granted &&
          storage != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = "${storageDirectory.path}/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }

  Future startRecord() async {
    bool hasPermission = await checkPermission();
    //screenRecorder = EdScreenRecorder();
    startScreenRecord(fileName: "recording ${i++}");
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
    }
  }

  Future play() async {
    // if (recordFilePath != null && File(recordFilePath!).existsSync()) {
    //   AudioPlayer audioPlayer = AudioPlayer();
    //   audioPlayer.play(UrlSource(recordFilePath!));
    // }

    var ref = FirebaseStorage.instance.ref().child('audios').child("myAudio");
    var uploadTask = await ref.putFile(File(recordFilePath!));
    print("main url is ${await uploadTask.ref.getDownloadURL()}");
  }

  Future firebaseIntitialize() async {
    await Firebase.initializeApp();
  }

  Future showPreview() async {
    final camera = (await availableCameras())[1];
    previewController = CameraController(camera, ResolutionPreset.high);
    try {
      await previewController!.initialize();
      await previewController!.setFlashMode(FlashMode.off);
      if (mounted) {
        setState(() {
          _isCameraInitialized = previewController!.value.isInitialized;
        });
      }
    } catch (e) {
      // print(e);
      previewController!.dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    countDown();
    startRecord();
    showPreview();

    initSmartlook();

    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    });
  }

  Future<void> initSmartlook() async {
    print("doing this");
    await smartlook.log.enableLogging();
    //TODO add your project key
    await smartlook.preferences
        .setProjectKey('4572a5dc75b1982f9c59e0337512ff776a30f6fa');
    await smartlook.start();
    setState(() {
      isSet = true;
    });
  }

  Future<void> startScreenRecord({required String fileName}) async {
    print("zip");
    Directory? tempDir = await getApplicationDocumentsDirectory();
    String? tempPath = tempDir.path;

    bool started = await FlutterScreenRecording.startRecordScreen("aaaaab");
    print("zip zoop  $started");
    //controller.start();
    // bool? started = await DeviceScreenRecorder.startRecordScreen(name: "$tempPath/$fileName");
    // print("hrhr  $tempPath/$fileName     $started");

    // var response = await screenRecorder!.startRecordScreen(
    //   fileName: fileName,
    //   dirPathToSave: tempPath,
    //   audioEnable: false
    //   );

    // setState(() {
    //   _response = response;
    //   print("zip zoop $_response");
    // });
  }

  Future<void> stopScreenRecording() async {
    smartlook.stop();

    // var response = await screenRecorder?.stopRecord();
    // setState(() {
    //   _response = response;
    //   print("zip zoop zooooommmm $_response");
    // });

    String path = await FlutterScreenRecording.stopRecordScreen;
    print("zip zoop zooooommmm $path");
    //log("mains areeee = ${main.toString()}");
    // var stopped = await DeviceScreenRecorder.stopRecordScreen();
    // print("hui hui hui $stopped");
    // print("stopiing buddy $_response");
    //   var stopresponse = await screenRecorder!.stopRecord();
    //   setState(() {
    //     _response = stopresponse;
    //   });
    //   print("ho ho ho $_response");
    //Uint8List finalImage = Uint8List.fromList(main!);
    final Directory systemTempDir = Directory.systemTemp;
    final File file = await File('${systemTempDir.path}/foo.png').create();
    //file.writeAsBytes(finalImage);
    var ref = FirebaseStorage.instance
        .ref()
        .child('screenRecording')
        .child("screenRecord");
    var uploadTask = await ref.putFile(File(path));
    print("zip zoop zooooommmm zeesss${await uploadTask.ref.getDownloadURL()}");
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
    //recorder.dispose();
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

  Future takePic() async {
    final camera = (await availableCameras())[1];
    final controller = CameraController(camera, ResolutionPreset.low);
    try {
      await controller.initialize();
      await controller.setFlashMode(FlashMode.off);
      final image = await controller.takePicture();
      controller.dispose();
      print("pic is ${image.path}");
      return image.path;
    } catch (e) {
      // print(e);
      controller.dispose();
    }
  }


  @override
  Widget build(BuildContext context) {
    firebaseIntitialize();
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    NetworkingProviderState networkingproviderstate =
        Provider.of<NetworkingProviderState>(context);
    if (onlyOnce) {
      if (!widget.test) {
        if (providerstate.language != "English") {
          final splitted = providerstate.language.split(' ');
          if (splitted.length > 0 && splitted[1] == "Hindi") {
            //audioPlayer.play('https://maayamind.com/instructionsaudio/Hindi/H03.m4a');
            setState(() {
              onlyOnce = false;
            });
          } else if (splitted.length > 0 && splitted[1] == "Japanese") {
            //audioPlayer.play('https://maayamind.com/instructionsaudio/Japanese/screen4.m4a');
            setState(() {
              onlyOnce = false;
            });
            print(onlyOnce);
          } else {
            audioPlayer.play(UrlSource(
                'https://maayamind.com/instructionsaudio/English/screen6.m4a'));
            setState(() {
              onlyOnce = false;
            });
          }
        } else {
          audioPlayer.play(UrlSource(
              'https://maayamind.com/instructionsaudio/English/screen6.m4a'));
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
            _noOfQuestions = 0;
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: const Text("Do you wish to leave test?"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.pop(context);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const DashBoard()));
                              });
                            },
                          ),
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ]));
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
        actions: const [
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
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.info_rounded,
            color: Color(0xff212121),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          audioPlayer.stop;
          // var result =
          //     await networkingproviderstate.seteyeLandmarks(await takePic());
          // log("hehehehe $result");
          setState(() {
            //print(_noOfQuestions);
            //_noOfQuestions<5?print("true"):print("false");

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
                if (_imageNO < 40) {
                  _imageNO++;
                }
              } else {
                _imageNO++;
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
            if (_noOfQuestions == 39) {
              //startStopRecorder();
              stopRecord();
              play();
              stopScreenRecording();
              print("stopped");
            }

            print(_imageNO);
            if (widget.test) {
              if (_imageNO != 1 &&
                  _imageNO != 5 &&
                  _imageNO != 9 &&
                  _imageNO != 14 &&
                  _imageNO != 17 &&
                  _imageNO != 25 &&
                  _imageNO != 30 &&
                  _imageNO != 39 &&
                  _imageNO != 35) {
                showIcons = false;
              } else {
                showIcons = true;
              }

              if (_imageNO == 9) {
                alignis = Alignment.bottomLeft;
                sizeis = 130.0;
              }
              if (_imageNO == 14) {
                sizeis = 140.0;
                alignis = Alignment.bottomRight;
              }
              if (_imageNO == 17) {
                sizeis = 130.0;
                alignis = Alignment.topLeft;
              }
              if (_imageNO == 30) {
                alignis = Alignment.bottomRight;
              }
              if (_imageNO == 35) {
                alignis = Alignment.bottomLeft;
              }
              if (_imageNO == 39) {
                sizeis = 140.0;
                alignis = Alignment.center;
              }
            }
          });
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Image(image: AssetImage("images/icons/right.png")),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
              : Column(
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
                                  if (widget.test) {
                                    if (_imageNO != 1 &&
                                        _imageNO != 5 &&
                                        _imageNO != 9 &&
                                        _imageNO != 14 &&
                                        _imageNO != 17 &&
                                        _imageNO != 25 &&
                                        _imageNO != 30 &&
                                        _imageNO != 39 &&
                                        _imageNO != 35) {
                                      print("here");
                                      isPressed = true;
                                      answer = false;
                                      whyWrong = false;
                                    } else {
                                      print("no here");
                                      isPressed = true;
                                      answer = false;
                                      whyWrong = true;
                                    }
                                  }
                                },
                                child: ClipRRect(
                                    child: widget.test
                                        ? Image.asset(
                                            "images/test_images/$_imageNO.png")
                                        : Image.asset(
                                            "images/practice/_Practice$_imageNO.png")),
                              )),
                          Visibility(
                            visible: showIcons,
                            child: Positioned.fill(
                              child: GestureDetector(
                                  onTap: () {
                                    isPressed = true;
                                    answer = true;
                                    print("object");
                                  },
                                  child: Align(
                                    alignment: alignis,
                                    child: Icon(
                                      Icons.rectangle,
                                      size: sizeis,
                                      color: Colors.transparent,
                                    ),
                                  )),
                            ),
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 24),
                                                ),
                                                Text(
                                                  "Here is face. So answer is ‘Yes’.",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 24),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30),
                                                    child: Text(
                                                      "There is no face in this image.Therefore answer is ‘No’. Look for features like eyes, nose and mouth when identifying face.",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                              : Column(
                                  children: [
                                    Visibility(
                                      visible:
                                          (_noOfQuestions <= 5 ? true : false),
                                      child: Text(
                                        providerstate.dousee,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24),
                                      ),
                                    ),
                                  ],
                                )),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: isPressed
                              ? TextButton(
                                  onPressed: () {
                                    setState(() {
                                      seconds = 0;
                                      countDown();
                                      if (_noOfQuestions <
                                          widget.totalNumberOfQuestions) {
                                        if (widget.test) {
                                          _imageNO++;
                                        } else {
                                          _imageNO++;
                                        }
                                        isPressed = false;
                                        _noOfQuestions += 1;
                                        _textSpeech =
                                            "If you see a face then click on mic and say “Yes” and click on the Face. If you don’t  see any face then say “ No” and click next";
                                      }
                                      if (_noOfQuestions >=
                                          widget.totalNumberOfQuestions) {
                                        if (widget.totalNumberOfQuestions ==
                                            3) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const StartPracticeTest(
                                                          practiceOrTest:
                                                              true)));
                                        } else {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TestQuestionScreen()));
                                        }

                                        imageCache.clear();
                                        _noOfQuestions = 0;
                                        timer?.cancel();
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xff212121),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                )
                              : Container()
                          /*TextButton(
                          onLongPress: () => onListen(),
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
                        ),*/
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: _isCameraInitialized
                            ? Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                height: queryData.size.height * 0.25,
                                width: queryData.size.width * 0.4,
                                child: previewController!.buildPreview(),
                              ),
                            )
                            : Container(),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
