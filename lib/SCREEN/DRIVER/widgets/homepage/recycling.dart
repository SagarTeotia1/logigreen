import 'package:flutter/material.dart';

// Assuming homeBg is a predefined color
const Color homeBg = Color(0xFFD3F8D8);

class RecyclingIncentivesWidget extends StatefulWidget {
  @override
  _RecyclingIncentivesWidgetState createState() =>
      _RecyclingIncentivesWidgetState();
}

class _RecyclingIncentivesWidgetState
    extends State<RecyclingIncentivesWidget> {
  String selectedTimeFrame = 'Today';

  // Define the recycling incentives data
  final Map<String, double> recyclingData = {
    'Today': 5.0,
    'Week': 30.0,
    'Month': 120.0,
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
                    style: TextStyle(fontSize: 12, color: Colors.blue[900]),
                  ),
                );
              }).toList(),
              underline: Container(
                height: 2,
                color: Colors.blue[400],
              ),
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.blue,
            ),
          ),
          SizedBox(height: 10),

          // Header Text
          Text(
            "Recycling Incentives for $selectedTimeFrame",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Recycling Incentives Display Circle with Gradient Border
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
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
                    Icons.recycling,
                    size: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Recycled',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${recyclingData[selectedTimeFrame]} kg',
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
