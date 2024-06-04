//This is the FeedBack Screen.

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../networking.dart';
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  bool isInternet = true;
  late AudioPlayer audioPlayer;
  final fieldText = TextEditingController();
  double rating = 3.0;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.dispose();
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    });
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
    ProviderState providerstate = Provider.of<ProviderState>(context);
    NetworkingProviderState sendReviews = Provider.of<NetworkingProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);
    Object? val;
    audioPlayer.stop();

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        title: Center(
          child: Text(
            providerstate.feedback,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()));
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
        backgroundColor: const Color(0xff212121),
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
                      child: Image.asset("images/icons/noInternet.png"),
                    ),
                    const Text(
                      "No Internet Access",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: queryData.size.height * 0.03,
                      ),
                      Center(
                        child: SizedBox(
                          width: queryData.size.width * 0.8,
                          child: TextField(
                            controller: fieldText,
                            maxLines: 10,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: providerstate.youranswer),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.05,
                      ),
                      RatingBar(
                        initialRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Color(0xFFFFC805),
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Color(0xFFFFC805),
                          ),
                          empty: const Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                        ),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rate) {
                          print(rate);
                          rating = rate;
                        },
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.05,
                      ),
                      TextButton(
                        onPressed: () async{
                          if(fieldText.text.isNotEmpty){
                            await sendReviews.postReview(fieldText.text, rating).then((value){
                            fieldText.clear();
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Review Added!")));
                          });
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Add Riview")));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: queryData.size.width * 0.4,
                          height: queryData.size.height * 0.07,
                          child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const BottomFooter()
                ],
              ),
      ),
    );
  }
}
