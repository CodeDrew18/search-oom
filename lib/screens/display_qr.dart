import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myapp/screens/room_reservation_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQr extends StatefulWidget {
  DisplayQr({Key? key}) : super(key: key);

  @override
  _DisplayQrState createState() => _DisplayQrState();
}

class _DisplayQrState extends State<DisplayQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final String? data = barcode.rawValue;
            if (data != null) {
              // Show the extracted roomId
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RoomReservationScreen(roomNumber: data),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
