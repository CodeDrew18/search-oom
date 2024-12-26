import 'package:flutter/material.dart';
import 'package:myapp/data/facilities_updates.dart';
import 'package:myapp/helpers/db_helper.dart';
import 'package:myapp/screens/building_information_screen.dart';
import 'package:myapp/screens/facilities_update_screen.dart';
import 'package:myapp/screens/test_panorama.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double originalMapWidth = 341.0;
  final double originalMapHeight = 485.0;

  late Future<List<Map<String, dynamic>>> buildingsFuture;

  @override
  void initState() {
    super.initState();
    buildingsFuture = DbHelper.fetchBuildings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Navigate",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TestPanorama(),
                  ),
                );
              },
              icon: Icon(
                Icons.notifications_none,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search...",
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: [
                  InteractiveViewer(
                    minScale: 1.0,
                    maxScale: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/school_map/school_map.png",
                              fit: BoxFit.fitWidth,
                            ),
                            Positioned.fill(
                              child: FutureBuilder(
                                future: DbHelper.fetchBuildings(),
                                builder: (_, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  final buildings = snapshot.data!;

                                  return Stack(
                                    children: buildings.map(
                                      (building) {
                                        int x = building[DbHelper.buildingX];
                                        int y = building[DbHelper.buildingY];
                                        String buildingName =
                                            building[DbHelper.buildingName]
                                                as String;

                                        return Positioned(
                                          left: x *
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  originalMapWidth),
                                          bottom: y *
                                              (MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  originalMapHeight),
                                          child: GestureDetector(
                                            onTap: () {
                                              print("$buildingName clicked");
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      BuildingInformationScreen(
                                                    buildingName: buildingName,
                                                    buildingId: building[
                                                        DbHelper.buildingId],
                                                    buildingImage: building[
                                                        DbHelper.buildingImage],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 73 *
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      originalMapHeight),
                                              width: 16 *
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      originalMapWidth),
                                              color: Color(0xAA000000),
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  );
                                },
                              ),
                            ),
                            // Positioned.fill(
                            //   bottom: 108 *
                            //       (MediaQuery.of(context).size.height /
                            //           originalMapHeight),
                            //   left: 62 *
                            //       (MediaQuery.of(context).size.width /
                            //           originalMapWidth),
                            //   child: Transform.rotate(
                            //     angle: 9 * 3.1415927 / 180,
                            //     child: GestureDetector(
                            //       onTap: () {
                            //         print("building is clicked");
                            //         Navigator.of(context).push(
                            //           MaterialPageRoute(
                            //             builder: (_) => searchRoom(),
                            //           ),
                            //         );
                            //       },
                            //       child: Container(
                            //         height: 73 *
                            //             (MediaQuery.of(context).size.width /
                            //                 originalMapHeight),
                            //         width: 16 *
                            //             (MediaQuery.of(context).size.height /
                            //                 originalMapWidth),
                            //         color: Color(0xAA000000),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Facilities and Updates",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: facilitiesUpdates.length,
                    itemBuilder: (_, index) {
                      var facilityUpdate = facilitiesUpdates[index];

                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FacilitiesUpdateScreen(
                              facilityUpdate: facilityUpdate,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  facilityUpdate.facility_images[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                facilityUpdate.facility_name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
