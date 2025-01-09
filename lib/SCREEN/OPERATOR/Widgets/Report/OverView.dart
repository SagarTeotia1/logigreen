import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OverviewReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildSummaryCards(),
            SizedBox(height: 24),
            Divider(color: Colors.grey[300], thickness: 1),
            SizedBox(height: 16),
            _buildGraphSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger popup to ask for report type
          _showReportTypeDialog(context);
        },
        child: Icon(Icons.download),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Function to show popup dialog for report type selection
  void _showReportTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Report Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.calendar_view_week),
                title: Text("Weekly Report"),
                onTap: () {
                  _downloadReport(context, "Weekly");
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Monthly Report"),
                onTap: () {
                  _downloadReport(context, "Monthly");
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text("Yearly Report"),
                onTap: () {
                  _downloadReport(context, "Yearly");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to trigger the download action
  void _downloadReport(BuildContext context, String reportType) {
    Navigator.of(context).pop(); // Close the dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$reportType report is downloaded")),
    );
  }

  Widget _buildSummaryCards() {
    return Column(
      children: [
        _buildSummaryCard(
          title: 'Carbon Emissions',
          value: '2.4 Tons',
          description: 'Reduction this month',
          color: Colors.green,
          icon: Icons.eco,
        ),
        SizedBox(height: 16),
        _buildSummaryCard(
          title: 'Packaging Efficiency',
          value: '85%',
          description: 'Optimized space usage',
          color: Colors.blue,
          icon: Icons.inventory,
        ),
        SizedBox(height: 16),
        _buildSummaryCard(
          title: 'Shipments Delivered',
          value: '1,240',
          description: 'This month',
          color: Colors.orange,
          icon: Icons.local_shipping,
        ),
        SizedBox(height: 16),
        _buildSummaryCard(
          title: 'Eco-Driving Score',
          value: '92%',
          description: 'Driver performance',
          color: Colors.purple,
          icon: Icons.speed,
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String description,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 28,
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    value,
                    style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphSection() {
    return Column(
      children: [
        _buildLineChartSection(
          title: 'Carbon Emission Trends',
          spots: [
            FlSpot(0, 2),
            FlSpot(1, 2.2),
            FlSpot(2, 1.8),
            FlSpot(3, 2.5),
            FlSpot(4, 2.0),
            FlSpot(5, 1.8),
          ],
          gradientColors: [Colors.green, Colors.blue],
          leftLabel: 'CO₂ (Tons)',
        ),
        SizedBox(height: 24),
        _buildLineChartSection(
          title: 'Eco-Driving Performance',
          spots: [
            FlSpot(0, 85),
            FlSpot(1, 88),
            FlSpot(2, 90),
            FlSpot(3, 92),
            FlSpot(4, 91),
            FlSpot(5, 93),
          ],
          gradientColors: [Colors.purple, Colors.blue],
          leftLabel: 'Score (%)',
        ),
        SizedBox(height: 24),
        _buildLineChartSection(
          title: 'Packaging Efficiency Trends',
          spots: [
            FlSpot(0, 80),
            FlSpot(1, 82),
            FlSpot(2, 85),
            FlSpot(3, 88),
            FlSpot(4, 87),
            FlSpot(5, 89),
          ],
          gradientColors: [Colors.orange, Colors.yellow],
          leftLabel: 'Efficiency (%)',
        ),
      ],
    );
  }

  Widget _buildLineChartSection({
    required String title,
    required List<FlSpot> spots,
    required List<Color> gradientColors,
    required String leftLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false), // Hides the grid lines
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        // Mapping the x-axis values to days of the week
                        List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                        return Text(
                          weekdays[value.toInt()],
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Text(
                        '${value.toInt()}',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                  // Hide the top and right titles
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    gradient: LinearGradient(colors: gradientColors),
                    spots: spots,
                    barWidth: 4,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: gradientColors.map((color) => color.withOpacity(0.1)).toList(),
                      ),
                    ),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
