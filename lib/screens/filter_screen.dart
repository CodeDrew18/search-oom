import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key, this.appliedFilters = const {}}) : super(key: key);

  final Map<String, dynamic> appliedFilters;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isAvailable = false;
  bool isOccupied = false;

  bool hasProjector = false;
  bool hasSmartTv = false;
  bool hasElectricFan = false;
  bool hasAircon = false;
  bool hasChair = false;
  bool hasTable = false;
  bool hasBoard = false;
  bool hasPc = false;
  bool hasAppleMacPro = false;

  bool isOpenArea = false;
  bool isLaboratory = false;
  bool isLecture = false;

  bool isGroundFloor = false;
  bool isFirstFloor = false;
  bool isSecondFloor = false;
  bool isThirdFloor = false;
  bool isFourthFloor = false;

  bool isSmallRoom = false;
  bool isMediumRoom = false;
  bool isLargeRoom = false;

  void resetFilters() {
    setState(() {
      isAvailable = false;
      isOccupied = false;
      hasProjector = false;
      hasSmartTv = false;
      hasElectricFan = false;
      hasAircon = false;
      hasChair = false;
      hasTable = false;
      hasBoard = false;
      hasPc = false;
      hasAppleMacPro = false;
      isOpenArea = false;
      isLaboratory = false;
      isLecture = false;
      isGroundFloor = false;
      isFirstFloor = false;
      isSecondFloor = false;
      isThirdFloor = false;
      isFourthFloor = false;
      isSmallRoom = false;
      isMediumRoom = false;
      isLargeRoom = false;
    });
  }

  void initState() {
    super.initState();
    isAvailable = widget.appliedFilters['isAvailable'] ?? false;
    isOccupied = widget.appliedFilters['isOccupied'] ?? false;
    hasProjector = widget.appliedFilters['hasProjector'] ?? false;
    hasSmartTv = widget.appliedFilters['hasSmartTv'] ?? false;
    hasElectricFan = widget.appliedFilters['hasElectricFan'] ?? false;
    hasAircon = widget.appliedFilters['hasAircon'] ?? false;
    hasChair = widget.appliedFilters['hasChair'] ?? false;
    hasTable = widget.appliedFilters['hasTable'] ?? false;
    hasBoard = widget.appliedFilters['hasBoard'] ?? false;
    hasPc = widget.appliedFilters['hasPc'] ?? false;
    hasAppleMacPro = widget.appliedFilters['hasAppleMacPro'] ?? false;
    isOpenArea = widget.appliedFilters['isOpenArea'] ?? false;
    isLaboratory = widget.appliedFilters['isLaboratory'] ?? false;
    isLecture = widget.appliedFilters['isLecture'] ?? false;
    isGroundFloor = widget.appliedFilters['isGroundFloor'] ?? false;
    isFirstFloor = widget.appliedFilters['isFirstFloor'] ?? false;
    isSecondFloor = widget.appliedFilters['isSecondFloor'] ?? false;
    isThirdFloor = widget.appliedFilters['isThirdFloor'] ?? false;
    isFourthFloor = widget.appliedFilters['isFourthFloor'] ?? false;
    isSmallRoom = widget.appliedFilters['isSmallRoom'] ?? false;
    isMediumRoom = widget.appliedFilters['isMediumRoom'] ?? false;
    isLargeRoom = widget.appliedFilters['isLargeRoom'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Availability", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isAvailable,
                      onChanged: (bool? value) {
                        setState(() {
                          isAvailable = value!;
                        });
                      },
                    ),
                    Text("Available"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isOccupied,
                      onChanged: (bool? value) {
                        setState(() {
                          isOccupied = value!;
                        });
                      },
                    ),
                    Text("Occupied"),
                  ],
                ),
              ],
            ),
            Text("Amenities", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasProjector,
                      onChanged: (bool? value) {
                        setState(() {
                          hasProjector = value!;
                        });
                      },
                    ),
                    Text("Projector"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasSmartTv,
                      onChanged: (bool? value) {
                        setState(() {
                          hasSmartTv = value!;
                        });
                      },
                    ),
                    Text("Smart TV"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasElectricFan,
                      onChanged: (bool? value) {
                        setState(() {
                          hasElectricFan = value!;
                        });
                      },
                    ),
                    Text("Electric Fan"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasAircon,
                      onChanged: (bool? value) {
                        setState(() {
                          hasAircon = value!;
                        });
                      },
                    ),
                    Text("Aircon"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasChair,
                      onChanged: (bool? value) {
                        setState(() {
                          hasChair = value!;
                        });
                      },
                    ),
                    Text("Chair"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasTable,
                      onChanged: (bool? value) {
                        setState(() {
                          hasTable = value!;
                        });
                      },
                    ),
                    Text("Table"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasBoard,
                      onChanged: (bool? value) {
                        setState(() {
                          hasBoard = value!;
                        });
                      },
                    ),
                    Text("Board"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasPc,
                      onChanged: (bool? value) {
                        setState(() {
                          hasPc = value!;
                        });
                      },
                    ),
                    Text("PCs"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: hasAppleMacPro,
                      onChanged: (bool? value) {
                        setState(() {
                          hasAppleMacPro = value!;
                        });
                      },
                    ),
                    Text("Apple Mac Pro"),
                  ],
                ),
              ],
            ),
            Text("Room Type", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isOpenArea,
                      onChanged: (bool? value) {
                        setState(() {
                          isOpenArea = value!;
                        });
                      },
                    ),
                    Text("Open Area"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isLaboratory,
                      onChanged: (bool? value) {
                        setState(() {
                          isLaboratory = value!;
                        });
                      },
                    ),
                    Text("Laboratory"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isLecture,
                      onChanged: (bool? value) {
                        setState(() {
                          isLecture = value!;
                        });
                      },
                    ),
                    Text("Lecture"),
                  ],
                ),
              ],
            ),
            Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isGroundFloor,
                      onChanged: (bool? value) {
                        setState(() {
                          isGroundFloor = value!;
                        });
                      },
                    ),
                    Text("Ground Floor"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isFirstFloor,
                      onChanged: (bool? value) {
                        setState(() {
                          isFirstFloor = value!;
                        });
                      },
                    ),
                    Text("1st Floor"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isSecondFloor,
                      onChanged: (bool? value) {
                        setState(() {
                          isSecondFloor = value!;
                        });
                      },
                    ),
                    Text("2nd Floor"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isThirdFloor,
                      onChanged: (bool? value) {
                        setState(() {
                          isThirdFloor = value!;
                        });
                      },
                    ),
                    Text("3rd Floor"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isFourthFloor,
                      onChanged: (bool? value) {
                        setState(() {
                          isFourthFloor = value!;
                        });
                      },
                    ),
                    Text("4th Floor"),
                  ],
                ),
              ],
            ),
              Text("Capacity", style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                children: [
                  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isSmallRoom,
                      onChanged: (bool? value) {
                        setState(() {
                          isSmallRoom = value!;
                        });
                      },
                    ),
                    Text("Small Room"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isMediumRoom,
                      onChanged: (bool? value) {
                        setState(() {
                          isMediumRoom = value!;
                        });
                      },
                    ),
                    Text("Medium Room"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isLargeRoom,
                      onChanged: (bool? value) {
                        setState(() {
                          isLargeRoom = value!;
                        });
                      },
                    ),
                    Text("Large Room"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () => resetFilters(),
                    child: Text("Reset", style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  side: BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                  ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 60,
                  width: 190,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop({
                        'isAvailable': isAvailable,
                        'isOccupied': isOccupied,
                        'hasProjector': hasProjector,
                        'hasSmartTv': hasSmartTv,
                        'hasElectricFan': hasElectricFan,
                        'hasAircon': hasAircon,
                        'hasChair': hasChair,
                        'hasTable': hasTable,
                        'hasBoard': hasBoard,
                        'hasPc': hasPc,
                        'hasAppleMacPro': hasAppleMacPro,
                        'isOpenArea': isOpenArea,
                        'isLaboratory': isLaboratory,
                        'isLecture': isLecture,
                        'isGroundFloor': isGroundFloor,
                        'isFirstFloor': isFirstFloor,
                        'isSecondFloor': isSecondFloor,
                        'isThirdFloor': isThirdFloor,
                        'isFourthFloor': isFourthFloor,
                        'isSmallRoom': isSmallRoom,
                        'isMediumRoom': isMediumRoom,
                        'isLargeRoom': isLargeRoom,
                      });
                    },
                    child: Text("Apply", style: TextStyle(color: Colors.white),)
                  , style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  backgroundColor: Color(0xFF042075),
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
