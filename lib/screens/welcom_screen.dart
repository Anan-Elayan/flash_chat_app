import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    // animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    // may be use the reverse;
    // controller?.reverse(from: 1.0);
    // animation?.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller?.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller?.forward();
    //   }
    //   print(status);
    // });
    controller?.forward();
    controller?.addListener(() {
      setState(() {});
      print(animation?.value);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    //nimation?.value * 100
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 45.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                // Text(
                //   // may be use as a loading animation [ controller?.value.toInt() ]
                //   'Flash Chat',
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //     color: Colors.black54,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'Login ',
              colour: Colors.lightBlueAccent,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              title: 'Register',
              colour: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
