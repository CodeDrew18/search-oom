import 'package:flutter/material.dart';
import 'package:myapp/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  bool showPassword = false;

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
            Text("Login with email address"),
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
            ElevatedButton(
              onPressed: () {},
              child: Text("Login"),
            ),
            Row(
              children: [
                Text("Don’t have an account?"),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignupScreen(),
                    ),
                  ),
                  child: Text("Sign up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
