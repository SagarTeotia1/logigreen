import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logigreen/CONST/const_colo.dart';
import 'package:logigreen/SCREEN/OPERATOR/Screens/HomeScreen/LogisticOperator_Home_Screen.dart';
import 'package:intl/intl.dart'; // Importing the intl package for date formatting

class Createshipment extends StatefulWidget {
  const Createshipment({super.key});

  @override
  State<Createshipment> createState() => _CreateshipmentState();
}

class _CreateshipmentState extends State<Createshipment> {
  final _formKey = GlobalKey<FormState>();
  String _destination = '';
  double _weight = 0;
  String _cargoType = 'General'; // Default value
  String _preferredPackaging = 'Standard'; // Default value
  DateTime _shipmentDate = DateTime.now();
  String _pickupLocation = '';
  double _shipmentValue = 0;
  String _specialInstructions = '';
  String _contactPerson = '';
  String _preferredRoute = 'Fastest'; // Default value

  // Simulating driver and vehicle recommendation
  String _recommendedDriver = '';
  String _recommendedVehicle = '';
  String _driverContact = '123-456-7890';  // Simulated contact
  String _vehicleNumber = 'EV-1234';  // Simulated vehicle number

  void _submitShipment() {
    if (_formKey.currentState!.validate()) {
      // Here you would call your AI/Backend for actual vehicle and driver recommendation
      setState(() {
        _recommendedDriver = 'John Doe (Eco-Driver)';
        _recommendedVehicle = 'Electric Van';
      });
      
      // Show the dialog after submission
      _showDriverDetailsDialog();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _shipmentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _shipmentDate) {
      setState(() {
        _shipmentDate = pickedDate;
      });
    }
  }

  // Function to show the dialog
  void _showDriverDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Driver: $_recommendedDriver',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Contact: $_driverContact'),
                Text('Vehicle Number: $_vehicleNumber'),
                Text('Vehicle Type: $_recommendedVehicle'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                     Get.off(()=>LogisticOperatorHomeScreen()); // Close the dialog
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(title: const Text('Create Shipment'),leading: IconButton( icon: const Icon(Icons.arrow_back), onPressed: (){
        Get.off(()=>LogisticOperatorHomeScreen());
      },),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Destination',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a destination';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _destination = value;
                  },
                ),
                const SizedBox(height: 16),
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
                DropdownButtonFormField<String>( 
                  value: _cargoType,  // Ensure a value is selected from the list
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
                DropdownButtonFormField<String>( 
                  value: _preferredPackaging,  // Ensure a value is selected from the list
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Pickup Location',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pickup location';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _pickupLocation = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Shipment Value (USD)',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the shipment value';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _shipmentValue = double.parse(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Special Instructions',
                    prefixIcon: Icon(Icons.info),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _specialInstructions = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Contact Person',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _contactPerson = value;
                  },
                ),
                const SizedBox(height: 16),
                Text("Preferred Route: $_preferredRoute"),
                DropdownButton<String>( 
                  value: _preferredRoute,
                  items: ['Fastest', 'Shortest', 'Eco-Friendly']
                      .map((route) => DropdownMenuItem<String>( 
                            value: route,
                            child: Text(route),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _preferredRoute = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Format date using DateFormat to exclude milliseconds
                    Text("Shipment Date: \n ${DateFormat('yyyy-MM-dd HH:mm').format(_shipmentDate)}", style: TextStyle(fontSize: 14)),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitShipment,
                  child: const Text('Submit Shipment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
