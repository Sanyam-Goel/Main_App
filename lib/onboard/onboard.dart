import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_one/home_page.dart';
import 'package:project_one/onboard/start_build.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'onboard_model.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/img-1a.jpg',
      text: "Welcome to Habit Hut !",
      desc: "This is Graffy, your habit buddy",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/img-2.png',
      text: "Develop good habits",
      desc:
          "Graffy will assign you tasks and help you in developing good habits.",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/img-2.png',
      text: "Build Graffy's hut",
      desc:
          "Each time you complete a task, you'll get materials to build Graffy's hut.",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    log("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    //log(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      // appBar: AppBar(
      //   backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      //   elevation: 0.0,
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         _storeOnboardInfo();
      //         Navigator.pushReplacement(
      //             context, MaterialPageRoute(builder: (context) => const HomePage()));
      //       },
      //       child: Text(
      //         "Skip",
      //         style: TextStyle(
      //           color: currentIndex % 2 == 0 ? kblack : kwhite,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background_image2.jpg'), // Replace with your image asset path
            fit: BoxFit.cover, // Make the image cover the full screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      //padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Stack(children: <Widget>[
                        Container(margin: const EdgeInsets.only(top: 325, left: 90),
                        child:
                          index < 2 ? 
                         Image.asset('assets/img-1b.jpg')
                         :
                         const SizedBox(height: 1,),
                        ),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.only(top: 50),
                            height: 300,
                            width: 379,
                            child: Image.asset(screens[index].img)),
                        )
                      ],),
                    ),
                    // SizedBox(
                    //     height: 300,
                    //     width: 379,
                    //     child: Image.asset(screens[index].img)),
                    SizedBox(
                      width: 320,
                      child: Text(
                        screens[index].text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          color: Color(0xFFFF6A4C),
                          //color: index % 2 == 0 ? kblack : kwhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: Text(
                        screens[index].desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26.0,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          //color: Color(0x00069fdd),
                          //color: index % 2 == 0 ? kblack : kwhite,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 10.0,
                        child: ListView.builder(
                          itemCount: screens.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    width: currentIndex == index ? 25 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? kbrown
                                          : kbrown300,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ]);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                _storeOnboardInfo();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              },
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () async {
                                    //log(index);
                                    if (index == screens.length - 1) {
                                      await _storeOnboardInfo();
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StartBuilding()));
                                    }

                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.bounceIn,
                                    );
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFF6A4C), //FF491B
                                    ),
                                    child: const Center(
                                      child: Text('>',
                                          style: TextStyle(color: Colors.white)
                                          // Icon(
                                          //   Icons.arrow_forward,
                                          //   color: index % 2 == 0 ? kwhite : kblue,),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
