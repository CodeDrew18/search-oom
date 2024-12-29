import 'package:flutter/material.dart';
import 'package:myapp/helpers/db_helper.dart';
import 'package:myapp/screens/building_information_screen.dart';

class BuildingSearchScreen extends StatefulWidget {
  BuildingSearchScreen({Key? key, required this.searchKey}) : super(key: key);

  final String searchKey;

  @override
  _BuildingSearchScreenState createState() => _BuildingSearchScreenState();
}

class _BuildingSearchScreenState extends State<BuildingSearchScreen> {
  var searchKey = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchKey.text = widget.searchKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Building"),
      ),
      body: Column(
        children: [
          TextField(
            controller: searchKey,
            onSubmitted: (String searchKey) {
              setState(() {});
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search...",
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.searchBuilding(searchKey.text),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(
                    child: Text("No building found."),
                  );
                }

                var buildings = snapshot.data;

                return ListView.builder(
                  itemCount: buildings == null ? 0 : buildings.length,
                  itemBuilder: (_, index) {
                    final building = buildings![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BuildingInformationScreen(
                              buildingName: building[DbHelper.buildingName],
                              buildingId: building[DbHelper.buildingId],
                              buildingImage: building[DbHelper.buildingImage],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: building[DbHelper.buildingImage] == null
                                ? Center(
                                    child: Text("No image available."),
                                  )
                                : Image.asset(
                                    building[DbHelper.buildingImage],
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Text(building[DbHelper.buildingName]),
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
