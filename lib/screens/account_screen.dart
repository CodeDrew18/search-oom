import 'package:flutter/material.dart';
import 'package:myapp/helpers/utils.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/signup_screen.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isLoggedIn = false;
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  Future<void> checkLoginState() async {
    bool loginState = await getLoginState();
    String? name = await getUserName();
    String? email = await getUserEmail();
    setState(() {
      isLoggedIn = loginState;
      userName = name;
      userEmail = email;
    });
  }

  Future<void> logout() async {
    await clearLoginDetails();
    setState(() {
      isLoggedIn = false;
      userName = null;
      userEmail = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoggedIn == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 35,
                ),
                CircleAvatar(
                  radius: 40,
                  child: Text(
                    userName != null && userName!.isNotEmpty
                        ? userName![0].toUpperCase()
                        : "U",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  userName ?? "User",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  userEmail ?? "",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: logout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF042075),
                      foregroundColor: Colors.white,
                      fixedSize: Size(200, 50),
                    ),
                    child: Text("Logout"),
                  ),
                ),
              ],
            )
          : ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 35),
                CircleAvatar(
                  radius: 35,
                  child: Text("G"),
                ),
                SizedBox(height: 10),
                Text(
                  "Guest",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "The Features can only access when you are now member of the Search’oom",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final result =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SignupScreen(),
                      ));

                      if (result != null && result.isNotEmpty) {
                        setState(() {
                          isLoggedIn = result[0];
                          userName = result[1];
                          userEmail = result[2];
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      backgroundColor: Color(0xFF042075),
                      foregroundColor: Colors.white,
                      fixedSize: Size.fromHeight(50),
                    ),
                    child: Text("Create an Account"),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(),
                        ),
                      );

                      if (result != null && result.isNotEmpty) {
                        setState(() {
                          isLoggedIn = result[0];
                          userName = result[1];
                          userEmail = result[2];
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      backgroundColor: Color(0xFF042075),
                      foregroundColor: Colors.white,
                      fixedSize: Size.fromHeight(50),
                    ),
                    child: Text("Log in"),
                  ),
                ),
              ],
            ),
    );
  }
}
