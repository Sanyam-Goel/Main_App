import 'package:flutter/material.dart';
import 'package:project_one/signup_screen/signup_a.dart';

class StartBuilding extends StatelessWidget {
  const StartBuilding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background_image2.jpg'), // Replace with your image asset path
                fit: BoxFit.cover, // Make the image cover the full screen
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   'assets/hut_image.png',
                  //   width: 311.0, // Adjust the size as needed
                  //   height: 388.0,
                  // ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    //padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 50),
                          child: Image.asset('assets/hut_image.png'),
                        ),
                        Align(
                          child: Container(
                              margin: const EdgeInsets.only(top: 255, left: 150),
                              height: 203,
                              width: 169,
                              child: Image.asset('assets/img-2.png')),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                      // Navigate to the sign-up page here
                      // Navigator.pushNamed(context,
                      //     '/signup'); // You should define '/signup' route
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 106, 76, 1),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(274.0, 69.12), // Width and height
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(35.0), // BorderRadius
                      ),
                    ),
                    child: const Text('Start Building'),
                  ),
                ],
              ),
            )));
  }
}
