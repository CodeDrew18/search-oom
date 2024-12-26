import 'package:flutter/material.dart';
import 'package:myapp/models/facilities_update.dart';

class FacilitiesUpdateScreen extends StatefulWidget {
  FacilitiesUpdateScreen({Key? key, required this.facilityUpdate})
      : super(key: key);

  final FacilitiesUpdate facilityUpdate;

  @override
  _FacilitiesUpdateScreenState createState() => _FacilitiesUpdateScreenState();
}

class _FacilitiesUpdateScreenState extends State<FacilitiesUpdateScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Facilities Update",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.facilityUpdate.facility_images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return Image.asset(
                      fit: BoxFit.cover,
                      widget.facilityUpdate.facility_images[index],
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF626259),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '${currentIndex + 1} / ${widget.facilityUpdate.facility_images.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.facilityUpdate.facility_icon),
                SizedBox(width: 10),
                Center(
                    child: Text(
                  widget.facilityUpdate.facility_name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
                SizedBox(width: 10),
                widget.facilityUpdate.facility_icon2 != null
                    ? Image.asset(
                        widget.facilityUpdate.facility_icon2!,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.facilityUpdate.facility_descriptions.length,
              itemBuilder: (_, index) {
                bool isLastDescription = index ==
                    widget.facilityUpdate.facility_descriptions.length - 1;

                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: isLastDescription
                        ? null
                        : Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xFF000000),
                            ),
                          ),
                  ),
                  child: Text(
                    widget.facilityUpdate.facility_descriptions[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(letterSpacing: 1.5),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
