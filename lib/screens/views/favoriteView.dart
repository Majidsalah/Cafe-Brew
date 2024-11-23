import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/manager/favoriteCubit/favorite_cubit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(40),
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteSuccess) {
                List<CoffeeModel> favorites = state.favorites;
                return Column(
                  children: [
                    const Text(
                      ' ❤ Favorite Coffee ❤',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: (state.favorites.length / 2).ceil(),
                          itemBuilder: (context, index) {
                            int firstIndex = index * 2;
                            int secondIndex = firstIndex + 1;
                            return Row(
                              children: [
                                FavoriteviewItemCard(
                                    cups: favorites[firstIndex]),
                                const SizedBox(
                                  width: 10,
                                ),
                                if (secondIndex < state.favorites.length) ...[
                                  FavoriteviewItemCard(
                                      cups: favorites[secondIndex])
                                ]
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is FavoriteEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No Favorite Found !!',
                      style: TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: Lottie.asset(
                        'assets/Animation - 1731533546611.json',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class FavoriteviewItemCard extends StatelessWidget {
  const FavoriteviewItemCard({super.key, required this.cups});
  final CoffeeModel cups;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 210.h,
      margin: const EdgeInsets.only(bottom: 12),
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
                        onPressed: () {
                          context.read<FavoriteCubit>().addToFavorite(cups);
                          context.read<FavoriteCubit>().isFavoriteEmpty();
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20.h,
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
