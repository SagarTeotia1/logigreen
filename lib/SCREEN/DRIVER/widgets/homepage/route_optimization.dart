import 'package:flutter/material.dart';

const Color homeBg = Color(0xFFD3F8D8);

class RouteOptimizationWidget extends StatefulWidget {
  @override
  _RouteOptimizationWidgetState createState() =>
      _RouteOptimizationWidgetState();
}

class _RouteOptimizationWidgetState extends State<RouteOptimizationWidget> {
  String selectedTimeFrame = 'Today';

  final Map<String, int> routeData = {
    'Today': 150, // km
    'Week': 700, // km
    'Month': 3000, // km
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
          Text(
            "Distance Traveled for $selectedTimeFrame",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
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
                color: Colors.blue[50],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
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
                    color: Colors.blue,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Distance',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${routeData[selectedTimeFrame]} km',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
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
