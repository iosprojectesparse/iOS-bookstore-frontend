//This is the loading screen of the application.

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xffFDF7F2),
      child: const Center(
        child: SpinKitPouringHourGlass(
          color: Color(0xff212121),
          size: 50,
        ),
      ),
    );
  }
}
