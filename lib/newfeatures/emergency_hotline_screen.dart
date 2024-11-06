import 'package:flutter/material.dart';

class EmergencyHotlinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Hotlines'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          _buildHotlineCard('Dapa',
              'Dapa Fire Station: 09985504300\nMDRRMO Rescue Dapa: 09175396902\nDapa District Hospital: 09486109822'),
          _buildHotlineCard('Burgos',
              'Municipal Police Station: 09985837332\nMDRRMO: 09094145209'),
          _buildHotlineCard('General Luna',
              'General Luna Fire Station: 09985804303\nMDRRMO Rescue General Luna: 09380578399'),
          // Add more cards...
        ],
      ),
    );
  }

  Widget _buildHotlineCard(String title, String numbers) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(numbers),
          ],
        ),
      ),
    );
  }
}
