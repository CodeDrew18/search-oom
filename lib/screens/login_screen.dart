import 'package:flutter/material.dart';
import 'package:myapp/helpers/db_helper.dart';
import 'package:myapp/helpers/utils.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  bool showPassword = true;

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
            Text(
              "Login with email address",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
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
              padding: const EdgeInsets.only(top: 10.0, left: 18, right: 18),
              child: ElevatedButton(
                onPressed: () async {
                  if (emailCtrl.text != "" && passwordCtrl.text != "") {
                    var users = await DbHelper.fetchUsers(
                        email: emailCtrl.text, password: passwordCtrl.text);

                    if (users.isNotEmpty) {
                      var user = users.first;

                      var userName =
                          "${user[DbHelper.userFirstName]} ${user[DbHelper.userLastName]}";

                      setLoginDetails(true, emailCtrl.text, userName);

                      Navigator.of(context).pop([true, emailCtrl.text, userName]);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid email or password.')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields.')),
                    );
                  }
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    fixedSize: Size.fromHeight(50),
                    backgroundColor: Color(0xFF042075),
                    foregroundColor: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
