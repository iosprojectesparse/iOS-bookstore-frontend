//Next Button Widget.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pro_state_mangement.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  final Function function;

  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    return TextButton(
      onPressed: function(),
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
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
