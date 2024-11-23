import 'package:caffino/manager/homeCubit/coffee_cubit_cubit.dart';
import 'package:caffino/manager/cartCubit/cart_cubit.dart';
import 'package:caffino/screens/widgets/homeCard.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:caffino/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CoffeeHomeList extends StatelessWidget {
  const CoffeeHomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: BlocBuilder<CoffeeCubitCubit, CoffeeCubitState>(
        builder: (context, state) {
          if (state is CoffeeCubitFailed) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is CoffeeCubitSuccess) {
            return ListView.builder(
                itemCount: (state.cups.length / 2).ceil(),
                itemBuilder: (context, index) {
                  int firstIndex = index * 2;
                  int secondIndex = firstIndex + 1;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      children: [
                        HomeCard(
                            cups: state.cups[firstIndex],
                            onTap: () => GoRouter.of(context).push(
                                  AppRouter.kDetailes,
                                  extra: state.cups[firstIndex],
                                ),
                            addToCart: () {
                              context
                                  .read<CoffeeCubitCubit>()
                                  .addToCartItem(
                                    state.cups[firstIndex],
                                    context.read<CartCubit>(),
                                  );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                margin: EdgeInsets.only(
                                    bottom: 10, right: 20, left: 20),
                                content:  Center(child: Text("Successfully Added To Cart")),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                              ));
                            }),
                        if (secondIndex < state.cups.length) ...[
                          const SizedBox(width: 12),
                          HomeCard(
                              cups: state.cups[secondIndex],
                              onTap: () => GoRouter.of(context).push(
                                  AppRouter.kDetailes,
                                  extra: state.cups[secondIndex]),
                              addToCart: () {
                                context
                                    .read<CoffeeCubitCubit>()
                                    .addToCartItem(
                                      state.cups[secondIndex],
                                      context.read<CartCubit>(),
                                    );
                                     ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                margin: EdgeInsets.only(
                                    bottom: 10, right: 20, left: 20),
                                content:  Center(child: Text("Successfully Added To Cart")),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                              ));
                                // BlocProvider.of<CartCubit>(context)
                                //     .addToCart(state.cups[secondIndex]);
                                // state.cups.removeAt(secondIndex);
                              }),
                        ],
                      ],
                    ),
                  );
                });
          } else {
            return  Center(child: Container(
              width: 40,
              height: 50,
              padding:const EdgeInsets.all(8),
              color:Appcolor.transWhite,
              child:const CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
