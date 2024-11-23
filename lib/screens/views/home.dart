import 'package:caffino/screens/views/cartView.dart';
import 'package:caffino/screens/views/favoriteView.dart';
import 'package:caffino/screens/views/notificationView.dart';
import 'package:caffino/screens/widgets/appBar.dart';
import 'package:caffino/screens/widgets/homeListView.dart';
import 'package:caffino/screens/widgets/searchBar.dart';
import 'package:caffino/screens/widgets/sideBar.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> screens = [
  const HomePageView(),
  const Cartview(),
  const FavoriteView(),
  const Notificationview(),
];

class _HomeState extends State<Home> {
  int currentPageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: NavigationBar(
                  height: 50.h,
                  backgroundColor: Appcolor.darkNavy,
                  selectedIndex: currentPageSelected,
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentPageSelected = index;
                    });
                  },
                  labelBehavior:
                      NavigationDestinationLabelBehavior.onlyShowSelected,
                  indicatorColor: Colors.transparent,
                  destinations: [
                    NavigationDestination(
                      icon: const Icon(Icons.home_filled),
                      selectedIcon: Icon(
                        Icons.home_filled,
                        color: Appcolor.titleColor,
                      ),
                      label: '',
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.shopping_cart),
                      selectedIcon: Icon(
                        Icons.shopping_cart,
                        color: Appcolor.titleColor,
                      ),
                      label: '',
                    ),
                    const NavigationDestination(
                        selectedIcon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        icon: Icon(
                          Icons.favorite,
                        ),
                        label: ''),
                    const NavigationDestination(
                      icon: Icon(Icons.notifications_active),
                      selectedIcon: Icon(
                        Icons.notifications,
                        color: Colors.yellow,
                      ),
                      label: '',
                    ),
                  ]),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: currentPageSelected,
            children: screens,
          )),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Column(
              children: [
                const CustomAppBar(),
                SizedBox(height: 8.h),
                const SearchWidget(),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 458.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideBar(),
                SizedBox(width: 20.w),
                const CoffeeHomeList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
