//bullet points text widget

import 'package:flutter/material.dart';

class BulletPointedText extends StatelessWidget {
  BulletPointedText({Key? key, required this.text, required this.colr}) : super(key: key);

  String text;
  Color colr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "• ",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 25, color: colr),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 18, color: colr),
            ),
          ),
        ],
      ),
    );
  }
}
