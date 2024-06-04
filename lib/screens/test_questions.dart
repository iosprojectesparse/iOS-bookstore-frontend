//Health profile questions screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../health_answers.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import '../constants.dart' as Constants;
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'dashboard_screen.dart';
import 'generatingresult_screen.dart';

class TestQuestionScreen extends StatefulWidget {
  const TestQuestionScreen({Key? key}) : super(key: key);

  @override
  State<TestQuestionScreen> createState() => _TestQuestionScreenState();
}

bool x = false;
Object? val;
Object? val2;
Object? val3;
Object? val4;
Object? val5;
bool visibility = false;
int additionalQuestionNumber = 1;
final fieldText1 = TextEditingController();
final fieldText2 = TextEditingController();

class _TestQuestionScreenState extends State<TestQuestionScreen> {
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

  final _year =
  ["2022","2021","2020","2019","2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000","1999","1998"];
    String? _chosenValue;
    String? _valuechoosen;
    List<String> year = Constants.Years;




  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    HealthAnswers healthAnswers = Provider.of<HealthAnswers>(context);
    NetworkingProviderState networkingProviderState = Provider.of<NetworkingProviderState>(context);
    healthAnswers.xName = networkingProviderState.uName ?? "name";
    healthAnswers.xEmail = networkingProviderState.uEmail ?? "Email";
    healthAnswers.userId = networkingProviderState.UserId ?? "";
    final _disease = providerstate.diseaselist;

