class TourPackage {
  String packageName;
  double packagePrice;
  List<TourDetails> tours;
  Accommodation accommodation;

  TourPackage(
      {required this.packageName,
      required this.packagePrice,
      required this.tours,
      required this.accommodation});
}

class TourDetails {
  String agencyName;
  String tourClassification;
  String tourType;
  double price;
  int pax;
  List<String> activities;
  List<String> inclusions;

  TourDetails(
      {required this.agencyName,
      required this.tourClassification,
      required this.tourType,
      required this.price,
      required this.pax,
      required this.activities,
      required this.inclusions});
}

class Accommodation {
  String resortName;
  String roomType;
  double pricePerNight;
  int maxPax;
  List<String> inclusions;

  Accommodation(
      {required this.resortName,
      required this.roomType,
      required this.pricePerNight,
      required this.maxPax,
      required this.inclusions});
}
