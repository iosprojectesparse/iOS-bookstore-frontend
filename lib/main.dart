//main file

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';
import 'package:mayaamind/pro_state_mangement.dart';
import 'package:provider/provider.dart';
import 'health_answers.dart';
import 'networking.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const VisionApp());
}

class VisionApp extends StatelessWidget {
  const VisionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderState>(
          create: (context) => ProviderState(),
        ),
        ChangeNotifierProvider<NetworkingProviderState>(
          create: (context) => NetworkingProviderState(),
        ),
        ChangeNotifierProvider<HealthAnswers>(
          create: (context) => HealthAnswers(),
        )
      ],
      child:  MaterialApp(
        navigatorObservers: [SmartlookObserver()],
        home: const SplashScreen(),
      ),
    );
  }
}
//SplashScreen()
//TestQuestionScreen()