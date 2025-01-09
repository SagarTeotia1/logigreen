import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/HomeScreen/LogisticOperator_Home_Screen.dart';

class PackagingRecom extends StatefulWidget {
  const PackagingRecom({super.key});

  @override
  State<PackagingRecom> createState() => _PackagingRecomState();
}

class _PackagingRecomState extends State<PackagingRecom> {
  final _formKey = GlobalKey<FormState>();
  String _cargoType = 'General'; // Default value
  double _weight = 0;
  String _recommendedPackaging = '';
  String _preferredPackaging = 'Standard'; // Default value
  bool _ecoFriendly = false;

  // Function to determine the recommended packaging
  void _recommendPackaging() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        // Simple logic for packaging recommendation based on cargo type and weight
        if (_cargoType == 'Fragile' && _weight > 5) {
          _recommendedPackaging = 'Bubble Wrap and Cardboard Box';
        } else if (_cargoType == 'Perishable') {
          _recommendedPackaging = 'Thermal Insulated Packaging';
        } else if (_ecoFriendly) {
          _recommendedPackaging = 'Eco-friendly Corrugated Box';
        } else {
          _recommendedPackaging = 'Standard Cardboard Box';
        }
      });

      // Show dialog box to choose AR or analysis
      _showArDialog();
    }
  }

  // Function to show dialog box with AR options
  void _showArDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('View in AR'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Recommended Packaging: $_recommendedPackaging',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text('Would you like to view the packaging in AR?'),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for opening AR functionality
                      Navigator.pop(context);
                      _viewInAr();
                    },
                    child: const Text('View in AR'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for starting AR analysis
                      Navigator.pop(context);
                      _analyzeInAr();
                    },
                    child: const Text('Analyze in AR'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Placeholder for AR view
  void _viewInAr() {
    // Logic for viewing the packaging in AR
    print("Viewing packaging in AR...");
  }

  // Placeholder for AR analysis
  void _analyzeInAr() {
    // Logic for analyzing the packaging in AR
    print("Analyzing packaging in AR...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background color
      appBar: AppBar(title: const Text('Packaging Recommendation'),leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: (){
        Get.off(()=>LogisticOperatorHomeScreen());})),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cargo Type Dropdown
                DropdownButtonFormField<String>(
                  value: _cargoType,
                  decoration: const InputDecoration(
                    labelText: 'Cargo Type',
                    prefixIcon: Icon(Icons.local_shipping),
                    border: OutlineInputBorder(),
                  ),
                  items: ['General', 'Perishable', 'Fragile', 'Hazardous']
                      .map((String cargoType) {
                    return DropdownMenuItem<String>(
                      value: cargoType,
                      child: Text(cargoType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _cargoType = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a cargo type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Weight Input
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    prefixIcon: Icon(Icons.monitor_weight_sharp),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the weight';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _weight = double.parse(value);
                  },
                ),
                const SizedBox(height: 16),

                // Eco-friendly Packaging Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _ecoFriendly,
                      onChanged: (bool? value) {
                        setState(() {
                          _ecoFriendly = value!;
                        });
                      },
                    ),
                    const Text('Eco-friendly Packaging'),
                  ],
                ),
                const SizedBox(height: 16),

                // Preferred Packaging Dropdown
                DropdownButtonFormField<String>(
                  value: _preferredPackaging,
                  decoration: const InputDecoration(
                    labelText: 'Preferred Packaging',
                    prefixIcon: Icon(Icons.archive),
                    border: OutlineInputBorder(),
                  ),
                  items: ['Standard', 'Eco-friendly', 'Custom']
                      .map((String packaging) {
                    return DropdownMenuItem<String>(
                      value: packaging,
                      child: Text(packaging),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _preferredPackaging = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select packaging type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: _recommendPackaging,
                  child: const Text('Get Packaging Recommendation'),
                ),
                const SizedBox(height: 20),

                // Display the recommended packaging
                if (_recommendedPackaging.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Recommended Packaging: $_recommendedPackaging',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
