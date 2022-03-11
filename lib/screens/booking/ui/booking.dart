import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.05)),
        child: Center(
          child: const Text('Booking'),
        ),
      ),
    );
  }
}
