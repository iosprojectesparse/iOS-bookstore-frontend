//rest api dart file
//fetching data from server.

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkingProviderState extends ChangeNotifier {
  String? uName;
  String? uEmail;
  String? uGender;
  String? uPass;
  String? uPhone;
  int? uAge;
  String? UserId;
  String loginResponse = "false";


  //static BuildContext context;
  //BuildContext get context => context ;

  Future<String> Register() async {
    try {
      var url = Uri.parse('https://mayamind0.azurewebsites.net/api/v1/CreateUserDetails');
      var response = await http.post(url, body: jsonEncode(<String,dynamic>{
        "Name": uName,
        "Email": uEmail,
        "Password": uPass,
        "Age": uAge,
        "Gender": uGender,
      }),
      headers: {"Content-Type": "application/json"},
      );
      var decode = jsonDecode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      //print(await http.read(Uri.parse('http://maayamind.com/RestAPI')));
      print(decode);
      return decode["message"];
    } catch (e) {
      print(e);
      return "Exception caught";
    }
  }

  Future updateDetails() async{
    try{
      Uri urii = Uri.parse("https://mayamind0.azurewebsites.net/api/v1/updateUserDetails");


      var response = await http.put(urii,
      body: jsonEncode({
        "UserId": UserId.toString(),
        "Name": uName,
        "Age": uAge,
        "Gender": uGender,
      }),
      headers: {"Content-Type": "application/json"},
      );

      var decode = jsonDecode(response.body);

      return decode;
    }catch(e){
      return e.toString();
    }
  }

  Future<String> Login() async {
      print(uEmail);
      print(uPass);
      var url = Uri.parse("https://mayamind0.azurewebsites.net/api/v1/Userlogin");
      var response = await http.post(url,body: jsonEncode({
        "Email": uEmail,
        "Password": uPass
      }),
      headers: {"Content-Type": "application/json"},
      );
      var decode = jsonDecode(response.body);
      print(decode);
      if (decode["message"].contains("You are logged in Successfully")) {
        uName = (decode as Map)["data"]["Name"];
        uEmail = (decode)["data"]["Email"];
        uPhone = (decode)["data"]["phone"];
        UserId = (decode)["data"]["UserId"];
        notifyListeners();
      }
      return decode["message"];
  }

  void setEmail(String email) {
    uEmail = email;
    notifyListeners();
  }

  void setPass(String pass) {
    uPass = pass;
    notifyListeners();
  }

  Future postReview(String review, double rating) async{
    Uri urii = Uri.parse("https://mayamind0.azurewebsites.net/api/v1/Review/CreatereviewDetails");

    var response = await http.post(urii,
    body: jsonEncode({
      "UserId": UserId,
      "ratingNo": rating,
      "Comment": review
      }),
    headers: {"Content-Type": "application/json"},
    );

  }

  Future sendOtp(String mail) async{
    Uri url = Uri.parse("https://mayamind0.azurewebsites.net/api/v1/password/emailSend");

    var response = await http.post(url,
    body: jsonEncode({
      "Email": mail
      }),
    headers: {"Content-Type": "application/json"},
    );
    var decode = jsonDecode(response.body);

    print(decode);
  }

  Future resetPassword(String pass, int otp) async{
    Uri uri = Uri.parse("https://mayamind0.azurewebsites.net/api/v1/password/changePassword");

    var response = await http.post(uri,
    body: jsonEncode(
      {
        "Email": uEmail,
        "Password": pass,
        "otp": otp
      }
    ),
    headers: {"Content-Type": "application/json"},
    );
    var decode = jsonDecode(response.body);
    print(decode);
  }

  Future seteyeLandmarks(String image) async{
      Uri uriss = Uri.parse("https://mayamind0.azurewebsites.net/api/v1/detect-faces");
      var request =  http.MultipartRequest('POST', uriss);
      request.files.add(await http.MultipartFile.fromPath("image", image));
      //request.fields.addAll({"BannerId": courseId,});
      request.headers.addAll({"Content-Type": "application/json"});

      var res = await request.send();

      var response = await http.Response.fromStream(res);

      var decode = response.body;

      return decode;
  }
}
