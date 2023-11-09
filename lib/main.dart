import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen/splash_screen.dart';
//import 'package:project_one/splash_screen/splash_screen.dart';

int? isviewed;
void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_image.jpg'), // Replace with your background image asset path
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: const SplashScreen(), // Replace with your main screen widget
        ),
      ),
    );
  }
}

// class BackgroundImageContainer extends StatelessWidget {
//   final Widget child;

//   const BackgroundImageContainer({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Image.asset(
//           'assets/background_image.jpg', // Replace with your background image asset path
//           fit: BoxFit.cover,
//         ),
//         child,
//       ],
//     );
//   }
// }

