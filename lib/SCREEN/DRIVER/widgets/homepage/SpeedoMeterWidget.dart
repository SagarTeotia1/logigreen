import 'package:flutter/material.dart';

class SpeedometerWidget extends StatefulWidget {
  const SpeedometerWidget({super.key});

  @override
  _SpeedometerWidgetState createState() => _SpeedometerWidgetState();
}

class _SpeedometerWidgetState extends State<SpeedometerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _speedometerAnimation;

  double _currentSpeed = 0;
  double _recommendedSpeed = 50;
  Color _currentColor = Colors.green;
  String _speedMessage = "Perfect!";
  final List<double> _speedSequence = [40, 60, 50, 80, 60, 100, 80];
  int _currentStep = 0;

  double _co2Emission = 0.5; // Example CO₂ in kg/km
  String _timeArrival = "12:30 PM";
  double _distanceTraveled = 120; // Example distance in km

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    _speedometerAnimation = Tween<double>(begin: _currentSpeed, end: _speedSequence[_currentStep])
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextAnimationStep();
      }
    });

    _startAnimation();
  }

  void _startAnimation() {
    _updateSpeedMessageAndColor(_speedSequence[_currentStep]);
    _controller.forward();
  }

  void _nextAnimationStep() {
    setState(() {
      _currentStep = (_currentStep + 1) % _speedSequence.length;
      _currentSpeed = _speedometerAnimation.value;
      _updateSpeedMessageAndColor(_speedSequence[_currentStep]);

      _speedometerAnimation = Tween<double>(begin: _currentSpeed, end: _speedSequence[_currentStep])
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    });

    _controller.reset();
    _controller.forward();
  }

  void _updateSpeedMessageAndColor(double targetSpeed) {
    if (targetSpeed <= 50) {
      _recommendedSpeed = 50;
    } else if (targetSpeed <= 80) {
      _recommendedSpeed = 60;
    } else {
      _recommendedSpeed = 80;
    }

    if (targetSpeed == _recommendedSpeed) {
      _currentColor = Colors.green;
      _speedMessage = "Perfect!";
    } else if (targetSpeed > _recommendedSpeed) {
      _currentColor = Colors.red;
      _speedMessage = "Go Slow";
    } else {
      _currentColor = Colors.orange;
      _speedMessage = "Go Fast";
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, spreadRadius: 3)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommended Speed:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "$_recommendedSpeed km/h",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        _currentColor.withOpacity(0.3),
                        Colors.transparent,
                      ],
                      radius: 0.8,
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        Colors.grey.shade300,
                        _currentColor.withOpacity(0.8),
                        Colors.grey.shade300,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 160,
                  child: AnimatedBuilder(
                    animation: _speedometerAnimation,
                    builder: (context, child) {
                      return CircularProgressIndicator(
                        value: _speedometerAnimation.value / 120,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(_currentColor),
                      );
                    },
                  ),
                ),
                AnimatedBuilder(
                  animation: _speedometerAnimation,
                  builder: (context, child) {
                    return Text(
                      '${_speedometerAnimation.value.toInt()} km/h',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: -3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: _currentColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: _currentColor, width: 2),
                    ),
                    child: Text(
                      _speedMessage,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _currentColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade400, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.eco, color: Colors.green, size: 20),
                      Text(
                        "CO₂:\n$_co2Emission kg",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue, size: 20),
                      Text(
                        "Time:\n$_timeArrival",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.directions_car, color: Colors.orange, size: 20),
                      Text(
                        "Dist:\n$_distanceTraveled km",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
