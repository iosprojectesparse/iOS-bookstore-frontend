import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mayaamind/pro_state_mangement.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record_mp3/record_mp3.dart';

class MyTest extends StatefulWidget {
  const MyTest({Key? key}) : super(key: key);

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  late List<bool> _isOpen;
  String? recordFilePath;
  String statusText = "";
  bool isComplete = false;
  int i=0;


  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus microphone = await Permission.microphone.request();
      PermissionStatus storage = await Permission.storage.request();
      if (microphone != PermissionStatus.granted && storage != PermissionStatus.granted) {
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
      print(d);
      d.createSync(recursive: true);
    }
    print(sdPath);
    return sdPath + "/test_${i++}.mp3";
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
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

   void play() {
    if (recordFilePath != null && File(recordFilePath!).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(UrlSource(recordFilePath!));
    }
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(color: Colors.red.shade300),
                            child: const Center(
                              child: Text(
                                'start',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () async {
                            //writeCounter(11);
                            startRecord();
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(color: Colors.blue.shade300),
                            child: Center(
                              child: Text(
                                RecordMp3.instance.status == RecordStatus.PAUSE
                                    ? 'resume'
                                    : 'pause',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
                            pauseRecord();
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(color: Colors.green.shade300),
                            child: Center(
                              child: Text(
                                'stop',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
                            stopRecord();
                          },
                        ),
                      ),
                    ],
                  ),
              ),
              Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              statusText,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              //play();
            },
            child: Container(
              margin: EdgeInsets.only(top: 30),
              alignment: AlignmentDirectional.center,
              width: 100,
              height: 50,
              child: isComplete && recordFilePath != null
                  ? Text(
                      "play",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )
                  : Container(),
            ),
          )
            ],
          )),
    );
  }
}
