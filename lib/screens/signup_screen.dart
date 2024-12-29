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
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Image.asset("assets/images/logo/logo_dark.png"),
            ),
            TextField(
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
            TextField(
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
            TextField(
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
            ElevatedButton(
              onPressed: () {},
              child: Text("Create Account"),
            ),
            Row(
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
