import 'package:emochat/constants.dart';
import 'package:emochat/screens/chat.dart';
import 'package:emochat/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'IBMPlexSans',
          textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 16)),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Palette.primaryDark),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      builder: (context, child) {
        return ScrollConfiguration(behavior: NoScrollGlow(), child: child!);
      },
      home: Scaffold(
          body: FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const OnboardingScreen();
                  default:
                    if (!snapshot.hasError) {
                      return snapshot.data!.getBool("welcome") != null
                          ? const ChatScreen()
                          : const OnboardingScreen();
                    } else {
                      return const Center(
                        child:
                            Text('Failed to load data. Please click to retry'),
                      );
                    }
                }
              })),
    );
  }
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
