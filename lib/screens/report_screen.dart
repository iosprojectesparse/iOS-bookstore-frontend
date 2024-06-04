//This is the report screen.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'detailed_evalution.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isInternet = true;
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
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);

    return Scaffold(
      backgroundColor: const Color(0xffFDF7F2),
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xff212121),
        ),
        title:  Text(
          providerstate.report,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff212121)),
        ),
        actions: [
         InkWell(
            onTap: (){
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AboutScreen()));
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
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
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
            : Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                     Text(
                                      "${providerstate.report} 1",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                          color: Color(0xffFDF7F2),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children:  [
                                                      Text(
                                                        providerstate.pareidoliascore,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                      const Spacer(),
                                                      const Text(
                                                        "3",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 40,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        color: Colors.green,
                                                        size: 25
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.person,
                                                        size: 25,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: queryData
                                                                .size.height *
                                                            0.06,
                                                        width: queryData
                                                                .size.width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .green,
                                                                width: 3)),
                                                        child:  Center(
                                                          child: Text(
                                                            providerstate.good,
                                                            style: const TextStyle(
                                                                fontSize: 24,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  Text(
                                                    providerstate.trackingquality,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 20),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children:  [
                                                      const Text(
                                                        "  · ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 40),
                                                      ),
                                                      Text(
                                                        providerstate.visual,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                      const Spacer(),
                                                      const Text(
                                                        "90%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children:  [
                                                      const Text(
                                                        "  · ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 40),
                                                      ),
                                                      Text(
                                                        providerstate.speech,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                      const Spacer(),
                                                      const Text(
                                                        "80%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        "  · ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 40),
                                                      ),
                                                      Text(
                                                        providerstate.reliability,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20),
                                                      ),
                                                      const Spacer(),
                                                      const Text(
                                                        "85%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20),
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                  color: Color(0xffFDF7F2),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 20, top: 20),
                                      child: Text(
                                        providerstate.neurologyconsult,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20),
                              child: InkWell(
                                onTap: (){
                                   Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailedEvaluationScreen()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                    color: Color(0xffFDF7F2),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                            left: 20, bottom: 20, top: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text(
                                                    providerstate.detailedevaluation,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20),
                                                  ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: queryData.size.height * 0.15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child:  BottomFooter(),
                  )
                ],
              ),
      ),
    );
  }
}

class Customchartpainter extends CustomPainter {
  Color color11;
  var sweep;
  Customchartpainter(this.color11,this.sweep);
  @override
  void paint(Canvas canvas, Size size) {
    Rect drawingRect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    final Paint paint = Paint();
    paint.color = color11;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 20;


    //canvas.drawCircle(c, radius, paint)
    //canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)

    //canvas.drawArc(usualRect, pi, pi, false, paint);
    canvas.drawArc(drawingRect, pi, sweep, false, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
