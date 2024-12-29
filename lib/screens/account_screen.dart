import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/signup_screen.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Column(
        children: [
          CircleAvatar(
            child: Text("G"),
          ),
          Text("Guest"),
          Text(
              "The Features can only access when you are now member of the Search’oom"),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SignupScreen(),
              ),
            ),
            child: Text("Create an Account"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            ),
            child: Text("Log in"),
          ),
        ],
      ),
    );
  }
}
