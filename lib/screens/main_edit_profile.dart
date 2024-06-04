import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../networking.dart';
import '../pro_state_mangement.dart';

class MainEditingScreen extends StatefulWidget {
  const MainEditingScreen({Key? key}) : super(key: key);

  @override
  State<MainEditingScreen> createState() => _MainEditingScreenState();
}

class _MainEditingScreenState extends State<MainEditingScreen> {
  bool isInternet = true;
  bool onGenderChanged = false;
  String? _chosenValue;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.stop();
    audioPlayer.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.stop();
    audioPlayer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    audioPlayer = AudioPlayer();
    ProviderState providerstate = Provider.of<ProviderState>(context);
    NetworkingProviderState networkingproviderstate =
        Provider.of<NetworkingProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);
    audioPlayer.stop();
    audioPlayer.dispose();

    List<String> gender = [
      providerstate.male,
      providerstate.female,
      providerstate.others
    ];

    DropdownButton<String> GenderAndroidDropdown() {
      List<DropdownMenuItem<String>> genderdropdownitems = [];
      for (String i in gender) {
        DropdownMenuItem<String> gender = DropdownMenuItem(
          child: Text(i),
          value: i,
        );
        genderdropdownitems.add(gender);
      }

      return DropdownButton<String>(
          itemHeight: 50,
          underline: const SizedBox.shrink(),
          hint: Text(providerstate.gender),
          items: genderdropdownitems,
          value: !onGenderChanged
              ? null
              : Provider.of<ProviderState>(context).selectedGender,
          onChanged: (value) {
            onGenderChanged = true;
            //networkingproviderstate.uGender = value;
            Provider.of<ProviderState>(context, listen: false).Fgender(value!);
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
        title: const Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff212121)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit Details",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: queryData.size.width * 8,
              height: 45,
              child: TextFormField(
                initialValue: networkingproviderstate.uName!,
                onChanged: (value) {
                  networkingproviderstate.uName = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  labelText: providerstate.name,
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: providerstate.hintname,
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: queryData.size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: queryData.size.width * 0.3,
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: networkingproviderstate.uAge.runtimeType != Null
                    ? networkingproviderstate.uAge.toString(): "0",
                    onChanged: (value) {
                      networkingproviderstate.uAge = int.parse(value);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                      labelText: providerstate.age,
                      labelStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: providerstate.hintage,
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: queryData.size.width * 0.2,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: queryData.size.width * 0.3,
                  height: 45,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      child: DropdownButton<String>(
                        value: _chosenValue,
                        isExpanded: true,
                        style: const TextStyle(color: Colors.black),
                        items: gender.map((String Value1) {
                          return DropdownMenuItem<String>(
                            value: Value1,
                            child: Text(Value1),
                          );
                        }).toList(),
                        hint: const Text(
                          "Gender",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _chosenValue = val;
                            //healthAnswers.xAnswer2 = _chosenValue;
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: queryData.size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () async {
                networkingproviderstate.uGender = _chosenValue;

                var result = await networkingproviderstate.updateDetails().then((value){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Profile Updated!!")));
                });
                print("risu $result");
              },
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: Colors.black,
              ),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  width: queryData.size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "SAVE",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
