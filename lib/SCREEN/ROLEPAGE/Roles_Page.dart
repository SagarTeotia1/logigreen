import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logigreen/SCREEN/DRIVER/HomeScreen/Driver_Home_Screen.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/HomeScreen/LogisticOperator_Home_Screen.dart';
import 'package:logigreen/const/const_colo.dart';

class UserRoleSelection extends StatefulWidget {
  @override
  _UserRoleSelectionState createState() => _UserRoleSelectionState();
}

class _UserRoleSelectionState extends State<UserRoleSelection> {
  String _selectedRole = 'Driver'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        title: const Text('Select Your Role'),
        backgroundColor: Color.fromARGB(255, 145, 172, 143), // Custom color for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Your Role:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _buildRoleOption(
              title: 'Driver',
              icon: Icons.local_shipping,
              isSelected: _selectedRole == 'Driver',
              onTap: () {
                setState(() {
                  _selectedRole = 'Driver';
                });
              },
            ),
            const SizedBox(height: 20),
            _buildRoleOption(
              title: 'Logistics Operator',
              icon: Icons.business_center,
              isSelected: _selectedRole == 'Logistics Operator',
              onTap: () {
                setState(() {
                  _selectedRole = 'Logistics Operator';
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (_selectedRole == 'Driver') {
                  Get.off(() => DriverHomeScreen());
                } else if (_selectedRole == 'Logistics Operator') {
                  Get.off(() => LogisticOperatorHomeScreen());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 145, 172, 143),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Confirm Selection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleOption({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.green : Colors.black54,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.green : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 30,
              ),
          ],
        ),
      ),
    );
  }
}
