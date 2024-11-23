import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/manager/cartCubit/cart_cubit.dart';
import 'package:caffino/screens/views/cupDetails.dart';
import 'package:caffino/screens/widgets/cartListViewItem.dart';
import 'package:caffino/screens/widgets/chargeWidget.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartview extends StatelessWidget {
  const Cartview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CoffeeCartSuccess) {
                  List<CoffeeModel> cart = state.cart;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Cart",
                          style: TextStyle(fontSize: 24.sp),
                        ),
                      ),
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: Key(index.toString()),
                                onDismissed: (hoir) {
                                  cart.removeAt(index);
                                  context.read<CartCubit>().isCartEmpty();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    margin: EdgeInsets.only(
                                        bottom: 10, right: 20, left: 20),
                                    content: Center(
                                        child: Text("Removed From Cart")),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.red,
                                  ));
                                },
                                background: Container(
                                  color: Colors.red,
                                  child: const Icon(Icons.delete,color: Colors.white,),
                                ),
                                child: CartListViewItem(cart: cart[index]));
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      ChargeWidget(
                        price: context.read<CartCubit>().totalCharge(),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onTap: () {},
                        child: Text(
                          'PAY NOW',
                          style: TextStyle(
                              color: Appcolor.darkNavy,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.openSans.toString()),
                        ),
                      )
                    ],
                  );
                } else if (state is CoffeeCartEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your Cart is Empty !!',
                        style: TextStyle(fontSize: 20),
                      ),
                      Center(
                        child: Image.asset('assets/cart.png'),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )),
      ),
    );
  }
}
