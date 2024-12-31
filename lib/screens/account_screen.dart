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
        title: Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 35,
          ),
          CircleAvatar(
            radius: 35,
            child: Text("G"),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Guest", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18, top: 12),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                  "The Features can only access when you are now member of the Search’oom",style: TextStyle(fontWeight: FontWeight.w500),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SignupScreen(),
                ),
              ),style:ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)
                ), backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
                                  fixedSize: Size.fromHeight(50)
              ),  
              child: Text("Create an Account"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ),
              ),style:ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)
                ), backgroundColor: Color(0xFF042075),
                  foregroundColor: Colors.white,
                  fixedSize: Size.fromHeight(50)
              ) ,
              child: Text("Log in"),
            ),
          ),
        ],
      ),
    );
  }
}
