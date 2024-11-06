import 'package:flutter/material.dart';
import 'package:travel_hour/newfeatures/json_data.dart'; // Ensure this contains your tourPackages data.
import 'package:travel_hour/newfeatures/tour_package_details_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class TourPackagesScreen extends StatefulWidget {
  @override
  _TourPackagesScreenState createState() => _TourPackagesScreenState();
}

class _TourPackagesScreenState extends State<TourPackagesScreen> {
  RangeValues _currentRangeValues = const RangeValues(500, 15000);
  List<String> selectedTourTypes = [];
  List<String> selectedClassifications = [];
  List<String> selectedAccommodations = [];

  List<Map<String, dynamic>> get filteredTourPackages {
    return tourPackages.where((package) {
      final matchesPrice = package['totalPrice'] >= _currentRangeValues.start &&
                           package['totalPrice'] <= _currentRangeValues.end;
      final matchesTourType = selectedTourTypes.isEmpty || selectedTourTypes.contains(package['tourType']);
      final matchesClassification = selectedClassifications.isEmpty || selectedClassifications.contains(package['tourClassification']);
      final matchesAccommodation = selectedAccommodations.isEmpty || selectedAccommodations.contains(package['accommodation']);

      return matchesPrice && matchesTourType && matchesClassification && matchesAccommodation;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/siargao_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Text(
                        "Siargao Tour Packages",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildFilterSection(),
                  SizedBox(height: 20),
                  _buildTourPackagesList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HexColor("ffcc00"),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius for the shadow
            blurRadius: 5, // Blur radius for the shadow
            offset: Offset(0, 3), // Position of the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tour Budget Range",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Minimum"),
              Text("Maximum"),
            ],
          ),
          RangeSlider(
            values: _currentRangeValues,
            min: 500,
            max: 15000,
            divisions: 30,
            labels: RangeLabels(
              '₱${_currentRangeValues.start.round()}',
              '₱${_currentRangeValues.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          SizedBox(height: 20),
          Text("Filter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildFilterChips("Tour Types", [
            "Island Tour",
            "North Land Tour",
            "South Land Tour",
            "Sohoton Tour",
          ], selectedTourTypes),
          SizedBox(height: 10),
          _buildFilterChips("Tour Classification", ["Private", "Joiner"], selectedClassifications),
          SizedBox(height: 10),
          _buildFilterChips("Accommodation", ["Hotel", "Resort", "Hostel"], selectedAccommodations),
        ],
      ),
    );
  }

  Widget _buildFilterChips(String title, List<String> options, List<String> selectedOptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Wrap(
          spacing: 8,
          children: options.map((option) {
            return FilterChip(
              label: Text(option),
              selected: selectedOptions.contains(option),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedOptions.add(option);
                  } else {
                    selectedOptions.remove(option);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTourPackagesList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: filteredTourPackages.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> package = filteredTourPackages[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TourPackageDetailsScreen(package: package),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    tourPackageImages[package['id']] ?? 'https://example.com/default.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: const Color.fromARGB(255, 242, 183, 94),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('₱${package['totalPrice']}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${package['tourType']}',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
