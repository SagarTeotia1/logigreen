import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:logigreen/SCREEN/OPERATOR/Screens/HomeScreen/LogisticOperator_Home_Screen.dart';
import 'package:logigreen/const/const_colo.dart';
// Import LogisticOperatorHomeScreen

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
        title: Text('Select Your Role'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose Your Role:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            RadioListTile<String>(
              title: Text('Driver'),
              value: 'Driver',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Logistics Operator'),
              value: 'Logistics Operator',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to the respective home screen based on the selected role
                if (_selectedRole == 'Driver') {
                  Get.off(() => LogisticOperatorHomeScreen());
                } else if (_selectedRole == 'Logistics Operator') {
                  Get.off(() => LogisticOperatorHomeScreen());
                }
              },
              child: Text('Confirm Selection'),
            ),
          ],
        ),
      ),
    );
  }
}
