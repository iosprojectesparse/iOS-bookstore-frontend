//In This we are declaring Bottom Footom For Every Screen.

import 'package:flutter/material.dart';
import 'package:mayaamind/screens/profile_screen.dart';
import 'package:mayaamind/screens/start_practice_screen.dart';
import 'package:provider/provider.dart';

import '../pro_state_mangement.dart';
import 'dashboard_screen.dart';

class BottomFooter extends StatefulWidget {
  const BottomFooter({ Key? key }) : super(key: key);

  @override
  _BottomFooterState createState() => _BottomFooterState();
}

class _BottomFooterState extends State<BottomFooter> {
  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    return Container(
            height: 65,
            alignment: Alignment.bottomCenter,
            width: double.maxFinite,
            decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(icon: const Icon(Icons.dashboard,color: Colors.white,), onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const DashBoard()));
                    },),
                     Text(providerstate.dashboard,style: const TextStyle(fontSize: 12,color: Colors.white),)
                  ],
                ),
                Column(
                  children: [
                    IconButton(icon: const Icon(Icons.play_arrow,color: Colors.white), onPressed: (){
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPracticeTest(practiceOrTest: true,)));
                    },),
                    Text(providerstate.test,style: const TextStyle(fontSize: 12,color: Colors.white),)
                  ],
                ),
                Column(
                  children: [
                    IconButton(icon: const Icon(Icons.person,color: Colors.white), onPressed: (){
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },),
                    Text(providerstate.profile,style: const TextStyle(fontSize: 12,color: Colors.white),)
                  ],
                )]));
  }
}