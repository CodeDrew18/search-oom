import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:myapp/helpers/utils.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  Future<void> checkLoginState() async {
    bool loginState = await getLoginState();
    setState(() {
      isLoggedIn = loginState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.gif(
        gifPath: 'assets/splashscreen/splash.gif',
        gifWidth: MediaQuery.of(context).size.width,
        gifHeight: MediaQuery.of(context).size.height,
        nextScreen: isLoggedIn ? HomeScreen() : IntroductionScreen(),
        backgroundColor: Color(0xFF042075),
        duration: Duration(seconds: 14),
      ),
    );
  }
}
