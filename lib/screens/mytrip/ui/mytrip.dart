import 'package:flutter/material.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.05)),
        child: Center(
          child: const Text('My Trip '),
        ),
      ),
    );
  }
}
