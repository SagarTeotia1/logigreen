import 'package:flutter/material.dart';

const Color homeBg = Color(0xFFD3F8D8);

class FuelConsumptionWidget extends StatefulWidget {
  @override
  _FuelConsumptionWidgetState createState() => _FuelConsumptionWidgetState();
}

class _FuelConsumptionWidgetState extends State<FuelConsumptionWidget> {
  String selectedTimeFrame = 'Today';

  final Map<String, int> fuelData = {
    'Today': 30, // Liters
    'Week': 140, // Liters
    'Month': 600, // Liters
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
            "Fuel Consumption for $selectedTimeFrame",
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
                colors: [Colors.green, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
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
                    Icons.local_gas_station,
                    size: 40,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Fuel Used',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${fuelData[selectedTimeFrame]} Liters',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
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
