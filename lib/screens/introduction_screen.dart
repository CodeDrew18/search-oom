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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, left: 18, right: 18),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.asset(
                          "assets/images/introduction/introduction_1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(textAlign: TextAlign.center,
                          "Quickly locate an available classroom for your next lecture or seminar, ensuring a seamless teaching experience.", 
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                    ],
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.only(bottom: 18.0, left: 18, right: 18),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.asset(
                          "assets/images/introduction/introduction_2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(textAlign: TextAlign.center,
                          "Easily find open lecture rooms, perfectly suited for your class schedule and student capacity.",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.only(bottom: 18.0, left: 18, right: 18),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.asset(
                          "assets/images/introduction/introduction_3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(textAlign: TextAlign.center,
                          "Ensure you have the right room, available at the right time, for your lessons with real-time room availability updates.",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
            child: ElevatedButton(
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
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                
              ), fixedSize: Size.fromHeight(50),
              backgroundColor: Color(0xFF042075),
              foregroundColor: Colors.white
            ),),
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
