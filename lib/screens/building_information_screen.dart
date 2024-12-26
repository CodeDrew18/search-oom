import 'package:flutter/material.dart';
import 'package:myapp/helpers/db_helper.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buildingName),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.filter_list),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(
              widget.buildingImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.fetchFloors(widget.buildingId),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var floors = snapshot.data;

                return ListView.builder(
                  itemCount: floors == null ? 0 : floors.length,
                  itemBuilder: (_, index) {
                    var floor = floors![index];

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(floor[DbHelper.floorNumber].toString()),
                            TextButton(
                              onPressed: null,
                              child: Text("view"),
                            ),
                          ],
                        ),
                        FutureBuilder(
                          future: DbHelper.fetchRooms(floor[DbHelper.floorId]),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (!snapshot.hasData || snapshot.data == null) {
                              return Center(
                                child: Text("No rooms available."),
                              );
                            }

                            var rooms = snapshot.data;

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: rooms == null ? 0 : rooms.length,
                              itemBuilder: (_, index) {
                                var room = rooms![index];

                                return GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => RoomInformationScreen(
                                        roomId: room[DbHelper.roomId],
                                        roomNumber: room[DbHelper.roomNumber],
                                        roomImage: room[DbHelper.roomImage],
                                        isUsable: room[DbHelper.isUsable],
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(room[DbHelper.roomNumber]),
                                      Container(
                                        color: room[DbHelper.isAvailable] == 1
                                            ? Colors.green
                                            : Colors.red,
                                        child: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
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
