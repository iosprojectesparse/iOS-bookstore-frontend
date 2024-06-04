//register button on login screen.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import '../screens/instruction_screen1.dart';
import '../screens/loading_screen.dart';
import '../screens/login_screen.dart';

class RegisterLoginButton extends StatelessWidget {
  RegisterLoginButton({required this.login});
  bool login;
  String _result = "Failed";
  // Function func;

  @override
  Widget build(BuildContext context) {
    String val = "";
    NetworkingProviderState networkingproviderstate = Provider.of<NetworkingProviderState>(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    return TextButton(
      style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
      onPressed: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoadingScreen()));
        if (!login) {
          _result = await networkingproviderstate.Register();
          if (_result == "Create User Details") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InstructionScreen1()));
          } else {
            return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: const Text("Registration Failed"),
                        content: Text(_result),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                          )
                        ]));
          }
        } else {
          _result = await networkingproviderstate.Login();

          if (_result == 'You are logged in Successfully') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InstructionScreen1()));
          } else {

            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: const Text("Login Failed"),
                        content: Text(_result),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                          )
                        ]));
            // return showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //             title: Text("Login Failed"),
            //             content:
            //                 Text("Try again after entering valid credentials"),
            //             actions: <Widget>[
            //               TextButton(
            //                 child: Text("Ok"),
            //                 onPressed: () {
            //                   Navigator.pushReplacement(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => LoginScreen()));
            //                 },
            //               )
            //             ]));
          }
        }
      },
      child: Container(
        width: queryData.size.width * 0.8,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: const Border(
              top: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white),
              left: BorderSide(width: 1, color: Colors.white),
              right: BorderSide(width: 1, color: Colors.white)),
        ),
        child: Center(
            child: Text(
          login ? providerstate.login : providerstate.register,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
