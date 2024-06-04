import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../networking.dart';
import '../pro_state_mangement.dart';
import 'first_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpText = TextEditingController();
  final newPassText = TextEditingController();
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
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 32,
                  ),
                ),
                // Text(
                //   providerstate.forgotpasslist[1],
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontStyle: FontStyle.normal,
                //     fontSize: 32,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   providerstate.changepass,
                //   style: const TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 15,
                //       color: Colors.white38),
                // ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: queryData.size.width * 0.75,
                  height: 45,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: otpText,
                    onChanged: (val) {},
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xffFDF7F2).withOpacity(0.45),
                              width: 1.0)),
                      labelText: "OTP",
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
                      hintText: "eg. 123",
                      hintStyle:
                          TextStyle(color: const Color(0xffFDF7F2).withOpacity(0.45)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: queryData.size.width * 0.75,
                  height: 45,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: newPassText,
                    onChanged: (val) {},
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xffFDF7F2).withOpacity(0.45),
                              width: 1.0)),
                      labelText: "New Password",
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
                      hintText: "eg. 123abc",
                      hintStyle:
                          TextStyle(color: const Color(0xffFDF7F2).withOpacity(0.45)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    if(otpText.text.isNotEmpty && newPassText.text.isNotEmpty){
                      network.resetPassword(newPassText.text, int.parse(otpText.text)).then((value){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const FirstScreen()));
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