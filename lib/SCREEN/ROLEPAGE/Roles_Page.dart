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
  String _selectedRole = 'Logistics Operator'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        title: const Text(
          'Select Your Role',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [homeBg, homeBg],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Choose Your Role:',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 20),
              _buildRoleOption(
                title: 'Delivery Partner',
                icon: Icons.local_shipping,
                isSelected: _selectedRole == 'Delivery Partner',
                onTap: () {
                  setState(() {
                    _selectedRole = 'Delivery Partner';
                  });
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_selectedRole == 'Delivery Partner') {
                    Get.off(() => DriverHomeScreen());
                  } else if (_selectedRole == 'Logistics Operator') {
                    Get.off(() => LogisticOperatorHomeScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 145, 172, 143),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Confirm Selection',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
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
          color: isSelected ? color2 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color1 : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.white,
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
              color: isSelected ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ?Colors.white : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 30,
              ),
          ],
        ),
      ),
    );
  }
}
