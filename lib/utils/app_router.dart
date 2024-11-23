import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/screens/views/cupDetails.dart';
import 'package:caffino/screens/views/home.dart';
import 'package:caffino/screens/views/splashScreen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kSplashView = '/';
  static String kHomeView = '/home';
  static String kDetailes = '/detailes';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) {
          return const Splashscreen();
        },
      ),
       GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const Home();
        },
      ),
      GoRoute(
        path: kDetailes,
        builder: (context, state) {
          return Cupdetails(
            cups: state.extra as CoffeeModel,
          );
        },
      )
    ],
  );
}
