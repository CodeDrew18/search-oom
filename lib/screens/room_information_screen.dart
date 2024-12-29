import 'package:flutter/material.dart';
import 'package:myapp/helpers/db_helper.dart';
import 'package:panorama_image/panorama_image.dart';

class RoomInformationScreen extends StatefulWidget {
  RoomInformationScreen(
      {Key? key,
      required this.roomId,
      required this.roomNumber,
      this.roomImage,
      required this.isUsable})
      : super(key: key);

  final int roomId;
  final String roomNumber;
  final String? roomImage;
  final int isUsable;

  @override
  _RoomInformationScreenState createState() => _RoomInformationScreenState();
}

class _RoomInformationScreenState extends State<RoomInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomNumber, style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: widget.roomImage == null
          ? Center(
              child: Text("No Room Information."),
            )
          : Column(
              children: [
                AspectRatio(
                  aspectRatio: 3 / 1.5,
                  child: PanoramaViewer(
                    image: AssetImage(widget.roomImage!),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Room Conditition", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(widget.isUsable == 1
                          ? "Good to Use"
                          : "Not Good to Use", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 370,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Amenities", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    FutureBuilder(
                      future: DbHelper.fetchAmenities(widget.roomId),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        var amenities = snapshot.data!;

                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Wrap(
                              spacing: 15,
                              runSpacing: 10,
                              children: amenities.map(
                                (amenity) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    color: Color(0xFFCFCFCF),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "${amenity[DbHelper.amenityQuantity]} ${amenity[DbHelper.amenitiesName]}",
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
