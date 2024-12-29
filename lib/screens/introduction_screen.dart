import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';

class IntroductionScreen extends StatefulWidget {
  IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  var imageCtrl = PageController();

  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(
              "assets/images/logo/logo_dark.png",
            ),
          ),
          Expanded(
            child: PageView(
              controller: imageCtrl,
              onPageChanged: (int index) {
                setState(() {
                  currentImageIndex = index;
                });
              },
              children: [
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(
                        "assets/images/introduction/introduction_1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                        "Quickly locate an available classroom for your next lecture or seminar, ensuring a seamless teaching experience."),
                  ],
                ),
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(
                        "assets/images/introduction/introduction_2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                        "Easily find open lecture rooms, perfectly suited for your class schedule and student capacity."),
                  ],
                ),
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(
                        "assets/images/introduction/introduction_3.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                        "Ensure you have the right room, available at the right time, for your lessons with real-time room availability updates."),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: currentImageIndex == 0 ? 40 : 20,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 5,
                width: currentImageIndex == 1 ? 40 : 20,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 5,
                width: currentImageIndex == 2 ? 40 : 20,
                color: Colors.black,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (currentImageIndex < 2) {
                imageCtrl.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              }
            },
            child: Text(currentImageIndex < 2 ? "Next" : "Get Started"),
          ),
          TextButton(
            onPressed: currentImageIndex < 2
                ? () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      ),
                    )
                : null,
            child: Text(currentImageIndex < 2 ? "Skip" : ""),
          ),
        ],
      ),
    );
  }
}
