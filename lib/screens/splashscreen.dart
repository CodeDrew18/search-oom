import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.gif(
          gifPath: 'assets/splashscreen/splash.gif',
          gifWidth: MediaQuery.of(context).size.width,
          gifHeight: MediaQuery.of(context).size.height,
          nextScreen:  HomeScreen(),
          backgroundColor: Color(0xFF042075),
          duration: Duration(seconds: 14),
        ),
    );
  }
}