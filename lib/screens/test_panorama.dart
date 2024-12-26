import 'package:flutter/material.dart';
import 'package:panorama_image/panorama_image.dart';

class TestPanorama extends StatefulWidget {
  TestPanorama({Key? key}) : super(key: key);

  @override
  TestPanoramaState createState() => TestPanoramaState();
}

class TestPanoramaState extends State<TestPanorama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Panorama"),
      ),
      body: AspectRatio(
        aspectRatio: 3 / 1.5,
        child: PanoramaViewer(
          image: AssetImage("assets/images/rooms/final 1.png"),
        ),
      ),
    );
  }
}
