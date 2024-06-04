//audio recording file

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


final pathToRecord = 'audio_example.aac';
late String _path;

class SoundRecording {
  FlutterSoundRecorder? _audioRecorder;
  FlutterSoundPlayer? _soundPlayer;
  FlutterSound flutterSound = FlutterSound();
  bool _isRecorderInitialized = false;

  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async{
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.status;
    if(status!=PermissionStatus.granted){
      print(status);
      await Permission.microphone.request();
      await Permission.storage.request();
    }
    await _audioRecorder!.openRecorder();
    _isRecorderInitialized = true;
  }

  void dispose(){
    _audioRecorder!.closeRecorder();
    _audioRecorder = null;
    _isRecorderInitialized = false;
  }

  Future recordAudio() async{
    final directory = await getApplicationDocumentsDirectory();
    _path = directory.path;
    //print("hey"+_path+'/'+pathToRecord);
    if(!_isRecorderInitialized) return;

    print("recording//");
    var path = await _audioRecorder!.startRecorder(toFile: pathToRecord);
    
  }

  Future createFile() async{
    print("object");
    File(_path+'/'+pathToRecord).create(recursive: true)
    .then((File file) async{
      Uint8List bytes = await file.readAsBytes();
      file.writeAsBytes(bytes);
      print("hi"+file.path);
      
    });
  }

  Future createDirectory() async{
    final directory = await getApplicationDocumentsDirectory();
    _path = directory.path;
    //print(_path);
    bool _iscreated = await Directory(_path).exists();
    if(!_iscreated){
      Directory(_path).create().then((Directory directory){
        print(directory.path);
      });
    }
  }

  Future writeFile() async{
    print("object"+_path);
    await createDirectory();
    await createFile();
  }

  Future _stopRecording() async{
    if(!_isRecorderInitialized) return;

     print("yup");
     await _audioRecorder!.stopRecorder();
     print("yo");
     await writeFile();
     //await _audioRecorder.staer
    await _soundPlayer!.startPlayer();
    //  print("aa");
    //  print(path);
  }

  Future toggleRecording() async{
    if(_audioRecorder!.isStopped){
      print(_audioRecorder!.isStopped);
      await recordAudio();
    }
    else{
      print(_audioRecorder!.isStopped);
      await _stopRecording();
    }
  }

  
}