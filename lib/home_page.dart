import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background_image.jpg'), // Replace with your image asset path
            fit: BoxFit.cover, // Make the image cover the full screen
          ),
        ),
        child: const Center(
            child: Text(
          "Home page",
          textScaleFactor: 2,
        )),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text("Home Page"),),
    //   body: const Center(
    //     child:Text("Home page",textScaleFactor: 2,)
    //   ),
    // );
  }
}
