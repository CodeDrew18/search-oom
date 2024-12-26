class FacilitiesUpdate {
  late List facility_images;
  late String facility_name;
  late List facility_descriptions;
  String facility_icon;
  String? facility_icon2;

  FacilitiesUpdate({
    required this.facility_images,
    required this.facility_name,
    required this.facility_descriptions,
    required this.facility_icon,
    this.facility_icon2
  });
}
