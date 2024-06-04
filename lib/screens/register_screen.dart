//This is the registration screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import '../widgets/register_login_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  String val = "English";

  String name = "User";

  bool onGenderChanged = false;

  bool onAgeChanged = false;

  bool onCountryChanged = false;

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
    // String? _name;
    // String? _password;
    // String? _email;
    // String? _gender;
    // String? _age;
    // String? _phone;

    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    NetworkingProviderState networkingproviderstate =
        Provider.of<NetworkingProviderState>(context);

    List<String> gender = [
      providerstate.male,
      providerstate.female,
      providerstate.others
    ];

    //.......................... Gender DropDown Beginning......................................

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
            networkingproviderstate.uGender = value;
            Provider.of<ProviderState>(context, listen: false).Fgender(value!);
          });
    }
    //....................................Gender dropDown end.........................................

    //......................country dropdown beginning ......................

    DropdownButton<String> CountryAndroidDropdown() {
      List<DropdownMenuItem<String>> countrydropdownitems = [];
      for (String i in country) {
        DropdownMenuItem<String> age = DropdownMenuItem(
          child: Text(i),
          value: i,
        );
        countrydropdownitems.add(age);
      }

      return DropdownButton<String>(
          underline: const SizedBox.shrink(),
          hint: Text(providerstate.country),
          items: countrydropdownitems,
          value: !onCountryChanged ? null : providerstate.selectedCountry,
          onChanged: (value) {
            onCountryChanged = true;
            Provider.of<ProviderState>(context, listen: false).Fcountry(value!);
          });
    }

    //....................UI.................................................

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        elevation: 0,
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
      :SingleChildScrollView(
          child: Container(
            width: queryData.size.width,
            height: queryData.size.height,
            color: Color(0xff212121),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox(
                  //   height: queryData.size.height * 0.125,
                  // ),
                  Text(
                    providerstate.welcome[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    providerstate.welcome[1],
                    style: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.02,
                  ),
                  SizedBox(
                    width: queryData.size.width * 8,
                    height: queryData.size.height * 0.07,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        networkingproviderstate.uName = val;
                      },

                      style: TextStyle(
                          color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xffFDF7F2).withOpacity(0.45),
                                width: 1.0)),
                        labelText: providerstate.name,
                        labelStyle: TextStyle(
                            color: const Color(0xffFDF7F2).withOpacity(0.45)),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xffFDF7F2).withOpacity(0.45),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: providerstate.hintname,
                        hintStyle: TextStyle(
                            color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: queryData.size.width * 0.3,
                        height: queryData.size.height * 0.07,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            var myAge = int.parse(value);
                            networkingproviderstate.uAge = myAge;

                          },
                          style: TextStyle(
                              color: const Color(0xffFDF7F2).withOpacity(0.45)),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffFDF7F2).withOpacity(0.45),
                                    width: 1.0)),
                            labelText: providerstate.age,
                            labelStyle: TextStyle(
                                color: const Color(0xffFDF7F2).withOpacity(0.45)),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xffFDF7F2).withOpacity(0.45),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: providerstate.hintage,
                            hintStyle: TextStyle(
                                color: const Color(0xffFDF7F2).withOpacity(0.45)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: queryData.size.width * 0.3,
                        height: queryData.size.height * 0.07,
                        child: Center(child: GenderAndroidDropdown()),
                      )
                    ],
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 45,
                    child: Center(child: CountryAndroidDropdown()),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.02,
                  ),
                  SizedBox(
                    width: queryData.size.width * 8,
                    height: queryData.size.height * 0.07,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        networkingproviderstate.uEmail = val;
                      },
                      style: TextStyle(
                          color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xffFDF7F2).withOpacity(0.45),
                                width: 1.0)),
                        labelText: providerstate.email,
                        labelStyle: TextStyle(
                            color: const Color(0xffFDF7F2).withOpacity(0.45)),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xffFDF7F2).withOpacity(0.45),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "eg. john@gmail.com",
                        hintStyle: TextStyle(
                            color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.02,
                  ),
                  SizedBox(
                    width: queryData.size.width * 8,
                    height: queryData.size.height * 0.07,
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        networkingproviderstate.uPass = val;
                      },
                      style: TextStyle(
                          color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xffFDF7F2).withOpacity(0.45),
                                width: 1.0)),
                        labelText: providerstate.password,
                        labelStyle: TextStyle(
                            color: const Color(0xffFDF7F2).withOpacity(0.45)),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xffFDF7F2).withOpacity(0.45),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "eg. john@12#+",
                        hintStyle: TextStyle(
                            color: const Color(0xffFDF7F2).withOpacity(0.45)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.04,
                  ),
                  RegisterLoginButton(
                    login: false,
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        providerstate.have,
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(providerstate.login),
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      width: queryData.size.width * 0.5,
                      child: Text(
                        providerstate.policy,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFDF7F2),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
