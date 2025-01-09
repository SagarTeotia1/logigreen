import 'package:flutter/material.dart';
import 'package:logigreen/CONST/const_img.dart';

class ShipmentDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading for the shipment details section
          Text(
            "Upcoming Shipments",
            style: TextStyle(
              fontFamily: 'BoldFont',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          // Scrollable row of shipment detail cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                shipmentCard(
                  shipmentId: "#12345",
                  driverName: "John Doe",
                  driverImage: logo, // Replace with actual image path
                  estimatedArrival: "12 Jan 2025, 4:00 PM",
                  quantity: "500 kg of Steel",
                  destination: "Warehouse A, New York",
                  vehicleType: "Truck",
                  vehicleNumber: "NYT-8907",
                  mapImage: logo, // Replace with actual image path
                  carbonEfficiency: "85%",
                  onTap: () => print("Shipment tapped: #12345"),
                ),
                shipmentCard(
                  shipmentId: "#12346",
                  driverName: "Jane Smith",
                  driverImage: logo, // Replace with actual image path
                  estimatedArrival: "13 Jan 2025, 10:00 AM",
                  quantity: "300 kg of Aluminum",
                  destination: "Warehouse B, Los Angeles",
                  vehicleType: "Van",
                  vehicleNumber: "LAX-4578",
                  mapImage: logo, // Replace with actual image path
                  carbonEfficiency: "78%",
                  onTap: () => print("Shipment tapped: #12346"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget shipmentCard({
    required String shipmentId,
    required String driverName,
    required String driverImage,
    required String estimatedArrival,
    required String quantity,
    required String destination,
    required String vehicleType,
    required String vehicleNumber,
    required String mapImage,
    required String carbonEfficiency,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 260, // Compact width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Map Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  mapImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 90, // Fixed height for map image
                ),
              ),
              // Shipment Info
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shipment ID
                    Text(
                      shipmentId,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Arrival: $estimatedArrival",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Material: $quantity",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Destination",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      destination,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "$vehicleType ($vehicleNumber)",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              // Efficiency Metric and Driver Info
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Carbon Efficiency of this Trip",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          carbonEfficiency,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(driverImage),
                        ),
                        SizedBox(height: 4),
                        Text(
                          driverName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
