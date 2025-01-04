import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotif = false;
  bool emailNotif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "About and Terms",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.article),
                backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
              ),
              title: Text("Terms and Condition", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.security),
                backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
              ),
              title: Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.info),
                backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
              ),
              title: Text("About Us", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "More",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.notifications),
                backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
              ),
              title: Text("Push Notification", style: TextStyle(fontWeight: FontWeight.w500)),
              trailing: Switch(value: pushNotif,
              activeColor: Color(0xFF042075)
              , onChanged: (bool value){
                setState(() {
                  pushNotif = value;
                });
              }) ,
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.email),
                backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
              ),
              title: Text("Email Notification", style: TextStyle(fontWeight: FontWeight.w500)),
              trailing: Switch(value: emailNotif,
              activeColor: Color(0xFF042075)
              , onChanged: (bool value){
                setState(() {
                  emailNotif = value;
                });
              }) ,
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.support_agent),
                backgroundColor: Color(0xFF042075),
                foregroundColor: Colors.white,
              ),
              title: Text("Help & Support", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}