import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:travel_hour/newfeatures/Siargaonon_Screen.dart';
// import 'package:travel_hour/newfeatures/accomodation_screen.dart';
// import 'package:travel_hour/newfeatures/emergency_hotline_screen.dart';
import 'package:travel_hour/newfeatures/tour_package_screen.dart';
import 'package:travel_hour/pages/explore.dart';
import 'package:travel_hour/pages/profile.dart';
import 'package:travel_hour/pages/states.dart';
import 'package:travel_hour/newfeatures/more_screen.dart'; // Add this import

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color.fromARGB(255, 255, 196, 0),
        type: BottomNavigationBarType
            .fixed, // Use fixed when you have more than 3 items.
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Feather.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Feather.grid), label: 'Municipalities'),
          BottomNavigationBarItem(icon: Image.asset('assets/images/tag.png'), label: 'Tours'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
          BottomNavigationBarItem(icon: Icon(Feather.user), label: 'Profile'),
          // BottomNavigationBarItem(
          //     icon: Icon(Feather.message_circle), label: 'Conversational'),
          // BottomNavigationBarItem(
          //     icon: Icon(Feather.home), label: 'Accomodations'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.emergency), label: 'Emergency'),
          // // You can add more items here.
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Explore(),
          StatesPage(),
          TourPackagesScreen(),
          MoreScreen(),
          ProfilePage(),
          // SiargaononScreen(), // Assuming this exists
          // AccommodationsScreen(),
          // EmergencyHotlinesScreen(),

          // Add more pages as needed
        ],
      ),
    );
  }
}