    _customDropDownDisease(){
      return Container(
        padding: const EdgeInsets.all(0.0),
        child: DropdownButton<String>(
          value: _chosenValue,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          items: _disease.map((String Value1) {
            return DropdownMenuItem<String>(
              value: Value1,
              child: Text(Value1),
            );
          }).toList(),
          hint: const Text(
            "Select Disease",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
          onChanged: (val){
            setState(() {
              _chosenValue = val;
              healthAnswers.xAnswer2 = _chosenValue;
            });
          },
        ),
      );
    }

    _customDropDownYear(){
      return Container(
        padding: const EdgeInsets.all(0.0),
        child: DropdownButton<String>(
          value: _valuechoosen,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          items: year.map((String Value1) {
            return DropdownMenuItem<String>(
              value: Value1,
              child: Text(Value1),
            );
          }).toList(),
          hint: const Text(
            "Select Year",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
          onChanged: (val){
            setState(() {
              _valuechoosen = val;
              healthAnswers.xAnswer3 = _valuechoosen;
            });
          },
        ),
      );
    }


    return Scaffold(
      backgroundColor: const Color(0xffFDF7F2),
      appBar: AppBar(
        leading: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const DashBoard()));
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xff212121),
            ),
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          providerstate.test,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff212121)),
        ),
        actions: [
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
      floatingActionButton: Visibility(
        visible: visibility,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            onPressed: () async{
              print(additionalQuestionNumber);
              setState(() {
                          fieldText1.clear();
                          fieldText2.clear();
                          visibility = false;
                          if (additionalQuestionNumber < 6) {
                            additionalQuestionNumber += 1;
                            if (additionalQuestionNumber == 2) {
                              visibility = true;
                            }
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Generating()));
                          }
              });
              if(additionalQuestionNumber == 6){
                print("heyyyyy");
                await healthAnswers.postAnswers();
              }
            },
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Image(image: AssetImage("images/icons/right.png"),color: Color(0xffFDF7F2),),
          ),
        ),
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
      :Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: queryData.size.height * 0.01,
                    ),
                    Text(
                      providerstate.healthprofile,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                     SizedBox(
                      height: queryData.size.height * 0.01,
                    ),
                    SingleChildScrollView(
                      child: additionalQuestionNumber == 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                  Text(
                                    providerstate.testquestion1,
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.01,
                                  ),
                                  ListTile(
                                    title: Text(providerstate.testquestionanswer1_1),
                                    leading: _customRadioButton(1,1,healthAnswers,providerstate,context),
                                  ),
                                  ListTile(
                                    title: Text(providerstate.testquestionanswer1_2),
                                    leading:_customRadioButton(2,1,healthAnswers,providerstate,context),
                                  ),
                                  ListTile(
                                    title: Text(providerstate.testquestionanswer1_3),
                                    leading: _customRadioButton(3,1,healthAnswers,providerstate,context),
                                  ),
                                  ListTile(
                                    title: Text(providerstate.testquestionanswer1_4),
                                    leading: _customRadioButton(4,1,healthAnswers,providerstate,context),
                                  ),
                                ])
                          : additionalQuestionNumber == 2
                              ? SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          providerstate.testquestion2,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                         height: queryData.size.height * 0.01,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                              width: queryData.size.width * 0.7,
                                              height: 45,
                                              child: _customDropDownDisease()),
                                        ),
                                        SizedBox(
                                          height: queryData.size.height * 0.015,
                                        ),
                                        Text(
                                          providerstate.diagnosedyear,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: queryData.size.height * 0.015,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                            width: queryData.size.width * 0.7,
                                            height: 45,
                                            child: _customDropDownYear(),
                                          ),
                                        ),
                                      ]),
                                )
                              : additionalQuestionNumber == 3
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                          Text(
                                            providerstate.testquestion3,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: queryData.size.height * 0.01,
                                          ),
                                          ListTile(
                                            title: Row(
                                              children: [
                                                SizedBox(
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                        "images/test_question_imogi/excellent.png"),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: queryData.size.width * 0.01,
                                                ),
                                                Text(providerstate
                                                    .testquestionanswer3_1),
                                              ],
                                            ),
                                            leading: _customRadioButton(1,4,healthAnswers,providerstate,context),
                                          ),
                                          ListTile(
                                            title: Row(
                                              children: [
                                                SizedBox(
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                        "images/test_question_imogi/good.png"),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: queryData.size.width * 0.01,
                                                ),
                                                Text(providerstate
                                                    .testquestionanswer3_2),
                                              ],
                                            ),
                                            leading: _customRadioButton(2,4,healthAnswers,providerstate,context),
                                          ),
                                          ListTile(
                                            title: Row(
                                              children: [
                                                SizedBox(
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                        "images/test_question_imogi/fair.png"),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: queryData.size.width * 0.01,
                                                ),
                                                Text(providerstate
                                                    .testquestionanswer3_3),
                                              ],
                                            ),
                                            leading: _customRadioButton(3,4,healthAnswers,providerstate,context),
                                          ),
                                          ListTile(
                                            title: Row(
                                              children: [
                                                SizedBox(
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                        "images/test_question_imogi/poor.png"),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: queryData.size.width * 0.01,
                                                ),
                                                Text(providerstate
                                                    .testquestionanswer3_4),
                                              ],
                                            ),
                                            leading: _customRadioButton(4,4,healthAnswers,providerstate,context),
                                          ),
                                          ListTile(
                                            title: Row(
                                              children: [
                                                SizedBox(
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                        "images/test_question_imogi/terrible.png"),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: queryData.size.width * 0.01,
                                                ),
                                                Text(providerstate
                                                    .testquestionanswer3_5),
                                              ],
                                            ),
                                            leading: _customRadioButton(5,4,healthAnswers,providerstate,context),
                                          ),
                                        ])
                                  : additionalQuestionNumber == 4
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                              Text(
                                                providerstate.testquestion4,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: queryData.size.height * 0.01,
                                              ),
                                              ListTile(
                                                title: Row(
                                                  children: [
                                                    SizedBox(
                                                      child: ClipRRect(
                                                        child: Image.asset(
                                                            "images/test_question_imogi/excellent.png"),
                                                      ),
                                                    ),
                                                    SizedBox(width: queryData.size.width * 0.01,),
                                                    Text(providerstate
                                                        .testquestionanswer4_1),
                                                  ],
                                                ),
                                                leading: _customRadioButton(1,5,healthAnswers,providerstate,context),
                                              ),
                                              ListTile(
                                                title: Row(
                                                  children: [
                                                    SizedBox(
                                                      child: ClipRRect(
                                                        child: Image.asset(
                                                            "images/test_question_imogi/good.png"),
                                                      ),
                                                    ),
                                                    SizedBox(width: queryData.size.width * 0.01,),
                                                    Text(providerstate
                                                        .testquestionanswer4_2),
                                                  ],
                                                ),
                                                leading: _customRadioButton(2,5,healthAnswers,providerstate,context),
                                              ),
                                              ListTile(
                                                title: Row(
                                                  children: [
                                                    SizedBox(
                                                      child: ClipRRect(
                                                        child: Image.asset(
                                                            "images/test_question_imogi/fair.png"),
                                                      ),
                                                    ),
                                                    SizedBox(width: queryData.size.width * 0.01,),
                                                    Text(providerstate
                                                        .testquestionanswer4_3),
                                                  ],
                                                ),
                                                leading: _customRadioButton(3,5,healthAnswers,providerstate,context),
                                              ),
                                              ListTile(
                                                title: Row(
                                                  children: [
                                                    SizedBox(
                                                      child: ClipRRect(
                                                        child: Image.asset(
                                                            "images/test_question_imogi/poor.png"),
                                                      ),
                                                    ),
                                                    SizedBox(width: queryData.size.width * 0.01,),
                                                    Text(providerstate
                                                        .testquestionanswer4_4),
                                                  ],
                                                ),
                                                leading:_customRadioButton(4,5,healthAnswers,providerstate,context),
                                              ),
                                              ListTile(
                                                title: Row(
                                                  children: [
                                                    SizedBox(
                                                      child: ClipRRect(
                                                        child: Image.asset(
                                                            "images/test_question_imogi/terrible.png"),
                                                      ),
                                                    ),
                                                    SizedBox(width: queryData.size.width * 0.01,),
                                                    Text(providerstate
                                                        .testquestionanswer4_5),
                                                  ],
                                                ),
                                                leading: _customRadioButton(5,5,healthAnswers,providerstate,context),
                                              ),
                                            ])
                                      : additionalQuestionNumber == 5
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                  Text(
                                                    providerstate.testquestion5,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: queryData.size.height * 0.01,
                                                  ),
                                                   SizedBox(
                                                    height: queryData.size.height * 0.01,
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/excellent.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: queryData.size.width * 0.01,),
                                                        Text(providerstate
                                                            .testquestionanswer5_1),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(1,6,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/good.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: queryData.size.width * 0.01,),
                                                        Text(providerstate
                                                            .testquestionanswer5_2),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(2,6,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/fair.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: queryData.size.width * 0.01,),
                                                        Text(providerstate
                                                            .testquestionanswer5_3),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(3,6,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/poor.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: queryData.size.width * 0.01,),
                                                        Text(providerstate
                                                            .testquestionanswer5_4),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(4,6,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/terrible.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: queryData.size.width * 0.01,),
                                                        Text(providerstate
                                                            .testquestionanswer5_5),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(5,6,healthAnswers,providerstate,context),
                                                  ),
                                                ])
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                  Text(
                                                    providerstate.testquestion6,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                   SizedBox(
                                                    height: queryData.size.height * 0.005,
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/excellent.png"),
                                                          ),
                                                        ),
                                                         SizedBox(width: queryData.size.width * 0.02,),
                                                        Expanded(
                                                          child: Text(providerstate
                                                              .testquestionanswer6_1,
                                                              style: const TextStyle(fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(1,7,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/good.png"),
                                                          ),
                                                        ),
                                                         SizedBox(width: queryData.size.width * 0.02),
                                                        Expanded(
                                                          child: Text(
                                                            providerstate
                                                                .testquestionanswer6_2,
                                                                style: const TextStyle(fontSize: 12)
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(2,7,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/fair.png"),
                                                          ),
                                                        ),
                                                         SizedBox(width: queryData.size.width * 0.02),
                                                        Expanded(
                                                          child: Text(providerstate
                                                              .testquestionanswer6_3,
                                                              style: const TextStyle(fontSize: 12)),
                                                        )
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(3,7,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/poor.png"),
                                                          ),
                                                        ),
                                                         SizedBox(width: queryData.size.width * 0.02),
                                                        Expanded(
                                                          child: Text(providerstate
                                                              .testquestionanswer6_4,
                                                              style: const TextStyle(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(4,7,healthAnswers,providerstate,context),
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: ClipRRect(
                                                            child: Image.asset(
                                                                "images/test_question_imogi/terrible.png"),
                                                          ),
                                                        ),
                                                         SizedBox(width: queryData.size.width * 0.02),
                                                        Expanded(
                                                          child: Text(providerstate
                                                              .testquestionanswer6_5,
                                                              style: const TextStyle(fontSize: 12)),
                                                        )
                                                      ],
                                                    ),
                                                    leading: _customRadioButton(5,7,healthAnswers,providerstate,context),
                                                  ),
                                                ]),
                    ),
                    Expanded(child: Container()),
                    /*Visibility(
                      visible: visibility,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            fieldText1.clear();
                            fieldText2.clear();
                            visibility = false;
                            if (additionalQuestionNumber < 6) {
                              additionalQuestionNumber += 1;
                              if (additionalQuestionNumber == 2) {
                                visibility = true;
                              }
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Generating()));
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff212121),
                              borderRadius: BorderRadius.circular(10)),
                          width: queryData.size.width * 0.4,
                          height: 40,
                          child: Center(
                            child: Text(
                              providerstate.next,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
            const BottomFooter()
          ],
        ),
      ),
    );
  }
  int value = 0;
  _customRadioButton(int index, int question, HealthAnswers answers, ProviderState state,BuildContext ctx){
  return InkWell(
    onTap: (){
      setState(() {
        value = index;
        visibility = true;
        if(question==1){
          if(value == 1){
            answers.xAnswer1 = state.testquestionanswer1_1;
          }else if(value ==2){
            answers.xAnswer1 = state.testquestionanswer1_2;
          }else if(value == 3){
            answers.xAnswer1 = state.testquestionanswer1_3;
          }else if(value == 4){
            answers.xAnswer1 = state.testquestionanswer1_4;
          }
        }else if(question==4){
          if(value == 1){
            answers.xAnswer4 = state.testquestionanswer3_1;
          }else if(value ==2){
            answers.xAnswer4 = state.testquestionanswer3_2;
          }else if(value == 3){
            answers.xAnswer4 = state.testquestionanswer3_3;
          }else if(value == 4){
            answers.xAnswer4 = state.testquestionanswer3_4;
          }else if(value == 5){
            answers.xAnswer4 = state.testquestionanswer3_5;
          }
        }else if(question==5){
          if(value == 1){
            answers.xAnswer5 = state.testquestionanswer4_1;
          }else if(value ==2){
            answers.xAnswer5 = state.testquestionanswer4_2;
          }else if(value == 3){
            answers.xAnswer5 = state.testquestionanswer4_3;
          }else if(value == 4){
            answers.xAnswer5 = state.testquestionanswer4_4;
          }else if(value == 5){
            answers.xAnswer5 = state.testquestionanswer4_5;
          }
        }else if(question == 6){
          if(value == 1){
            answers.xAnswer6 = state.testquestionanswer5_1;
          }else if(value ==2){
            answers.xAnswer6  = state.testquestionanswer5_2;
          }else if(value == 3){
            answers.xAnswer1 = state.testquestionanswer5_3;
          }else if(value == 4){
            answers.xAnswer6  = state.testquestionanswer5_4;
          }else if(value == 5){
            answers.xAnswer6  = state.testquestionanswer5_5;
          }
        }else if(question == 7){
          if(value == 1){
            answers.xAnswer7 = state.testquestionanswer6_1;
          }else if(value ==2){
            answers.xAnswer7 = state.testquestionanswer6_2;
          }else if(value == 3){
            answers.xAnswer7 = state.testquestionanswer6_3;
          }else if(value == 4){
            answers.xAnswer7 = state.testquestionanswer6_4;
          }else if(value == 5){
            answers.xAnswer7 = state.testquestionanswer6_5;
          }
        }
      });
    },
    child: Container(
      width: 35,
      height: 35,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.black)
          ),
          color: (value==index)?Colors.black:Color(0xFDF7F2)
          ),

      child: Center(child: Icon(
        Icons.check,
        color: (value==index)?Colors.white:Color(0xFDF7F2),
        size: 20,
        )),
    ),
  );
}
@override
  void setState(VoidCallback fn) {
    value=0;
    super.setState(fn);
  }
}


