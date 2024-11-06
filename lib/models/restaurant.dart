

class Restaurant {
  String? name;
  String? address;
  double? lat;
  double? lng;
  var rating;
  var price;
  String? photoReference;
  String? placeId;

  Restaurant({this.name, this.address, this.lat, this.lng, this.rating,
  this.price, this.photoReference, this.placeId});

  factory Restaurant.fromJson(Map<String, dynamic> json){
    return Restaurant(
      name: json['name'] ?? '',
      address: json['vicinity'] ?? '',
      lat: json['geometry']['location']['lat'] ?? 0.0,
      lng: json['geometry']['location']['lng'] ?? 0.0,
      rating: json['rating'] ?? 4,
      price: json['price_level'] ?? 0,
      photoReference: json['photos'] == null || json['photos'][0]['photo_reference'] == null 
        ? null : json['photos'][0]['photo_reference'],
      placeId: json['place_id']
    );
  }

  void main() {
  Restaurant restaurant = Restaurant(
    name: 'Gusla Grill',
    address: '123 Siargao St.',
    lat: 9.8485,      // Sample latitude
    lng: 126.0459,    // Sample longitude
    rating: 4.5,      // Rating between 1 to 5
    price: 3,         // Price level, 1 to 5
    photoReference: 'abc123',
    placeId: 'place123'
  );

  print(restaurant.name);  // Output: Gusla Grill
}


  
}
