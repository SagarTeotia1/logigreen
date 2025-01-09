
import 'package:flutter/material.dart';
import 'package:logigreen/SCREEN/DRIVER/Widgets/HomePage/carbon_emmisions.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/eco_driving.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/fuel_consumption.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/recycling.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/route_optimization.dart';

class SustainabilityReportPage extends StatefulWidget {
  const SustainabilityReportPage({super.key});

  @override
  _SustainabilityReportPageState createState() =>
      _SustainabilityReportPageState();
}

class _SustainabilityReportPageState extends State<SustainabilityReportPage> {


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
