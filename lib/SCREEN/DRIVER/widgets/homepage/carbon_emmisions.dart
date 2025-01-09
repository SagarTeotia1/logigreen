import 'package:flutter/material.dart';

// Assuming homeBg is a predefined color
const Color homeBg = Color(0xFFD3F8D8); // Example, you can change it according to your color

class CO2EmissionWidget extends StatefulWidget {
  @override
  _CO2EmissionWidgetState createState() => _CO2EmissionWidgetState();
}

class _CO2EmissionWidgetState extends State<CO2EmissionWidget> {
  String selectedTimeFrame = 'Today';

  // Define the carbon emission values
  final Map<String, int> emissionData = {
    'Today': 28,
    'Week': 126,
    'Month': 538,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the container responsive
      padding: EdgeInsets.all(20), // Adequate padding around the content
      decoration: BoxDecoration(
        color: Colors.white, // Container background color
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Dropdown Filter (Top-Right)
          Align(
            alignment: Alignment.topRight,
            child: DropdownButton<String>(
              value: selectedTimeFrame,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTimeFrame = newValue!;
                });
              },
              items: <String>['Today', 'Week', 'Month']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 12, color: Colors.green[900]),
                  ),
                );
              }).toList(),
              underline: Container(
                height: 2,
                color: Colors.green[400],
              ),
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.green,
            ),
          ),
          SizedBox(height: 10), // Adjusted spacing

          // Header Text
          Text(
            "Carbon Dioxide Emission for $selectedTimeFrame",
            style: TextStyle(
              fontSize: 14, // Slightly increased font size
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20), // Spacing between header and circular display

          // CO2 Emission Display Circle with Gradient Border
          Container(
            padding: EdgeInsets.all(6), // Padding for the gradient border effect
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue], // Gradient colors for the border
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(25), // Increased padding for bigger circle
              decoration: BoxDecoration(
                color: Colors.green[50],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.eco,
                    size: 40, // Increased icon size
                    color: Colors.green,
                  ),
                  SizedBox(height: 5), // Reduced spacing
                  Text(
                    'CO2',
                    style: TextStyle(
                      fontSize: 20, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 5), // Reduced spacing
                  Text(
                    '${emissionData[selectedTimeFrame]} Kg', // Display dynamic data
                    style: TextStyle(
                      fontSize: 28, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
