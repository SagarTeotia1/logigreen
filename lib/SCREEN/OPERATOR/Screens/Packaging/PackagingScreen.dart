import 'package:flutter/material.dart';
import 'package:logigreen/CONST/const_colo.dart';

class Packagingscreen extends StatefulWidget {
  const Packagingscreen({super.key});

  @override
  State<Packagingscreen> createState() => _PackagingscreenState();
}

class _PackagingscreenState extends State<Packagingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: homeBg,
      ),
    );
  }
}