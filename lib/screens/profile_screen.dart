//This is the profile screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../networking.dart';
import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';
import 'edit_profile_screen.dart';
import 'faqscreen.dart';
import 'feedback_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  // late File _image;
  //
  // bool _visibility = false;
  //
  // bool val = false;
  //
  // late String dpath;
  //
  // late File img;
  //
  // Future getImage() async {
  //   final Directory dir = await getTemporaryDirectory();
  //   dpath = dir.path;
  //   try {
  //     final PickedFile? image =
  //         await ImagePicker().getImage(source: ImageSource.gallery);
  //
  //     setState(() {
  //       val = true;
  //       _visibility = true;
  //       _image = File(image!.path);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // late final PickedFile? image;
  //
  // Future getCamImage() async {
  //   try {
  //     final PickedFile? image =
  //         await ImagePicker().getImage(source: ImageSource.camera);
  //     setState(() {
  //       val = true;
  //       // _visibility = true;
  //       _image = File(image!.path);
  //       img = _image;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future cropImage() async {
  //   File? croppedFile = await ImageCropper.cropImage(
  //       sourcePath: _image.path,
  //       maxHeight: 512,
  //       maxWidth: 512,
  //       compressFormat: ImageCompressFormat.png,
  //       aspectRatioPresets: Platform.isAndroid
  //           ? [
  //               CropAspectRatioPreset.square,
  //               CropAspectRatioPreset.ratio3x2,
  //               CropAspectRatioPreset.original,
  //               CropAspectRatioPreset.ratio4x3,
  //               CropAspectRatioPreset.ratio16x9
  //             ]
  //           : [
  //               CropAspectRatioPreset.original,
  //               CropAspectRatioPreset.square,
  //               CropAspectRatioPreset.ratio3x2,
  //               CropAspectRatioPreset.ratio4x3,
  //               CropAspectRatioPreset.ratio5x3,
  //               CropAspectRatioPreset.ratio5x4,
  //               CropAspectRatioPreset.ratio7x5,
  //               CropAspectRatioPreset.ratio16x9
  //             ],
  //       androidUiSettings: const AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           toolbarColor: Color(0xff0088cc),
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       iosUiSettings: IOSUiSettings(
  //         title: 'Cropper',
  //       ));
  //
  //   if (croppedFile != null) {
  //     _image = croppedFile;
  //     // img = _image;
  //     // final File newImage = await img.copy('images/');
  //
  //     setState(() {
  //       // state = AppState.cropped;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    void navFeedback() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const FeedBackScreen()));
    }

    NetworkingProviderState networkingproviderstate =
        Provider.of<NetworkingProviderState>(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            providerstate.profile,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff212121)),
          ),
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
      backgroundColor: const Color(0xffFDF7F2),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      //getImage();
                    },
                    child: Center(
                      child: ClipRRect(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child:
                              // val
                              //     ? Image.file(img)
                              //     :
                              Image.asset("images/profile/propic.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      networkingproviderstate.uName ?? "User",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff212121)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xff212121),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     width: queryData.size.width * 0.2,
                  //     height: 40,
                  //     child: Center(
                  //       child: Text(
                  //         providerstate.edit,
                  //         style: const TextStyle(color: Colors.white, fontSize: 20),
                  //         textAlign: TextAlign.right,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                      child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                              ),
                            ],
                            color: Color(0xffFDF7F2),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ProfileContent(
                                  head: providerstate.profileDetails,
                                  funcnum: 1,
                                ),
                                ProfileContent(
                                  head: providerstate.settings,
                                  funcnum: 2,
                                ),
                                ProfileContent(
                                  head: providerstate.faq,
                                  funcnum: 3,
                                ),
                                ProfileContent(
                                  head: providerstate.feedback,
                                  funcnum: 4,
                                ),
                                ProfileContent(
                                  head: providerstate.about,
                                  funcnum: 5,
                                ),
                                SizedBox(
                            height: queryData.size.height*0.2,
                          )
                              ],
                            ),
                          ))),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomFooter()
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({required this.head, required this.funcnum});
  final String head;
  final int funcnum;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (funcnum == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileDetailsScreen()));
        } else if (funcnum == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FeedBackScreen()));
        } else if (funcnum == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const FAQScreen()));
        } else if (funcnum == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FeedBackScreen()));
        } else if (funcnum == 5) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AboutScreen()));
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Card(
          color: const Color(0xffFDF7F2),
          child: Center(
            child: Text(
              head,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff212121)),
            ),
          ),
        ),
      ),
    );
  }
}
