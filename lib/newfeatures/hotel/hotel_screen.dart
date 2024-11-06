import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Hotels & Resorts'),
            Tab(text: 'Restaurants'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HotelResortTab(),
          RestaurantTab(),
        ],
      ),
    );
  }
}

class HotelResortTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Example item
        HotelResortItem(
          name: 'A Farm House',
          imageUrl: 'assets/a_farm_house.jpg',
          location: 'Bongabon',
        ),
        // Add more items...
      ],
    );
  }
}

class HotelResortItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String location;

  HotelResortItem(
      {required this.name, required this.imageUrl, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imageUrl),
          Text(name),
          Text(location),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: Icon(Icons.phone), onPressed: () {}),
              IconButton(icon: Icon(Icons.map), onPressed: () {}),
              IconButton(icon: Icon(Icons.facebook), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}

class RestaurantTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Example item
        RestaurantItem(
          name: 'Chong\'s Chicken',
          details: 'Monday to Sunday: 10:00 AM - 9:00 PM',
        ),
        // Add more items...
      ],
    );
  }
}

class RestaurantItem extends StatelessWidget {
  final String name;
  final String details;

  RestaurantItem({required this.name, required this.details});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(details),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.phone), onPressed: () {}),
          IconButton(icon: Icon(Icons.map), onPressed: () {}),
          IconButton(icon: Icon(Icons.facebook), onPressed: () {}),
        ],
      ),
    );
  }
}
