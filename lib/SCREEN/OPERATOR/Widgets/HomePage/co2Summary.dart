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
    'Today': 32,
    'Week': 146,
    'Month': 738,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Reduced width
      height: 300, // Reduced height
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.white, // Container background color (you can change it to homeBg if needed)
        borderRadius: BorderRadius.circular(15), // Slightly smaller radius
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
          // Dropdown Filter in Top-Right
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
                    style: TextStyle(fontSize: 11, color: Colors.green[900]), // Reduced font size
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
          SizedBox(height: 15), // Reduced spacing

          // Header Text
          Text(
            "See the CO2 Emission $selectedTimeFrame",
            style: TextStyle(
              fontSize: 12, // Reduced font size
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          // CO2 Emission Display Circle with Gradient Border
          Container(
            padding: EdgeInsets.all(5), // Padding for the gradient border effect
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue], // Gradient colors for the border
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(30), // Increased padding for bigger circle
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
                    size: 30, // Increased icon size
                    color: Colors.green,
                  ),
                  // Reduced spacing
                  Text(
                    'CO2',
                    style: TextStyle(
                      fontSize: 18, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  // Reduced spacing
                  Text(
                    '${emissionData[selectedTimeFrame]} Kg', // Display dynamic data
                    style: TextStyle(
                      fontSize: 26, // Increased font size
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
