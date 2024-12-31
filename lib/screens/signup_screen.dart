import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

  File? selectedImage;

  Future<void> _requestPermission() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      // Proceed to pick the image
      _pickImageFromGallery();
    } else {
      print('Permission denied for managing external storage');
    }
  }

  Future<void> _pickImageFromGallery() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final savedImage = await _saveImageLocally(File(pickedFile.path));
        setState(() {
          selectedImage = savedImage;
          imageCtrl.text = basename(savedImage.path);
        });
      } else {
        print('No image selected.');
      }
    } else {
      print('Permission denied');
    }
  }

  Future<File> _saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();

    final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
    final savedPath = '${directory.path}/$fileName';
    return imageFile.copy(savedPath);
  }

  void _clearImage() {
    setState(() {
      selectedImage = null;
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
              padding: const EdgeInsets.only(
                  top: 25, left: 18.0, right: 18, bottom: 20),
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
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 20),
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
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 20),
              child: TextField(
                controller: imageCtrl,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                  suffixIcon: selectedImage != null
                      ? IconButton(
                          onPressed: _clearImage,
                          icon: Icon(Icons.cancel),
                        )
                      : TextButton(
                          onPressed: _requestPermission,
                          child: Text("Pick"),
                        ),
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 25, left: 18.0, right: 18.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Create Account"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fixedSize: Size.fromHeight(50),
                      backgroundColor: Color(0xFF042075),
                      foregroundColor: Colors.white),
                )),
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
