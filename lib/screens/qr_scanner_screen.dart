import 'package:flutter/material.dart';
import 'package:myapp/helpers/utils.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/room_reservation_screen.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreen({Key? key}) : super(key: key);

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool isLoggedIn = false;
  String? userName;
  String? userEmail;
  bool isProcessing = false;

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
          "Scan QR Code",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoggedIn == false
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SignupScreen(),
                      ),
                    ),
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
            )
          : MobileScanner(
              onDetect: (capture) {
                if (isProcessing) return;
                setState(() {
                  isProcessing = true;
                });

                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  final String? data = barcode.rawValue;
                  if (data != null) {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (_) => RoomReservationScreen(roomNumber: data),
                      ),
                    )
                        .then((_) {
                      // Reset the flag when returning to this screen
                      setState(() {
                        isProcessing = false;
                      });
                    });
                    break; // Process only the first detected barcode
                  }
                }
              },
            ),
    );
  }
}
