import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_one/signup_screen/acc_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var inputText = "";
  var actives = [false, false, false, false, false];
  var clears = [false, false, false, false, false];
  var values = [1, 2, 3, 2, 1];
  var currentIndex = 0;
  var message = "";
  bool movenext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background_image.jpg'), // Replace with your image asset path
            fit: BoxFit.cover, // Make the image cover the full screen
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Image.asset(
                  'assets/lock_img.png',
                  width: 116.0, // Adjust the size as needed
                  height: 141.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 62.0,
                  width: 348,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Adjust the border color as needed
                      width: 2.0, // Adjust the border width as needed
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < actives.length; i++)
                        AnimationBoxItem(
                          clear: clears[i],
                          active: actives[i],
                          value: values[i],
                        ),
                    ],
                  ),
                ),
                // const SizedBox(
                //         height: 20.0,
                //       ),
                // Text(
                //   message,
                //   style: const TextStyle(
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ))),
            Expanded(
              //flex: 1,
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1 / 0.5),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 50,
                  height: 50,
                  child: index == 9
                      ? const SizedBox()
                      : Center(
                          child: MaterialButton(
                            onPressed: () {
                              if (index == 11) {
                                inputText =
                                    inputText.substring(0, inputText.length - 1);
                                clears = clears.map((e) => false).toList();
                                currentIndex--;
                                if (currentIndex >= 0) {
                                  setState(() {
                                    clears[currentIndex] = true;
                                    actives[currentIndex] = false;
                                  });
                                } else {
                                  currentIndex = 0;
                                }
                                log(inputText);
                                return;
                              } else {
                                inputText +=
                                    numbers[index == 10 ? index - 1 : index]
                                        .toString();
                                if (inputText.length == 5) {
                                  setState(() {
                                    clears = clears.map((e) => true).toList();
                                    actives = actives.map((e) => false).toList();
                                  });
                                  if (inputText == "12345") {
                                    log("Success");
                                    setState(() {
                                      message = "Success";
                                      movenext = true;
                                    });
                                    //inputText = "";
                                    //currentIndex = 0;
                                    //go to next screen
                                    //return;
                                  } else {
                                    setState(() {
                                      message = "Forgot password?";
                                      movenext = false;
                                    });
                                  }
                                  inputText = "";
                                  currentIndex = 0;
                                  return;
                                }
                                message = "";
                                clears = clears.map((e) => false).toList();
                                setState(() {
                                  actives[currentIndex] = true;
                                  currentIndex++;
                                });
                                log(inputText);
                              }
                            },
                            color: index == 11 ? const Color.fromRGBO(170, 119, 255, 1) : const Color.fromRGBO(255, 106, 76, 1),
                            minWidth: 102,
                            height: 58,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: index == 11
                                ? const Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "${numbers[index == 10 ? index - 1 : index]}",
                                    style: const TextStyle(
                                      fontSize: 21.0,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                ),
                itemCount: 12,
              ),
            ),
            // const SizedBox(
            //   height: 50.0,
            // )
            ElevatedButton(
              onPressed: () {
                if(movenext){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SuccessPassword(),
                  ),
                );
                }// Navigate to the next screen or perform your desired action.
              },
              style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 106, 76,1),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(137.0, 53), // Width and height
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(35.0), // BorderRadius
                          ),
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationBoxItem extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final clear;
  // ignore: prefer_typing_uninitialized_variables
  final value;
  // ignore: prefer_typing_uninitialized_variables
  final active;
  const AnimationBoxItem(
      {super.key, this.clear = false, this.active = false, this.value});

  @override
  State<AnimationBoxItem> createState() => _AnimationBoxItemState();
}

class _AnimationBoxItemState extends State<AnimationBoxItem>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      animationController.forward(from: 0);
    }
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          // Handle tap action here if needed.
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          width: 10.0, // Adjust the size as needed
          height: 10.0, // Adjust the size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.active ? Colors.black : Colors.black45,
          ),
          child: Center(
            child: Text(
              widget.active ? '•' : '', // Show dot when active
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0, // Adjust the font size as needed
              ),
            ),
          ),
        ),
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:project_one/home_page.dart';

// class PasswordScreen extends StatefulWidget {
//   const PasswordScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PasswordScreenState createState() => _PasswordScreenState();
// }

// class _PasswordScreenState extends State<PasswordScreen> {
//   TextEditingController passwordController = TextEditingController();
//   String enteredPassword = '';

//   final String correctPassword = '1234'; // Replace with your correct password

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Password Screen'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           // Text at the top
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'Enter Your Password',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           // Image
//           SizedBox(
//             height: 150.0,
//             child: Image.asset('assets/sign_img_1.png'), // Replace with your image asset
//           ),
//           // Password Field
//           InkWell(
//             onTap: () {
//               // Prevent keyboard from opening
//             },
//             child: TextField(
//               controller: passwordController,
//               obscureText: true, // Show dots
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.none,
//               decoration: const InputDecoration(
//                 hintText: 'Enter Password',
//               ),
//             ),
//           ),
//           // Grid of Buttons
//           GridView.builder(
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, // Three buttons in each row
//             ),
//             itemCount: 12, // 0-9, backspace, and next
//             itemBuilder: (context, index) {
//               if (index == 9) {
//                 // Backspace button
//                 return buildButton('Backspace', () {
//                   setState(() {
//                     if (enteredPassword.isNotEmpty) {
//                       enteredPassword = enteredPassword.substring(0, enteredPassword.length - 1);
//                       passwordController.text = enteredPassword;
//                     }
//                   });
//                 });
//               } else if (index == 11) {
//                 // Next button
//                 return buildButton('Next', () {
//                   if (enteredPassword == correctPassword) {
//                     // Password is correct, navigate to the next screen
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (context) => const HomePage(),
//                       ),
//                     );
//                   } else {
//                     // Password is incorrect, show a snackbar
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Wrong Password. Try again.'),
//                       ),
//                     );
//                   }
//                 });
//               } else {
//                 // Numeric buttons (0-9)
//                 return buildNumericButton('$index', () {
//                   setState(() {
//                     enteredPassword += '$index';
//                     passwordController.text = enteredPassword;
//                   });
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildButton(String text, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         //et text color to black
//         minimumSize: const Size(15, 24), // Set the minimum size of the button
//       ),
//       child: Text(text),
//     );
//   }

//   Widget buildNumericButton(String text, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(15, 24), // Set the minimum size of the button
//       ),
//       child: Text(text),
//     );
//   }
// }

// // class NextScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Next Screen'),
// //       ),
// //       body: Center(
// //         child: Text('Welcome to the Next Screen!'),
// //       ),
// //     );
// //   }
// // }