import 'package:flutter/material.dart';

// Assuming homeBg is a predefined color
const Color homeBg = Color(0xFFD3F8D8);

class EcoDrivingBehaviorWidget extends StatefulWidget {
  @override
  _EcoDrivingBehaviorWidgetState createState() =>
      _EcoDrivingBehaviorWidgetState();
}

class _EcoDrivingBehaviorWidgetState extends State<EcoDrivingBehaviorWidget> {
  String selectedTimeFrame = 'Today';

  // Define the eco-driving behavior data
  final Map<String, double> behaviorData = {
    'Today': 85.5,
    'Week': 90.2,
    'Month': 92.3,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
          SizedBox(height: 10),

          // Header Text
          Text(
            "Eco-Driving Behavior for $selectedTimeFrame",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Eco-Driving Behavior Display Circle with Gradient Border
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(25),
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
                    Icons.directions_car,
                    size: 40,
                    color: Colors.green,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Eco-Drive',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${behaviorData[selectedTimeFrame]}%',
                    style: TextStyle(
                      fontSize: 28,
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
