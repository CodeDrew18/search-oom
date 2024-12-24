import 'package:flutter/material.dart';
import 'package:myapp/data/facilities_updates.dart';
import 'package:myapp/screens/facilities_update_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search'oom"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search...",
                suffixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child:
                        Image.asset("assets/images/school_map/school_map.png"),
                  ),
                ],
              ),
            ),
            Text("Facilities and Updates"),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      children: [
                        Expanded(
                          child: Image.asset(
                            facilityUpdate.facility_images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            facilityUpdate.facility_name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
