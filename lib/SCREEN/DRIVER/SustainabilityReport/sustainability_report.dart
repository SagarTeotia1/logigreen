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
  final List<Widget> _pages = [
    HomeScreenPage(),
    SustainabilityReportPage(),
    LogiOperatorGuide(),
    Container(color: Colors.orange),
    LogiOperatorProfileScreen(),
  ];

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
        backgroundColor: const Color(0xFFD5E8D6),
        elevation: 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEFFAF0), Color(0xFFC9E7CE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _buildWidgetSection(CO2EmissionWidget(), "Carbon Emissions"),
            _buildWidgetSection(EcoDrivingBehaviorWidget(), "Eco Driving"),
            _buildWidgetSection(FuelConsumptionWidget(), "Fuel Consumption"),
            _buildWidgetSection(RecyclingIncentivesWidget(), "Recycling"),
            _buildWidgetSection(RouteOptimizationWidget(), "Route Optimization"),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItems
            .map(
              (item) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], color: Colors.black, size: 24),
                  const SizedBox(height: 2),
                  Text(
                    item['label'],
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            )
            .toList(),
        backgroundColor: Color(0xFFD5E8D6),
        color: Colors.white,
        buttonBackgroundColor: const Color(0xFFEFFAF0),
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
      ),
    );
  }

  Widget _buildWidgetSection(Widget widget, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B5945),
                ),
              ),
              const SizedBox(height: 10),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}
