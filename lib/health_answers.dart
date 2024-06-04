import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HealthAnswers extends ChangeNotifier {
  String? xName;
  String? xEmail;
  String? userId;
  String? xAnswer1;
  String? xAnswer2;
  String? xAnswer3;
  String? xAnswer4;
  String? xAnswer5;
  String? xAnswer6;
  String? xAnswer7;
  String token = "b6f673be95da64ee8196f8bea8c1dd5a";

  Future postAnswers() async {
    var url = Uri.parse("https://mayamind.herokuapp.com/api/v1/Quiz/CreateQuizAnswerDetails");

    print({
      "UserId" : userId,
      "answer1": "$xAnswer1",
      "answer2": "$xAnswer2",
      "answer3": "$xAnswer3",
      "answer4": "$xAnswer4",
      "answer5": "$xAnswer5",
      "answer6": "$xAnswer6",
      "answer7": "$xAnswer7"
    });

    if (xAnswer1 != null &&
        xAnswer2 != null &&
        xAnswer3 != null &&
        xAnswer4 != null &&
        xAnswer5 != null &&
        xAnswer6 != null &&
        xAnswer7 != null) {
      try {
        print("Sending http request");
        var response = await http.post(url,
            body: jsonEncode({
              "UserId" : userId,
              "Answer1": "$xAnswer1",
              "Answer2": "$xAnswer2",
              "Answer3": "$xAnswer3",
              "Answer4": "$xAnswer4",
              "Answer5": "$xAnswer5",
              "Answer6": "$xAnswer6",
              "Answer7": "$xAnswer7"
            }),
            headers: {"Content-Type": "application/json"},
            );
        notifyListeners();
        print("object");
        print(response.body);
        var decode = jsonDecode(response.body);
        print("something..");
        print(decode);
      } catch (e) {
        print(e);
      }
    }
  }
}
