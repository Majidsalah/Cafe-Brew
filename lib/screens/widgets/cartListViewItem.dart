import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/manager/cartCubit/cart_cubit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartListViewItem extends StatefulWidget {
  const CartListViewItem({super.key, required this.cart});
  final CoffeeModel cart;

  @override
  State<CartListViewItem> createState() => _CartListViewItemState();
}

class _CartListViewItemState extends State<CartListViewItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 96,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Appcolor.transWhite,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              height: 72.h,
              width: 72.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.cart.image!,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.cart.title!,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'Dalgona Macha',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  widget.cart.price.toString(),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.openSans.toString()),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Container(
              width: 87,
              height: 30,
              decoration: BoxDecoration(
                color: Appcolor.transWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Appcolor.titleColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                          context
                              .read<CartCubit>()
                              .decreaseQuantity(widget.cart);
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.openSans.toString()),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Appcolor.titleColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                          context
                              .read<CartCubit>()
                              .increaseQuantity(widget.cart);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
