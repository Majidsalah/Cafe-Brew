import 'package:caffino/manager/cartCubit/cart_cubit.dart';
import 'package:caffino/manager/favoriteCubit/favorite_cubit.dart';
import 'package:caffino/manager/homeCubit/coffee_cubit_cubit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:caffino/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoffeeCubitCubit()..getCoffeeCups(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..isCartEmpty(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit()..isFavoriteEmpty(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: Appcolor.navy,
            textTheme:
                GoogleFonts.rosarivoTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
