import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:logigreen/CONST/const_colo.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/Guide/LogiGuide.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/HomePage/LogiOperatorHomePage.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/Profile/LogiOperatorProfile.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/ReportPage/ReportPage.dart';

class LogisticOperatorHomeScreen extends StatefulWidget {
  const LogisticOperatorHomeScreen({super.key});

  @override
  _LogisticOperatorHomeScreenState createState() =>
      _LogisticOperatorHomeScreenState();
}

class _LogisticOperatorHomeScreenState
    extends State<LogisticOperatorHomeScreen> {
  // Define a list of widgets (pages) to show based on the index
  final List<Widget> _pages = [
    LogiOperatorHomePage(),

    LogiOperatorGuide(),
   ReportPage(),
    LogiOperatorProfileScreen()
  ];

  // Initially set to 0, meaning the first page will be shown
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _navigationItems = [
    {'icon': Icons.local_shipping, 'label': 'Shipment'},
    {'icon': Icons.support_agent, 'label': 'Guide'},
    {'icon': Icons.analytics, 'label': 'Reports'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg, // Use your color constant for the background
      body: _pages[
          _currentIndex], // Display the current page based on the selected index
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
        buttonBackgroundColor: const Color.fromARGB(
            255, 247, 247, 247), // Central icon button background
        animationDuration: const Duration(milliseconds: 300),
        height: 70, // Adjusted height to accommodate labels
        index: _currentIndex, // This ensures the correct icon is highlighted
        onTap: (index) {
          setState(() {
            // Update the current index and display the corresponding page
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
