//Select language from this screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import 'login_screen.dart';

class UpdatedLanguageScreen extends StatefulWidget {
  const UpdatedLanguageScreen({Key? key}) : super(key: key);

  @override
  State<UpdatedLanguageScreen> createState() => _UpdatedLanguageScreenState();
}

class _UpdatedLanguageScreenState extends State<UpdatedLanguageScreen> {
  bool isInternet = true;
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((event) { 
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    }); 
  }
  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);
    

    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff212121),
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
      body: !isInternet
      ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: queryData.size.height * 0.4,
              width: queryData.size.width * 0.4,
              child: Image.asset(
                "images/icons/noInternet.png"
              ),
            ),
            const Text(
              "No Internet Access",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      )
      :Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: queryData.size.width * 0.75,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54, width: 1),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.white38),
                  ),
                  SizedBox(
                    width: queryData.size.width * 0.3,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _languageSelectionButton(1, "🇺🇸 English", providerstate, queryData),
          _languageSelectionButton(2, "🇮🇳 Hindi", providerstate, queryData),
          _languageSelectionButton(3, "🇯🇵 Japanese", providerstate, queryData),
          Expanded(
            child: SizedBox(),
          ),
          TextButton(
            onPressed: () {
              if(index!=0){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            },
            child: Container(
              width: queryData.size.width * 0.75,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  providerstate.proceed,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
  int index = 0;
  _languageSelectionButton(int val, String lang, ProviderState prostate, MediaQueryData query){
    return TextButton(
      onPressed: () {
        prostate.translate(lang);
        index = val;
      },
      child: Container(
        width: query.size.width * 0.75,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white54, width: 1),
          color: index == val?Colors.white:Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            lang,
            style:  TextStyle(
                color: index==val?Colors.black:Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
