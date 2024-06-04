// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:visionapp/screens/navigation_screen.dart';
// import 'package:visionapp/screens/practice_test.dart';
// import 'package:visionapp/widgets/test_practice_button.dart';
// import '../pro_state_mangement.dart';
// import 'start_practice_screen.dart';
//
// class InstructionScreen extends StatefulWidget {
//   const InstructionScreen({Key? key}) : super(key: key);
//
//   @override
//   State<InstructionScreen> createState() => _InstructionScreenState();
// }
//
// class _InstructionScreenState extends State<InstructionScreen> {
//   late VideoPlayerController _controller;
//
//   // void videoRegulation() {
//   //   _controller = VideoPlayerController.asset('videos/video.mp4')
//   //     ..addListener(() {
//   //       setState(() {});
//   //     })
//   //     ..setLooping(true)
//   //     ..initialize().then((_) {
//   //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//   //       setState(() {
//   //         _controller.pause();
//   //       });
//   //     });
//   // }
//
//   // void Onpressed() {
//   //   _controller.pause();
//   //   Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(
//   //           builder: (context) => const StartPracticeTest(
//   //                 practiceOrTest: false,
//   //               )));
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     // videoRegulation();
//   }
//
//   @override
//   void dispose() {
//     _controller.pause();
//     super.dispose();
//   }
//
//   bool showPlayButton = true;
//   bool play = false;
//
//   void playbutton() {
//     if (play) {
//       _controller.pause();
//       play = false;
//       showPlayButton = true;
//     } else {
//       _controller.play();
//       play = true;
//       showPlayButton = false;
//     }
//   }
//
//   int instructionStep = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData queryData = MediaQuery.of(context);
//
//     ProviderState providerstate = Provider.of<ProviderState>(context);
//
//     return Scaffold(
//       backgroundColor: Color(0xff212121),
//       body: SafeArea(
//         child: Container(
//           color: const Color(0xffFDF7F2),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(children: [
//                 Container(
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20))),
//                     width: double.infinity,
//                     height: queryData.size.height * 0.4,
//                     child: _controller.value.isInitialized
//                         ? ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(20)),
//                             child: AspectRatio(
//                                 aspectRatio: _controller.value.aspectRatio,
//                                 child: Stack(children: [
//                                   GestureDetector(
//                                     child: VideoPlayer(_controller),
//                                     onTap: () {
//                                       showPlayButton = true;
//                                     },
//                                   ),
//                                 ])),
//                           )
//                         : const Center(
//                             child: CircularProgressIndicator(),
//                           )),
//                 Padding(
//                   padding: const EdgeInsets.only(),
//                   child: TextButton(
//                       onPressed: () {
//                         _controller.pause();
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const NavigationScreen()));
//                       },
//                       child: SizedBox(
//                         width: queryData.size.width,
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const PracticeScreen(
//                                           totalNumberOfQuestions: 3,
//                                           test: false,
//                                         )));
//                           },
//                           child: Text(
//                             providerstate.skip,
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 20),
//                             textAlign: TextAlign.right,
//                           ),
//                         ),
//                       )),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: queryData.size.height * 0.2),
//                   child: Center(
//                     child: Visibility(
//                       visible: showPlayButton,
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           playbutton();
//                         },
//                         backgroundColor: const Color(0xff212121),
//                         child: play
//                             ? const Icon(Icons.pause, size: 38)
//                             : const Icon(Icons.play_arrow, size: 38),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       EdgeInsets.only(top: (queryData.size.height * 0.4) - 25),
//                   child: Center(
//                     child: Visibility(
//                       visible: !play,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: const Color(0xff212121),
//                             borderRadius: BorderRadius.circular(10)),
//                         width: queryData.size.width * 0.7,
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             Provider.of<ProviderState>(context).instruction,
//                             style: const TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//               SizedBox(
//                 height: play ? 25 : 0,
//               ),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 30),
//                         child: Text(
//                           providerstate.step,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//               TestPracticeButton(
//                 // function: Onpressed,
//                 title: providerstate.practice,
//               ),
//               const SizedBox(
//                 height: 20,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
