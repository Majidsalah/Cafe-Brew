import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cups,
    this.onTap,
    this.addToCart,
  });
  final CoffeeModel cups;
  final Function()? onTap;
  final Function()? addToCart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 135.w,
        height: 210.h,
        decoration: BoxDecoration(
          color: Appcolor.transWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Stack(alignment: Alignment.topLeft, children: [
                SizedBox(
                  height: 100.h,
                  width: 200.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        cups.image!,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  height: 24.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: Appcolor.transWhite30,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/star.png',
                        height: 10.h,
                        width: 10.5.w,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${cups.rating!.rate.toString()} ",
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 12.h),
              Text(
                cups.title ?? 'Cinnamon & Cocoa',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(height: 12.h),
              Container(
                width: 111.w,
                height: 39.h,
                decoration: BoxDecoration(
                  color: Appcolor.transWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      "   ${cups.price.toString()} LE",
                      style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.openSans.toString()),
                    ),
                    const Spacer(),
                    Container(
                      width: 39.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Appcolor.titleColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          onPressed: addToCart,
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20.h,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
