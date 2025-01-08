import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logigreen/Const/const_colo.dart';  // Assuming your custom colors are here

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
        title: const Text('LogiGreen Driver Dashboard'),
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: homeBg, // Assuming homeBg is your theme color
            ),
            child: UserAccountsDrawerHeader(
              accountName: Text('Sagar'),
              accountEmail: Text('driver@logigreen.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/Sagar.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to Profile Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to Settings Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Implement logout logic here
            },
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
              chipColor = homeBg;
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
    final List<String> tasks = [
      'Track Carbon Emissions',
      'Leaderboard and Rewards',
      'View Sustainability Reports',
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: homeBg,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Driver Tasks',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                ...tasks.map((task) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                      title: Text(task),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          // No navigation yet as those pages were removed
                        },
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
