import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:logigreen/CONST/const_colo.dart';
import 'package:logigreen/SCREEN/DRIVER/Guide/guide.dart'; // Correct path to Driver Guide
import 'package:logigreen/SCREEN/DRIVER/Profile/Profile.dart'; // Correct path to Driver Profile
import 'package:logigreen/SCREEN/DRIVER/HomescreenPage/Home_Screen_Page.dart'; // Import the HomeScreenPage
import 'package:logigreen/SCREEN/DRIVER/SustainabilityReport/sustainability_report.dart'; // Import the SustainabilityReport page

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  // Define a list of widgets (pages) to show based on the index
  final List<Widget> _pages = [
    // Home page
    HomeScreenPage(),
    // Sustainability Report page
    SustainabilityReportPage(), // Add the Sustainability Report page here
    DriverGuide(), // Driver Guide page from the correct path
    Container(
      color: Colors.orange,
    ),
    DriverProfileScreen(), // Driver Profile page from the correct path
  ];

  // Initially set to 0, meaning the first page will be shown
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _navigationItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.eco, 'label': 'Report'}, // Report now navigates to Sustainability Report
    {'icon': Icons.support_agent, 'label': 'Guide'},
    {'icon': Icons.add_box_rounded, 'label': 'Packages'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 244, 219), // Use your color constant for the background
      body: _pages[_currentIndex], // Display the current page based on the selected index
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItems
            .map(
              (item) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], color: Colors.black),
                  const SizedBox(height: 4), // Spacing between icon and label
                  Text(
                    item['label'],
                    style: TextStyle(
                      fontSize: 8, // Adjusted font size
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        backgroundColor: Colors.transparent, // Make the background transparent
        color: Colors.white, // Color of the navigation bar
        buttonBackgroundColor:
            const Color.fromARGB(255, 247, 247, 247), // Central icon button background
        animationDuration: const Duration(milliseconds: 300),
        height: 70, // Adjusted height to accommodate labels
        index: _currentIndex, // This ensures the correct icon is highlighted
        onTap: (index) {
          setState(() {
            // Update the current index and display the corresponding page
            _currentIndex = index;
          });
  }),
    );
  }
}
