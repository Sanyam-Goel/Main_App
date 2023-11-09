import 'package:flutter/material.dart';

class SuccessPassword extends StatelessWidget {
  const SuccessPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/acc_created.png'), // Replace with your image asset path
            fit: BoxFit.fill, // Make the image cover the full screen
          ),
        ),
        child: const Center(
            child: Text(
          "",
          textScaleFactor: 2,
        )),
      ),
    );
  }
}