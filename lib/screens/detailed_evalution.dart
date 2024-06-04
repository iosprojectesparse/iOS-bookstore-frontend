import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mayaamind/screens/report_screen.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';

class DetailedEvaluationScreen extends StatefulWidget {
  const DetailedEvaluationScreen({Key? key}) : super(key: key);

  @override
  State<DetailedEvaluationScreen> createState() =>
      _DetailedEvaluationScreenState();
}

class _DetailedEvaluationScreenState extends State<DetailedEvaluationScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReportScreen()));
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xff212121),
            ),
          ),
        ),
        title:  Text(
          providerstate.report,
          style: const TextStyle(
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
      body: Stack(
        children: [
          SizedBox(
            height: queryData.size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      left: 20, bottom: 20, top: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        providerstate.detailedevaluation,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Column(
                        children: [
                           Text(
                            providerstate.risk,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          SizedBox(
                        height: queryData.size.height * 0.2,
                      ),
                          Center(
                            child: SizedBox(
                              height: queryData.size.height * 0.2,
                              width: queryData.size.width * 0.7,
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    painter: Customchartpainter(
                                        const Color.fromRGBO(0, 0, 0, 0.04),
                                        pi),
                                    child: Container(),
                                  ),
                                  CustomPaint(
                                    painter: Customchartpainter(
                                        Colors.green, pi / 1.5),
                                    child: Container(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                              "images/test_question_imogi/good.png"),
                                          SizedBox(
                                            height:
                                                queryData.size.height * 0.02,
                                          ),
                                           Text(
                                            providerstate.good,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomFooter(),
          )
        ],
      ),
    );
  }
}

class Customchartpainter extends CustomPainter {
  Color color11;
  var sweep;
  Customchartpainter(this.color11, this.sweep);
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
