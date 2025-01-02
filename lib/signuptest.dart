import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var imageCtrl = TextEditingController();

  bool showPassword = false;

  String? _imagePath;

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = basename(pickedFile.path);
        ;
        imageCtrl.text = _imagePath ?? "";
      });
    } else {
      print('No image selected.');
    }
  }

  void _clearImage() {
    setState(() {
      _imagePath = null;
      imageCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Image.asset("assets/images/logo/logo_dark.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25 ,left: 18.0, right: 18,bottom: 20 ),
              child: TextField(
                controller: emailCtrl,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: emailCtrl.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              emailCtrl.clear();
                            });
                          },
                          icon: Icon(Icons.cancel),
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18,bottom: 20),
              child: TextField(
                controller: passwordCtrl,
                obscureText: showPassword ? true : false,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: passwordCtrl.text.isEmpty
                      ? null
                      : showPassword
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(Icons.visibility_off),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(Icons.visibility),
                            ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18,bottom: 20 ),
              child: TextField(
                controller: imageCtrl,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                  suffixIcon: _imagePath != null
                      ? IconButton(
                          onPressed: _clearImage,
                          icon: Icon(Icons.cancel),
                        )
                      : TextButton(
                          onPressed: _pickImageFromGallery,
                          child: Text("Pick"),
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 18.0, right: 18.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Create Account"),
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ), fixedSize: Size.fromHeight(50),
              backgroundColor: Color(0xFF042075),
              foregroundColor: Colors.white
              ), 
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account?"),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  ),
                  child: Text("Log in"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
