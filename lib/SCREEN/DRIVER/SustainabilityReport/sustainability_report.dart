import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:logigreen/SCREEN/DRIVER/Widgets/HomePage/carbon_emmisions.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/eco_driving.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/fuel_consumption.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/recycling.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/route_optimization.dart';
import 'package:logigreen/SCREEN/DRIVER/HomescreenPage/Home_Screen_Page.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/Guide/LogiGuide.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/Profile/LogiOperatorProfile.dart';

class SustainabilityReportPage extends StatefulWidget {
  const SustainabilityReportPage({super.key});

  @override
  _SustainabilityReportPageState createState() =>
      _SustainabilityReportPageState();
}

class _SustainabilityReportPageState extends State<SustainabilityReportPage> {
  // Pages for navigation
  final List<Widget> _pages = [
    HomeScreenPage(),
    SustainabilityReportPage(),
    LogiOperatorGuide(),
    Container(color: Colors.orange),
    LogiOperatorProfileScreen(),
  ];

  // Initially set to 1 since this page corresponds to the "Report" tab
  int _currentIndex = 1;

  final List<Map<String, dynamic>> _navigationItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.eco, 'label': 'Report'},
    {'icon': Icons.support_agent, 'label': 'Guide'},
    {'icon': Icons.analytics, 'label': 'Reports'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sustainability Report'),
        backgroundColor: Colors.green,
      ),
      body: CustomScrollView(
        slivers: [
          // Carbon Emissions Widget
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CO2EmissionWidget(),
                ],
              ),
            ),
          ),

          // Eco Driving Widget
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EcoDrivingBehaviorWidget(),
                ],
              ),
            ),
          ),

          // Fuel Consumption Widget
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FuelConsumptionWidget(),
                ],
              ),
            ),
          ),

          // Recycling Widget
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RecyclingIncentivesWidget(),
                ],
              ),
            ),
          ),

          // Route Optimization Widget
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RouteOptimizationWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItems
            .map(
              (item) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], color: Colors.black),
                  const SizedBox(height: 4),
                  Text(
                    item['label'],
                    style: const TextStyle(fontSize: 8, color: Colors.black),
                  ),
                ],
              ),
            )
            .toList(),
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor:
            const Color.fromARGB(255, 247, 247, 247), // Button background color
        animationDuration: const Duration(milliseconds: 300),
        height: 70,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Navigate to the corresponding page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
      ),
    );
  }
}
