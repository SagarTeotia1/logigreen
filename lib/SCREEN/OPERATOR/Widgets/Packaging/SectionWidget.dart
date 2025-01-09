import 'package:flutter/material.dart';

class MainSectionWidget extends StatelessWidget {
  const MainSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sectionWidth = (MediaQuery.of(context).size.width / 2) - 24; // Adjusting width dynamically
    const double sectionHeight = 120.0; // Fixed height for all boxes

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSectionBox(
                context,
                title: "Peer Counseling",
                icon: Icons.chat_bubble_outline,
                color: Colors.blueAccent,
                width: sectionWidth,
                height: sectionHeight,
                onTap: () {
                  // Navigate to Peer Counseling Page
                },
              ),
              _buildSectionBox(
                context,
                title: "Substance Identification",
                icon: Icons.search,
                color: Colors.teal,
                width: sectionWidth,
                height: sectionHeight,
                onTap: () {
                  // Navigate to Substance Identification Page
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildSectionBox(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required double width,
    required double height,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height, // Uniform height for all boxes
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.0,
              child: Icon(icon, size: 24.0, color: color),
            ),
            const SizedBox(height: 12.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035, // Responsive font size
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
