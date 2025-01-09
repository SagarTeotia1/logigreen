import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logigreen/Const/const_colo.dart'; // Assuming your custom colors are here

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  String selectedFilter = "None";

  // Background assets with default image
  final Map<String, String> bgImages = {
    "None": "assets/images/dmap.png", // Default background image for drivers
    "Route Optimization": "assets/images/route_optimization.png",
    "Eco Driving": "assets/images/eco_driving.png",
  };

  final List<String> filters = ["None", "Route Optimization", "Eco Driving"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogiGreen'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildFilterChips(),
              Flexible(
                child: _buildDraggableSheet(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('driver@logigreen.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 218, 244, 219),
              child: Text('JD'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black),
            title: const Text("Notifications"),
            onTap: () {
              // Handle notifications action
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette, color: Colors.black),
            title: const Text("Change Theme"),
            onTap: () {
              // Handle theme change
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.black),
            title: const Text("Change Language"),
            onTap: () {
              // Handle language change
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.black),
            title: const Text("Settings"),
            onTap: () {
              // Handle settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
        bgImages[selectedFilter]!,
        key: ValueKey(selectedFilter),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onSubmitted: (value) {
          // Handle search functionality (can be used for search in nearby routes, locations, etc.)
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search for routes or locations...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: filters
              .where((filter) => filter != "None")
              .map((filter) {
            IconData icon;
            Color chipColor;
            if (filter == "Route Optimization") {
              chipColor = Colors.green; // Green for Route Optimization
            } else if (filter == "Eco Driving") {
              chipColor = Colors.blue; // Blue for Eco Driving
            } else {
              chipColor = Color.fromARGB(255, 218, 244, 219);
            }
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                label: Row(
                  children: [
                    Text(filter),
                  ],
                ),
                selected: selectedFilter == filter,
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = selected ? filter : "None";
                  });
                },
                selectedColor: chipColor,
                backgroundColor: Colors.grey[200],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

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
      "vendor": {"name": "Vendor Name", "profileImage": "assets/images/vendor.jpg"},
      "receiver": {"name": "Receiver Name", "profileImage": "assets/images/receiver.jpg"},
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
                    Text('Current Delivery Details', style: TextStyle(fontSize: 18)),
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
                          // Vendor Profile
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(currentDelivery["vendor"]["profileImage"]),
                              ),
                              const SizedBox(width: 8),
                              Text(currentDelivery["vendor"]["name"], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Destination: ${currentDelivery["destination"]}', style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 4),
                          // Receiver Profile
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(currentDelivery["receiver"]["profileImage"]),
                              ),
                              const SizedBox(width: 8),
                              Text(currentDelivery["receiver"]["name"], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
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


class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.7,
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
      ),
    );
  }
}
