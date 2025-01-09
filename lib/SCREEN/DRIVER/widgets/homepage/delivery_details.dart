import 'package:flutter/material.dart';
Widget _buildDraggableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 218, 244, 219),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: CurrentDeliveryDetails(),
          ),
        );
      },
    );
  }


class CurrentDeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentDelivery = {
      "pickup": "Blue Warehouse, Sector 2",
      "destination": "Green Valley, Sector 5",
      "distance": "12 km",
      "estimatedTime": "25 mins",
      "packageDetails": "Fragile: Glassware",
      "ecoImpact": {
        "CO2Reduction": "15%",
        "fuelSaved": "2.5L",
        "idleTime": "10 mins",
        "ecoDrivingScore": "82%",
        "airQualityImpact": "Medium",
      },
    };

    final boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 8.0,
          spreadRadius: 1.0,
        ),
      ],
    );

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: boxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Delivery Details', style: titleStyle),
                    Icon(Icons.local_shipping, color: Colors.green),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pickup: ${currentDelivery["pickup"]}', style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 4),
                          Text('Destination: ${currentDelivery["destination"]}', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        Container(width: 2, height: 50, color: Colors.grey),
                        Icon(Icons.flag, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: boxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sustainability Metrics', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircularMetric('Idle Time', currentDelivery["ecoImpact"]["idleTime"], Colors.yellow),
                    _buildCircularMetric('Eco Score', currentDelivery["ecoImpact"]["ecoDrivingScore"], Colors.green),
                    _buildCircularMetric('Air Impact', currentDelivery["ecoImpact"]["airQualityImpact"], Colors.orange),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircularMetric('CO2', currentDelivery["ecoImpact"]["CO2Reduction"], Colors.red),
                    _buildCircularMetric('Fuel', currentDelivery["ecoImpact"]["fuelSaved"], Colors.blue),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularMetric(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}