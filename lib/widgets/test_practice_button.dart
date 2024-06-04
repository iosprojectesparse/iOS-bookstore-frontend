//practice button

import 'package:flutter/material.dart';

class TestPracticeButton extends StatelessWidget {
   const TestPracticeButton({Key? key,  required this.function}) : super(key: key);

  final Function function;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return TextButton(
      onPressed: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff212121),
            borderRadius: BorderRadius.circular(10)),
        width: queryData.size.width * 0.2,
        height: 50,
        child: const Center(
            child: Image(image: AssetImage("images/icons/right.png"))),
      ),
    );
  }
}
