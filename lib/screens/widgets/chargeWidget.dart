import 'package:caffino/screens/widgets/dashedLine.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargeWidget extends StatelessWidget {
  const ChargeWidget({super.key, required this.price});
  final double taxes = 9;
  final double delivery = 30;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashedSeparator(color: Colors.grey.shade700),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 40,
              width: 300,
              decoration: BoxDecoration(color: Appcolor.lightNavy),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Apply Coupon Code',
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Appcolor.titleColor,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 343,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Appcolor.navy),
                  ),
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Appcolor.navy),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Delivery Charges',
            ),
            Text(delivery.toString(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.openSans.toString())),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Taxes',
            ),
            Text(taxes.toString(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.openSans.toString())),
          ],
        ),
        const SizedBox(height: 10),
        DashedSeparator(color: Colors.grey.shade700),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Grand Total',
                style: TextStyle(
                  fontSize: 20.sp,
                )),
            Text(totalPrice().toString(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.openSans.toString())),
          ],
        ),
      ],
    );
  }

  double totalPrice() {
    double total = delivery + taxes + price;
    return total;
  }
}
