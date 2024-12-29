import 'package:flutter/material.dart';
import 'package:myapp/helpers/db_helper.dart';
import 'package:myapp/screens/filter_screen.dart';
import 'package:myapp/screens/room_information_screen.dart';

class BuildingInformationScreen extends StatefulWidget {
  BuildingInformationScreen(
      {Key? key,
      required this.buildingName,
      required this.buildingId,
      required this.buildingImage})
      : super(key: key);

  final String buildingName;
  final int buildingId;
  final String buildingImage;

  @override
  _BuildingInformationScreenState createState() =>
      _BuildingInformationScreenState();
}

class _BuildingInformationScreenState extends State<BuildingInformationScreen> {
  String floorName(int floorNumber) {
    if (floorNumber == 0) {
      return "Ground Floor";
    } else if (floorNumber == 1) {
      return "1st Floor";
    } else if (floorNumber == 2) {
      return "2nd Floor";
    } else if (floorNumber == 3) {
      return "3rd Floor";
    } else if (floorNumber == 4) {
      return "4th Floor";
    }

    return "";
  }

  var searchCtrl = TextEditingController();

  Map<String, dynamic> appliedFilters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.buildingName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchCtrl,
                    onSubmitted: (String searchText) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final filters = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FilterScreen(
                          appliedFilters: appliedFilters,
                        ),
                      ),
                    );

                    if (filters != null) {
                      setState(() {
                        appliedFilters = filters;
                      });
                    }
                  },
                  icon: Container(
                    child: Icon(
                      Icons.filter_list_rounded,
                      color: Colors.black,
                    ),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                widget.buildingImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.fetchFloorsAndRooms(
                widget.buildingId,
                searchFloorNumber: searchCtrl.text,
                filters: appliedFilters,
              ),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(
                    child: Text("No data available."),
                  );
                }

                var data = snapshot.data!;

                var floors = {};
                for (var row in data) {
                  var floorId = row[DbHelper.floorId];
                  if (!floors.containsKey(floorId)) {
                    floors[floorId] = {
                      "floorNumber": row[DbHelper.floorNumber],
                      "rooms": [],
                    };
                  }
                  if (row[DbHelper.roomId] != null) {
                    floors[floorId]["rooms"].add({
                      "roomId": row[DbHelper.roomId],
                      "roomNumber": row[DbHelper.roomNumber],
                      "roomImage": row[DbHelper.roomImage],
                      "isUsable": row[DbHelper.isUsable],
                      "isAvailable": row[DbHelper.isAvailable],
                    });
                  }
                }

                return ListView.builder(
                  itemCount: floors.keys.length,
                  itemBuilder: (_, index) {
                    var floorId = floors.keys.elementAt(index);
                    var floor = floors[floorId];

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            color: Colors.blue.shade900,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Floor ${floor["floorNumber"]}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "view",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: floor["rooms"].length,
                            itemBuilder: (_, index) {
                              var room = floor["rooms"][index];

                              return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => RoomInformationScreen(
                                      roomId: room["roomId"],
                                      roomNumber: room["roomNumber"],
                                      roomImage: room["roomImage"],
                                      isUsable: room["isUsable"],
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Text(room["roomNumber"]),
                                        ),
                                        Container(
                                          height: 52,
                                          width: 45,
                                          color: room["isAvailable"] == 1
                                              ? Colors.green
                                              : Colors.red,
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
