// ReportPage.dart
import 'package:flutter/material.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/driver.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/shipment.dart';
import 'package:logigreen/SCREEN/DRIVER/widgets/homepage/shipment_history.dart';

class DriverReportPage extends StatefulWidget {
  @override
  _DriverReportPageState createState() => _DriverReportPageState();
}

class _DriverReportPageState extends State<DriverReportPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Packages'),
            Tab(text: 'Drivers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Replace OverviewReport() with the SliverToBoxAdapter and custom widgets
          CustomReportPage(), 

          DriverReport(),
        ],
      ),
    );
  }
}

class CustomReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.transparent, // Updated background color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ShipmentDetailsWidget(),
                ShipmentHistoryWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
