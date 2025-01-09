import 'package:flutter/material.dart';
import 'package:logigreen/CONST/const_img.dart';

class ShipmentHistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading for the shipment history section
          Text(
            "Shipment History",
            style: TextStyle(
              fontFamily: 'BoldFont',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          // Scrollable row of shipment history cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                shipmentHistoryCard(
                  shipmentId: "#12341",
                  driverName: "Michael Scott",
                  driverImage: logo, // Replace with actual image path
                  deliveryDate: "10 Jan 2025, 2:00 PM",
                  quantity: "200 kg of Cement",
                  destination: "Warehouse C, Chicago",
                  vehicleType: "Truck",
                  vehicleNumber: "CHI-6782",
                  mapImage: logo, // Replace with actual image path
                  carbonEfficiency: "85%",
                  tag: "Delivered",
                  tagColor: Colors.green[700],
                  onTap: () => print("Shipment tapped: #12341"),
                ),
                shipmentHistoryCard(
                  shipmentId: "#12342",
                  driverName: "Pam Beesly",
                  driverImage: logo, // Replace with actual image path
                  deliveryDate: "08 Jan 2025, 11:30 AM",
                  quantity: "100 kg of Wood",
                  destination: "Warehouse D, San Francisco",
                  vehicleType: "Van",
                  vehicleNumber: "SFO-3291",
                  mapImage: logo, // Replace with actual image path
                  carbonEfficiency: "92%",
                  tag: "Delayed",
                  tagColor: Colors.red[700],
                  onTap: () => print("Shipment tapped: #12342"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget shipmentHistoryCard({
    required String shipmentId,
    required String driverName,
    required String driverImage,
    required String deliveryDate,
    required String quantity,
    required String destination,
    required String vehicleType,
    required String vehicleNumber,
    required String mapImage,
    required String carbonEfficiency,
    required String tag,
    required Color? tagColor,
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
              // Map Image with tag overlay
              Stack(
                children: [
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
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: tagColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      "Delivered: $deliveryDate",
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
              // Carbon Efficiency and Driver Info
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Carbon Efficiency :",
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