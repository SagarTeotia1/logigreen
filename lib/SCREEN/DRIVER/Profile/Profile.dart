import 'package:flutter/material.dart';
import 'package:logigreen/CONST/const_colo.dart';
import 'package:logigreen/const/const_img.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  final String driverName = "Jane Smith";
  final String driverEmail = "janesmith@logigreen.com";
  int deliveriesCompleted = 120; // Example delivery count
  double ecoDrivingScore = 0.85; // Eco-driving score (85%)
  double emissionsReduction = 0.6; // Emissions reduction goal progress (60%)
  double rating = 4.5; // Driver rating out of 5

  // Example delivery history
  final List<Map<String, String>> deliveryHistory = [
    {"date": "2025-01-08", "status": "Completed"},
    {"date": "2025-01-07", "status": "Delayed"},
    {"date": "2025-01-06", "status": "Completed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),  // Set background to white for the entire screen
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 175.0,
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 145, 172, 143),  // Use a lighter, more neutral background color
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Driver details on the left
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            driverName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),  // Changed to black for better contrast
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            driverEmail,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,  // Changed to black for better contrast
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Eco-driving progress container
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: ecoDrivingScore,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        const Color.fromARGB(255, 145, 172, 143),  // Lighter color for progress
                                      ),
                                      strokeWidth: 6.0,
                                    ),
                                    const Icon(
                                      Icons.eco,
                                      color: const Color.fromARGB(255, 102, 120, 95),  // Changed to green for better alignment
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Eco Score",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Sustainability Leader",
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.grey,
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
                    const SizedBox(width: 20),
                    // Profile image on the right
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(logo), // Replace with your image path
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                // Emissions Reduction Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 145, 172, 143),  // Changed to a lighter background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Emissions Reduction",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),  // Changed to black for better contrast
                          ),
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: emissionsReduction,
                          backgroundColor: Colors.grey[300],
                          color: const Color.fromARGB(255, 102, 120, 95),
                          minHeight: 8,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Progress: ${(emissionsReduction * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Rating Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 145, 172, 143),  // Lighter background color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Driver Rating",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star_half, color: Colors.amber, size: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Keep up the great work to maintain your high rating!",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Delivery History Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 145, 172, 143),  // Lighter background color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Delivery History",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...deliveryHistory.map((delivery) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  delivery["date"]!,
                                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Text(
                                  delivery["status"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: delivery["status"] == "Completed"
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Logout Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Perform logout
                    },
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text("Logout", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.red[400],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
