import 'package:flutter/material.dart';

class RoomReservationScreen extends StatefulWidget {
  RoomReservationScreen({Key? key, required this.roomNumber}) : super(key: key);

  final String roomNumber;

  @override
  _RoomReservationScreenState createState() => _RoomReservationScreenState();
}

class _RoomReservationScreenState extends State<RoomReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room Reservation"),
      ),
      body: Center(
        child: Text(widget.roomNumber),
      ),
    );
  }
}
