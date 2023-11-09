import 'package:flutter/material.dart';
import 'package:project_one/signup_screen/password_b.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController xpController = TextEditingController();
  TextEditingController anotherFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    xpController.dispose();
    anotherFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode curr = FocusScope.of(context);
        if(!curr.hasPrimaryFocus){
          curr.unfocus();
        }
      },
      child: Scaffold(
        body: Column(
          // Wrap with a Column widget
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/background_image2.jpg'), // Replace with your image asset path
                    fit: BoxFit.cover, // Make the image cover the full screen
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20,),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SizedBox(
                        width: 87,
                        height: 175.0, // Adjust the height as needed
                        child: Image.asset(
                            'assets/sign_img_1.png'), // Replace with your image asset
                      ),
                      const SizedBox(height: 50.0),
                      SizedBox(
                        width: 348,
                        height: 60,
                        child: InkWell(
                          onTap: () {},
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: "Emai ID",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                                
                              ),
                              
                            ),
                            child: TextField(
                              controller: xpController,
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 348,
                        height: 60,
                        child: InkWell(
                          onTap: () {},
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: "Contact No",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              ),
                            ),
                            child: TextField(
                              controller: anotherFieldController,
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            // Access the values using xpController.text and anotherFieldController.text
                            String xpValue = xpController.text;
                            String anotherFieldValue = anotherFieldController.text;
                      
                            // Do something with the values
                            //print("XP: $xpValue");
                            //print("Another Field: $anotherFieldValue");
                            if(xpValue.length >= 10 && anotherFieldValue.length >= 10){
                            Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const PasswordScreen(),
                          ),
                        );}
                            // Navigate to the next screen or perform your desired action.
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
