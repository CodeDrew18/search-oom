import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class WheelPickerExample extends StatefulWidget {
  WheelPickerExample({Key? key}) : super(key: key);

  @override
  _WheelPickerExampleState createState() => _WheelPickerExampleState();
}

class _WheelPickerExampleState extends State<WheelPickerExample> {
  final now = TimeOfDay.now();

  late final WheelPickerController hoursWheel;
  late final WheelPickerController minutesWheel;
  late final WheelPickerController amPmWheel;

  int selectedHour = 1;
  int selectedMinute = 0;
  int selectedAmPm = 0;

  String timeDifferenceText = "Select a time";

  @override
  void initState() {
    super.initState();

    hoursWheel = WheelPickerController(
      itemCount: 12,
      initialIndex: (now.hour % 12) == 0 ? 11 : (now.hour % 12) - 1,
    );

    minutesWheel = WheelPickerController(
      itemCount: 60,
      initialIndex: now.minute, // Corrected initialization of minutes
    );

    amPmWheel = WheelPickerController(
      itemCount: 2,
      initialIndex: now.hour >= 12 ? 1 : 0,
    );

    selectedHour = (now.hour % 12) == 0 ? 12 : (now.hour % 12);
    selectedMinute = now.minute;
    selectedAmPm = now.hour >= 12 ? 1 : 0;

    calculate();
  }

  @override
  void dispose() {
    hoursWheel.dispose();
    minutesWheel.dispose();
    amPmWheel.dispose();
    super.dispose();
  }

  void calculate() {
    // Get the current time in total minutes since midnight
    final now = TimeOfDay.now();
    final currentMinutes = (now.hour * 60) + now.minute;

    // Convert the selected time into total minutes since midnight
    int hourIn24 = selectedAmPm == 1
        ? (selectedHour == 12 ? 12 : selectedHour + 12) // PM logic
        : (selectedHour == 12 ? 0 : selectedHour); // AM logic
    final selectedMinutes = (hourIn24 * 60) + selectedMinute;

    // Calculate the difference in minutes
    int difference = selectedMinutes - currentMinutes;

    // If the difference is negative, it means the selected time is for the next day
    if (difference < 0) {
      difference += 24 * 60; // Add 24 hours worth of minutes
    }

    // Convert the difference back into hours and minutes
    final hours = difference ~/ 60; // Integer division for hours
    final minutes = difference % 60; // Remainder for minutes

    // Update the display text
    setState(() {
      if (difference == 0) {
        timeDifferenceText = "The time is now!";
      } else {
        timeDifferenceText = "The time will end in ${hours}h ${minutes}m";
      }
    });

    print("Current Time (in minutes): $currentMinutes");
    print("Selected Time (in minutes): $selectedMinutes");
    print("Time Difference: $difference minutes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Time"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("You can now set the desired time for classroom"),
          Text(timeDifferenceText),
          Row(
            children: [
              SizedBox(
                height: 150,
                width: 100,
                child: WheelPicker(
                  controller: hoursWheel,
                  selectedIndexColor: Colors.red,
                  onIndexChanged: (index, type) {
                    setState(() {
                      selectedHour = index + 1;
                      print("Hour Picker changed to: ${selectedHour}");
                      calculate();
                    });
                  },
                  builder: (context, index) {
                    return Text(
                        index + 1 > 9 ? "${index + 1}" : "0${index + 1}");
                  },
                ),
              ),
              SizedBox(
                height: 150,
                width: 100,
                child: WheelPicker(
                  controller: minutesWheel,
                  selectedIndexColor: Colors.red,
                  onIndexChanged: (index, type) {
                    setState(() {
                      selectedMinute = index;
                      print("Minute Picker changed to: $selectedMinute");
                      calculate();
                    });
                  },
                  builder: (context, index) {
                    return Text(index + 1 > 9 ? "${index}" : "0${index}");
                  },
                ),
              ),
              SizedBox(
                height: 150,
                width: 100,
                child: WheelPicker(
                  controller: amPmWheel,
                  selectedIndexColor: Colors.red,
                  looping: false,
                  onIndexChanged: (index, type) {
                    setState(() {
                      selectedAmPm = index;
                      print(
                          "AM/PM Picker changed to: ${selectedAmPm == 0 ? "AM" : "PM"}");
                      calculate();
                    });
                  },
                  builder: (context, index) {
                    return Text(index == 0 ? "AM" : "PM");
                  },
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("Set Timer"),
          ),
        ],
      ),
    );
  }
}
