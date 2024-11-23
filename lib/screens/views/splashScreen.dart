import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:caffino/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

bool _showAnimatedText = false;

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showAnimatedText = true;
      });
    });
    Future.delayed(const Duration(seconds: 7),
        () => GoRouter.of(context).pushReplacement(AppRouter.kHomeView));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        color: Appcolor.titleColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/ani/Animation - 1731536762127.json',
                fit: BoxFit.contain, repeat: false),
            const SizedBox(
              height: 40,
            ),
            if (_showAnimatedText) _buitAnimatedText(),
          ],
        ),
      ),
    ));
  }
}

_buitAnimatedText() {
  List<Color> colorizeColors = [
    const Color.fromARGB(255, 54, 28, 19),
    const Color.fromARGB(255, 129, 56, 31),
    const Color.fromARGB(255, 129, 56, 31),
    const Color.fromARGB(255, 129, 56, 31),
    const Color.fromARGB(255, 129, 56, 31),
    Appcolor.titleColor,
    Colors.brown,
    Appcolor.titleColor,
    Appcolor.titleColor,
    Appcolor.titleColor,
    Appcolor.titleColor,
  ];

  const colorizeTextStyle =
      TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold);
  return SizedBox(
    width: 250.0,
    child: AnimatedTextKit(
    
      totalRepeatCount: 1,
      animatedTexts: [
        ColorizeAnimatedText(
          'Càfé Brew',
          textAlign: TextAlign.center,
          textStyle: colorizeTextStyle,
          speed: const Duration(seconds: 1),
          colors: colorizeColors,
        ),
      ],
      isRepeatingAnimation: true,
    ),
  );
}
