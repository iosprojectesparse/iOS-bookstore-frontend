//This is the Language Selection Screen.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blinking_text/blinking_text.dart';
import '../constants.dart';
import '../pro_state_mangement.dart';
import 'login_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    bool onchanged = false;

    DropdownButton<String> androidDropdown() {
      List<DropdownMenuItem<String>> dropDownItems = [];
      for (String i in languages) {
        DropdownMenuItem<String> lang = DropdownMenuItem(
          child: Text(
            i,
            style: const TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          value: i,
        );
        dropDownItems.add(lang);
      }

      return DropdownButton<String>(
          isDense: true,
          underline: const SizedBox.shrink(),
          style: const TextStyle(color: Colors.yellow),
          items: dropDownItems,
          hint: Text(
            providerstate.langString,
            style: const TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          value:
              !onchanged ? null : Provider.of<ProviderState>(context).language,
          onChanged: (value) {
            onchanged = true;
            Provider.of<ProviderState>(context, listen: false)
                .translate(value!);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          });
    }

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                providerstate.selectlanguage,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFDF7F2),
                    fontSize: 32),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: queryData.size.width * 0.5,
                height: 50,
                child: Center(child: androidDropdown()),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFDF7F2),
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            BlinkText(
              "${providerstate.volume} 🔊",
              style: const TextStyle(fontSize: 18.0, color: Color(0xffFDF7F2)),
              beginColor: Colors.white,
              endColor: Colors.grey,
              duration: const Duration(seconds: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => FirstScreen()));
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: const Color(0xffFDF7F2),
            //         borderRadius: BorderRadius.circular(10)),
            //     width: queryData.size.width * 0.4,
            //     height: 40,
            //     child: Center(
            //       child: Text(
            //         providerstate.next,
            //         style: const TextStyle(
            //             fontSize: 24,
            //             fontWeight: FontWeight.w600,
            //             color: const Color(0xff212121)),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

