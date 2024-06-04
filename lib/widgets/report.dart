//This is the report screen.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';
import '../screens/report_screen.dart';

class Report extends StatelessWidget {
  const Report({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ProviderState providerstate = Provider.of<ProviderState>(context);
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ReportScreen()));
      },
      child: Card(
        color: const Color(0xffFDF7F2),
        child: ListTile(
          leading: Image.asset("images/resultimages/resultimage.png"),
          title: Text(
            "${providerstate.report} $number",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
