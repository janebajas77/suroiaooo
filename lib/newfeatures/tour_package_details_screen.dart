import 'package:flutter/material.dart';

class TourPackageDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> package;

  TourPackageDetailsScreen({required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img12.jpg'), // Background image
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 217, 0),
              const Color.fromARGB(255, 255, 217, 1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 255, 208, 0)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 217, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(), // Pushes the box down
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Php ${package['totalPrice'] ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      Text(
                        'Tour Package with Accommodation',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildInfoRow('Total Price:', 'Php ${package['totalPrice'] ?? 'N/A'}', Colors.amber),
                      _buildInfoRow('Agency Name:', package['agencyName'] ?? 'N/A', Colors.amber),
                      _buildInfoRow('Tour Classification:', package['tourClassification'] ?? 'N/A', Colors.amber),
                      _buildInfoRow('Tour Type:', package['tourType'] ?? 'N/A', Colors.amber),
                      _buildInfoRow('Pax:', package['pax']?.toString() ?? 'N/A', Colors.amber),
                      _buildInfoRow('Price:', 'Php ${package['price'] ?? 'N/A'}', Colors.amber),
                      _buildInfoRow('Inclusions:', (package['inclusions'] as List<dynamic>?)?.join(', ') ?? 'N/A', Colors.amber),
                      _buildInfoRow('Activities:', (package['activities'] as List<dynamic>?)?.join(', ') ?? 'N/A', Colors.amber),
                      SizedBox(height: 20),
                      _buildInfoRow('Accommodation:', package['accommodation']?['name'] ?? 'N/A', Colors.amber),
                      _buildInfoRow('Room Type:', package['accommodation']?['roomType'] ?? 'N/A', Colors.amber),
                      _buildInfoRow('Max. Pax:', package['accommodation']?['maxPax']?.toString() ?? 'N/A', Colors.amber),
                      _buildInfoRow('Price per Night:', 'Php ${package['accommodation']?['pricePerNight'] ?? 'N/A'}', Colors.amber),
                      _buildInfoRow('Inclusions:', (package['accommodation']?['inclusions'] as List<dynamic>?)?.join(', ') ?? 'N/A', Colors.amber),
                      SizedBox(height: 20), // Add extra space if needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color labelColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: labelColor),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
