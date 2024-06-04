//In this We are making Screen for editing the profile.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'main_edit_profile.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool isInternet = true;
  bool onGenderChanged = false;
  String? _chosenValue;
  final nameController = TextEditingController();
  final ageController = TextEditingController();

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
    NetworkingProviderState networkingproviderstate = Provider.of<NetworkingProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);
    nameController.text = networkingproviderstate.uName!;
    ageController.text = networkingproviderstate.uAge.runtimeType != Null ? networkingproviderstate.uAge.toString() : "0" ;

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
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            providerstate.profileDetails,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff212121)),
          ),
        ),
        actions:  [
          InkWell(
            onTap: (){
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
            child: const Icon(
              Icons.info_rounded,
              color: Color(0xff212121),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
      ),
      body: SafeArea(
        child: !isInternet
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
      :Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 55,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: const AssetImage("images/profile/propic.png"),
                      child: Stack(
                        children: [
                          Positioned(
                            child: InkWell(
                              onTap: (){
                                print("tap tap");
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainEditingScreen()));
                                // showModalBottomSheet(
                                //   backgroundColor: Color(0xFFFDF7F2),
                                //   context: context,
                                //   builder: (ctx){
                                //     return Container();
                                //   }
                                // );
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xFFFDF7F2),
                                  child: Icon(Icons.edit,color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  providerstate.name,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: queryData.size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                        top: BorderSide(width: 1, color: Color(0xff212121)),
                        bottom: BorderSide(width: 1, color: Color(0xff212121)),
                        left: BorderSide(width: 1, color: Color(0xff212121)),
                        right: BorderSide(width: 1, color: Color(0xff212121))),
                  ),
                  child: Center(
                      child: Text(
                    networkingproviderstate.uName ?? "name",
                    style: const TextStyle(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          providerstate.age,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: queryData.size.width * 0.35,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: const Border(
                                top: BorderSide(width: 1, color: Color(0xff212121)),
                                bottom:
                                    BorderSide(width: 1, color: Color(0xff212121)),
                                left: BorderSide(width: 1, color: Color(0xff212121)),
                                right:
                                    BorderSide(width: 1, color: Color(0xff212121))),
                          ),
                          child: Center(
                              child: Text(
                            networkingproviderstate.uAge.toString(),
                            style: const TextStyle(
                                color: Color(0xff212121),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          providerstate.gender,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: queryData.size.width * 0.35,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: const Border(
                                top: BorderSide(width: 1, color: Color(0xff212121)),
                                bottom:
                                    BorderSide(width: 1, color: Color(0xff212121)),
                                left: BorderSide(width: 1, color: Color(0xff212121)),
                                right:
                                    BorderSide(width: 1, color: Color(0xff212121))),
                          ),
                          child: Center(
                              child: Text(
                            networkingproviderstate.uGender ?? "gender",
                            style: const TextStyle(
                                color: Color(0xff212121),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  providerstate.email,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: queryData.size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                        top: BorderSide(width: 1, color: Color(0xff212121)),
                        bottom: BorderSide(width: 1, color: Color(0xff212121)),
                        left: BorderSide(width: 1, color: Color(0xff212121)),
                        right: BorderSide(width: 1, color: Color(0xff212121))),
                  ),
                  child: Center(
                      child: Text(
                    networkingproviderstate.uEmail ?? "email",
                    style: const TextStyle(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  providerstate.langString,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: queryData.size.width * 0.8,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                        top: BorderSide(width: 1, color: Color(0xff212121)),
                        bottom: BorderSide(width: 1, color: Color(0xff212121)),
                        left: BorderSide(width: 1, color: Color(0xff212121)),
                        right: BorderSide(width: 1, color: Color(0xff212121))),
                  ),
                  child: Center(
                      child: Text(
                    providerstate.language,
                    style: const TextStyle(
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                SizedBox(
                            height: queryData.size.height*0.2,
                          )
              ]),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomFooter()
              )
          ],
        ),
      ),
    );
  }
}


