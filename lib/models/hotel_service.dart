import 'package:cloud_firestore/cloud_firestore.dart';
import 'hotel.dart';

class HotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addHotel(Hotel hotel) async {
    await _firestore.collection('hotels').add(hotel.toMap())
      .then((value) => print("Hotel added successfully!"))
      .catchError((error) => print("Failed to add hotel: $error"));
  }
}
