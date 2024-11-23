import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox( width: 200.h, child: _buildAnimatedText()),
          // const Spacer(),
          // SizedBox(
          //     height: 20,
          //     width: 20,
          //     child: Lottie.asset('assets/cup.json',
          //         fit: BoxFit.contain))
        ],
      ),
    );
  }
}

Widget _buildAnimatedText() {
  return AnimatedTextKit(
    pause: Durations.extralong4,
    repeatForever: true,
    isRepeatingAnimation: true,
    animatedTexts: [
      buitAnimatedText(),
      TyperAnimatedText(
        'Life begins after coffee',
        textAlign: TextAlign.center,
        speed: Durations.short2,
        textStyle: TextStyle(color: Appcolor.titleColor, fontSize: 24.sp),
      ),
      TyperAnimatedText('Just brewed happiness in a cup',
          textAlign: TextAlign.center,
          textStyle: TextStyle(color: Appcolor.titleColor, fontSize: 24.sp),
          speed: Durations.short2),
      TyperAnimatedText('But first, coffee',
          textAlign: TextAlign.center,
          textStyle: TextStyle(color: Appcolor.titleColor, fontSize: 24.sp),
          speed: Durations.short2),
      TyperAnimatedText('Another day, another cup of coffee',
          textAlign: TextAlign.center,
          textStyle: TextStyle(color: Appcolor.titleColor, fontSize: 24.sp),
          speed: Durations.short2),
    ],
    onTap: () {
      print("Tap Event");
    },
  );
}

buitAnimatedText() {
  List<Color> colorizeColors = [
    Appcolor.titleColor,
    Appcolor.subTitleColor,
    Appcolor.subTitleColor,
    Appcolor.titleColor,
    Appcolor.navy,
    Appcolor.navy,
    Appcolor.darkNavy,
    Appcolor.darkNavy,
  ];

  const colorizeTextStyle =
      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold);
  return ColorizeAnimatedText(
    'Càfé Brew',
    textAlign: TextAlign.center,
    textStyle: colorizeTextStyle,
    speed: const Duration(seconds: 1),
    colors: colorizeColors,
  );
}
