import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: ListView(
        children: [
          _buildMenuItem(context, 'Accommodations', AccommodationsScreen()),
          _buildMenuItem(context, 'Restaurants and Bars', RestaurantsAndBarsScreen()),
          _buildMenuItem(context, 'Transportation', TransportationScreen()),
          _buildMenuItem(context, 'Emergency Hotlines', EmergencyHotlinesScreen()),
          _buildMenuItem(context, 'Siargaonon Conversational', ConversationalScreen()),
          _buildMenuItem(context, 'About Siargao Island', AboutSiargao()),
          _buildMenuItem(context, 'Siargao Fiestas', FiestaSiargao()),
        ],
      ),
    );
  }

    Widget _buildMenuItem(BuildContext context, String title, Widget screen) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add some margin for spacing
      decoration: BoxDecoration(
        color:Colors.amber, // Background color for the container
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius for the shadow
            blurRadius: 5, // Blur radius for the shadow
            offset: Offset(0, 3), // Position of the shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}


class AccommodationsScreen extends StatelessWidget {
  // List of accommodation image paths, URLs, and names
  final List<Map<String, String>> accommodations = [
    {'image': 'assets/images/apsaras.jpg', 'url': 'https://link1.com', 'name': 'Apsaras Siargao'},
    {'image': 'assets/images/bravo-beach-resort.jpg', 'url': 'https://www.bravosiargao.com/', 'name': 'Bravo Beach Resort'},
    {'image': 'assets/images/buddha.jpg', 'url': 'https://www.facebook.com/lunatresvilla', 'name': 'Buddha Resort'},
    {'image': 'assets/images/goodlife.jpg', 'url': 'https://hostelgoodlifesiargaolunagenerallunasurigaodelnorte.ph-hotels.net/en/rooms.html', 'name': 'Good Life Siargao'},
    {'image': 'assets/images/harana.jpg', 'url': 'https://www.haranasurf.com/en/', 'name': 'Harana Surf Resort'},
     {'image': 'assets/images/hiraya.jpg', 'url': 'https://www.facebook.com/HirayaSurfHostel', 'name': 'Hiraya Surf Resort'},
    {'image': 'assets/images/islacabana.jpg', 'url': 'https://www.islacabanaresort.com/', 'name': 'Isla Cabana'},
    {'image': 'assets/images/kalinaw.jpg', 'url': 'https://www.kalinawresort.com/', 'name': 'Kalinaw Resort'},
    {'image': 'assets/images/kermit.jpg', 'url': 'https://www.kermitsiargao.com/', 'name': 'Kermit Surf Resort'},
    {'image': 'assets/images/lamari-siargao.jpg', 'url': 'https://www.lamarisiargao.com/', 'name': 'Lamari Siargao'},
    {'image': 'assets/images/laspalmas.jpg', 'url': 'https://laspalmassiargao.com/', 'name': 'Las Palmas Siargao'},
    {'image': 'assets/images/nay-palad-hideaway.jpg', 'url': 'https://www.naypaladhideaway.com/', 'name': 'Nay Palad Hideaway'},
    {'image': 'assets/images/ocen101.jpg', 'url': 'https://www.ocean101cloud9.com/', 'name': 'Ocean 101 Resort'},
    {'image': 'assets/images/ohana.jpg', 'url': 'https://www.instagram.com/aniradasiargao/', 'name': 'Ohana Guest House'},
    {'image': 'assets/images/reef.jpeg', 'url': 'https://reefbeachresortsiargao.com/', 'name': 'Reef Beach Siargao'},
    {'image': 'assets/images/retreat.jpg', 'url': 'https://www.facebook.com/retreat.siargao.5', 'name': 'Retreat Siargao'},
    {'image': 'assets/images/siago-beach-resort.jpg', 'url': 'https://www.siagobeachresort.com/', 'name': 'Siago Beach Resort'},
    {'image': 'assets/images/siargaobleu.jpg', 'url': 'https://siargaobleu.com/', 'name': 'Siargao Bleu Resort'},
    {'image': 'assets/images/tresislas.jpg', 'url': 'https://www.facebook.com/tresislasiao', 'name': 'Tres Islas Hostel'},
    {'image': 'assets/images/villacali.jpg', 'url': 'https://www.facebook.com/villacalisiargao', 'name': 'Villa Cali Siargao'},
  ];

  // Function to open a URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accommodations'),
        backgroundColor:const Color.fromARGB(255, 255, 196, 0),
      ),
      body: ListView.builder(
        itemCount: accommodations.length,
        itemBuilder: (context, index) {
          final accommodation = accommodations[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _launchURL(accommodation['url']!);
              },
              child: Stack(
                alignment: Alignment.center, // Center the name both vertically and horizontally
                children: [
                  Container(
                    width: double.infinity,  // Full width
                    height: 180,             // Height of the rectangle
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Curve edges
                      image: DecorationImage(
                        image: AssetImage(accommodation['image']!),
                        fit: BoxFit.cover, // Ensure the image covers the container
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 208, 0).withOpacity(0.5), // Semi-transparent background
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      accommodation['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RestaurantsAndBarsScreen extends StatelessWidget {
  // List of restaurant image paths and URLs
  final List<Map<String, String>> restaurants = [
    {'image': 'assets/images/bliss.jpg', 'url': 'https://www.blisssiargao.com/activities/2024/01/14/nightlife-in-siargao/', 'name': 'Bliss Restaurant Siargao'},
    {'image': 'assets/images/bravo.jpg', 'url': 'https://www.bravosiargao.com/', 'name': 'Bravo Restaurant'},
    {'image': 'assets/images/cafeloka.jpg', 'url': 'https://www.instagram.com/lokasiargao/', 'name': 'Cafe Loka Siargao'},
    {'image': 'assets/images/cev.jpg', 'url': 'https://www.facebook.com/cevsiargao', 'name': 'Ceviche & Kalinaw Shack'},
    {'image': 'assets/images/harana.jpg', 'url': 'https://www.haranasurf.com/en/restaurant', 'name': 'Harana Surf and Turf'},
    {'image': 'assets/images/isla-cusina.jpeg', 'url': 'https://www.islacabanaresort.com/isla-cusina-restaurant.html', 'name': 'Isla Cusina'},
    {'image': 'assets/images/kalinaw1.jpg', 'url': 'https://www.kalinawresort.com/', 'name': 'Kalinaw Resort Siargao'},
    {'image': 'assets/images/kermitt.jpg', 'url': 'https://www.kermitsiargao.com/', 'name': 'Kermit Siargao'},
    {'image': 'assets/images/la-carinderia.jpg', 'url': 'https://www.instagram.com/lacarinderia_siargao/?hl=en', 'name': 'La Carinderia'},
    {'image': 'assets/images/lamari-siargao.jpg', 'url': 'https://www.lamarisiargao.com/', 'name': 'Lamari Siargao'},
    {'image': 'assets/images/madmonkey.jpg', 'url': 'https://madmonkeyhostels.com/siargao/', 'name': 'Mad Monkey Siargao'},
    {'image': 'assets/images/shakaa.jpg', 'url': 'https://www.instagram.com/shaka_cafes/', 'name': 'Shaka Cafe Siargao'},
    {'image': 'assets/images/viento.jpg', 'url': 'https://web.facebook.com/vientodelmar/?_rdc=1&_rdr', 'name': 'Viento Del Mar'},
    {'image': 'assets/images/violegre.jpeg', 'url': 'https://web.facebook.com/violegregastropub/?_rdc=1&_rdr', 'name': 'Violegre Gastropub'},
    {'image': 'assets/images/whitebanana.jpg', 'url': 'https://www.instagram.com/whitebanana.ph/', 'name': 'White Banana Siargao'},
    {'image': 'assets/images/gusla.jpg', 'url': 'https://web.facebook.com/gusla.siargao/?paipv=0&eav=AfYZg7exdklD7HRlMLK1-7UrWnBZtgRaBWtAyXFX64UYuja9VHnsXY7HS_4UzLOan0E&_rdc=1&_rdr', 'name': 'Gusla Grill and Restaurant'},
    {'image': 'assets/images/kermitt.jpg', 'url': 'https://www.instagram.com/kermitsiargao/', 'name': 'Villa Cali Siargao'},
    {'image': 'assets/images/bar150.jpg' , 'name': 'Bar 150'},
    {'image': 'assets/images/barrel-rest-1.webp', 'name': 'Barrel Bar Siargao'},
    {'image': 'assets/images/bliss.jpg', 'name': 'EPBliss Restaurant'},
    {'image': 'assets/images/clou9.jpg', 'name': 'Cloud 9 Bar'},
    {'image': 'assets/images/ellobo.jpg', 'name': 'El Lobo Siargao'},
    {'image': 'assets/images/fayeyeh.jpg', 'name': 'Fayeyeh Bar Siargao'},
    {'image': 'assets/images/whitebanannana.jpg', 'name': 'White Banana Bar'},
    {'image': 'assets/images/mamacoco.jpg', 'name': 'Mama Coco'},
    {'image': 'assets/images/cantina-luna-bar-1.webp', 'name': 'Cantina Luna Bar'},
    {'image': 'assets/images/epbliss.webp', 'name': 'EPBliss Siargao'}, 
  ];

  // Function to open a URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants and Bars'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _launchURL(restaurant['url']!);
              },
              child: Stack(
                alignment: Alignment.center, // Center the name both vertically and horizontally
                children: [
                  Container(
                    width: double.infinity,  // Full width
                    height: 180,             // Height of the rectangle
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Curve edges
                      image: DecorationImage(
                        image: AssetImage(restaurant['image']!),
                        fit: BoxFit.cover, // Ensure the image covers the container
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 208, 0).withOpacity(0.5), // Semi-transparent background
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      restaurant['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TransportationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportation'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/transportation_1.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/transportation_2.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/transportation_3.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/transportation_4.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class EmergencyHotlinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Hotlines'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/emergency_hotline_1.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/emergency_hotline_2.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class ConversationalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siargaonon Conversational'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/conversational_guide_1.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/conversational_guide_2.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/conversational_guide_3.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutSiargao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Siargao Island'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/10.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/11.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/12.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class FiestaSiargao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siargao Fiestas'),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/13.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/14.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/15.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/16.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/17.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/18.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/19.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/20.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/21.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/22.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/23.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/24.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/25.png'),
              SizedBox(height: 20),
              Image.asset('assets/images/26.png'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

