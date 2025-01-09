import 'package:flutter/material.dart';

// Example report data
class SustainabilityReport {
  final String driverName;
  final int totalCO2Emissions;
  final int fuelConsumed;
  final int optimizedRoutes;
  final int ecoDrivingScore;
  final int packageEfficiency;
  final String maintenanceStatus;
  final String sustainabilityGoalProgress;

  SustainabilityReport({
    required this.driverName,
    required this.totalCO2Emissions,
    required this.fuelConsumed,
    required this.optimizedRoutes,
    required this.ecoDrivingScore,
    required this.packageEfficiency,
    required this.maintenanceStatus,
    required this.sustainabilityGoalProgress,
  });
}

class DriverSustainabilityWidget extends StatelessWidget {
  final SustainabilityReport report;

  DriverSustainabilityWidget({required this.report});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Driver Info Section
          Text(
            'Sustainability Report - ${report.driverName}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 15),

          // Carbon Emissions Section
          _buildReportSection(
            '1. Carbon Emissions Tracking',
            [
              'Total CO2 Emissions: ${report.totalCO2Emissions} Kg',
              'Emission Reduction: Reduced by 20% this month',
              'Comparison to Baseline: 10% better than average driver',
            ],
          ),

          // Fuel Consumption Section
          _buildReportSection(
            '2. Fuel Consumption',
            [
              'Total Fuel Used: ${report.fuelConsumed} Liters',
              'Fuel Efficiency: 15 km/L',
              'Fuel Saving Tips: Optimize your routes for better fuel usage',
            ],
          ),

          // Route Optimization Section
          _buildReportSection(
            '3. Route Optimization',
            [
              'Distance Traveled: 250 km',
              'Optimized Routes: 85% efficient',
              'Time Efficiency: 10% reduction in idle time',
            ],
          ),

          // Eco-Driving Behavior Section
          _buildReportSection(
            '4. Eco-Driving Behavior',
            [
              'Smooth Acceleration: 80%',
              'Sharp Turns Avoided: 70%',
              'Eco-Driving Score: ${report.ecoDrivingScore}',
            ],
          ),

          // Sustainable Packaging Section
          _buildReportSection(
            '5. Sustainable Packaging and Load Management',
            [
              'Package Efficiency: 90% recyclable materials used',
              'Load Optimization: 95% capacity used',
            ],
          ),

          // Maintenance Section
          _buildReportSection(
            '6. Maintenance and Vehicle Health',
            [
              'Vehicle Health: ${report.maintenanceStatus}',
              'Maintenance Impact: 10% improvement in fuel efficiency',
            ],
          ),

          // Sustainability Goals Section
          _buildReportSection(
            '7. Sustainability Goals & Progress',
            [
              'Personal Sustainability Target: Reduce CO2 by 25%',
              'Progress: ${report.sustainabilityGoalProgress}',
            ],
          ),

          // Gamified Insights Section
          _buildReportSection(
            '8. Gamified Insights',
            [
              'Performance Score: 85/100',
              'Ranking: 3rd in the fleet',
            ],
          ),

          // Feedback and Suggestions Section
          _buildReportSection(
            '9. Feedback and Suggestions',
            [
              'Personalized Tips: Drive more smoothly for better fuel efficiency',
              'Suggestions: Follow optimized routes more strictly',
            ],
          ),

          // Community Engagement Section
          _buildReportSection(
            '10. Community Engagement',
            [
              'Driver Community Contribution: 500 kg CO2 saved this month',
              'Upcoming Challenges: Participate in the Eco-Driving Challenge',
            ],
          ),

          // Summary of Achievements Section
          _buildReportSection(
            '11. Summary of Achievements',
            [
              'Key Milestones: 10,000 km driven sustainably',
              'Sustainability Impact: Helped save 2,500 kg of CO2 emissions',
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build each section of the report
  Widget _buildReportSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        ...items.map((item) => Text(
          '- $item',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        )),
        SizedBox(height: 15),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Driver Sustainability Report'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: DriverSustainabilityWidget(
          report: SustainabilityReport(
            driverName: 'John Doe',
            totalCO2Emissions: 120,
            fuelConsumed: 50,
            optimizedRoutes: 3,
            ecoDrivingScore: 75,
            packageEfficiency: 90,
            maintenanceStatus: 'Good',
            sustainabilityGoalProgress: '50% towards target',
          ),
        ),
      ),
    ),
  ));
}
