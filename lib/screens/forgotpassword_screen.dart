//This is Forget Password Screen.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../networking.dart';
import '../pro_state_mangement.dart';
import 'first_screen.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);
    NetworkingProviderState network = Provider.of<NetworkingProviderState>(context);

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff212121),
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  providerstate.forgotpasslist[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 32,
                  ),
                ),
                Text(
                  providerstate.forgotpasslist[1],
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  providerstate.changepass,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white38),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: queryData.size.width * 0.75,
                  height: 45,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: emailText,
                    onChanged: (val) {},
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xffFDF7F2).withOpacity(0.45),
                              width: 1.0)),
                      labelText: providerstate.email,
                      labelStyle:
                          TextStyle(color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffFDF7F2).withOpacity(0.45),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "eg. john@gmail.com",
                      hintStyle:
                          TextStyle(color: const Color(0xffFDF7F2).withOpacity(0.45)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () async{
                    if(emailText.text.isNotEmpty){
                      network.setEmail(emailText.text);
                      await network.sendOtp(emailText.text).then((value){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const OtpScreen()));
                    });
                    }
                  },
                  child: Container(
                    // width: queryData.size.width * 0.75,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        providerstate.cont,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
