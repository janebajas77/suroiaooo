import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siargao Tour Packages'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tour Budget Range', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RangeSlider(
              values: RangeValues(1000, 15000),
              min: 500,
              max: 15000,
              onChanged: (RangeValues values) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Minimum'),
                Text('Maximum'),
              ],
            ),
            SizedBox(height: 20),
            Text('Tour Types:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Island Tour'),
              value: true,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('North Land Tour'),
              value: false,
              onChanged: (bool? value) {},
            ),
            // Add more CheckboxListTile for other tour types
            SizedBox(height: 20),
            Text('Tour Classification:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Private'),
              value: true,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Joiner'),
              value: false,
              onChanged: (bool? value) {},
            ),
            // Add more CheckboxListTile for other classifications
            SizedBox(height: 20),
            Text('Accommodation:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Hotel'),
              value: true,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: Text('Resort'),
              value: false,
              onChanged: (bool? value) {},
            ),
            // Add more CheckboxListTile for other accommodations
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/tour1.jpg', width: 100, height: 100),
                Image.asset('assets/tour2.jpg', width: 100, height: 100),
                Image.asset('assets/tour3.jpg', width: 100, height: 100),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('P 2999 Tour Only'),
            ),
          ],
        ),
      ),
    );
  }
}