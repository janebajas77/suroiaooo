import 'package:flutter/material.dart';

class AccommodationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accommodations', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _categoryButton('Hotel'),
                _categoryButton('Hostel'),
                _categoryButton('Resort'),
              ],
            ),
          ),
          // Use Expanded to make ListView occupy available space
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                _hotelCard('Isla Cabana Siargao'),
                _hotelCard('Kermit Siargao'),
                _hotelCard('Siago Beach Resort'),
                _hotelCard('Siargao Bleu Resort & Spa'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        selectedItemColor: const Color.fromARGB(255, 255, 209, 3),
        unselectedItemColor: const Color.fromARGB(255, 255, 166, 0),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _categoryButton(String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      onPressed: () {
        // Handle category switching
      },
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _hotelCard(String name) {
    print('Building card for $name');  // Debugging print to check if cards are being built
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 16),
      // Specify a fixed height for the card
      child: SizedBox(
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(
                  'https://media.digitalnomads.world/wp-content/uploads/2021/01/20120637/siargao-digital-nomads.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
