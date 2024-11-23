import 'package:caffino/manager/homeCubit/coffee_cubit_cubit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:caffino/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideBar extends StatefulWidget {
  SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<String> _categorey = ['Hot & Cold', 'Hot', 'Cold'];
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h),
      height: 320.h,
      width: 40.w,
      decoration: BoxDecoration(
          color: Appcolor.lightNavy,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(64), bottomRight: Radius.circular(64))),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 24.h, bottom: 24.h, left: 8.w),
        itemCount: _categorey.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RotatedBox(
            quarterTurns: -1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedItem = index;
                });
                final category = CoffeeCategory.values[index];
                context.read<CoffeeCubitCubit>().setFilter(category);
              },
              child: Text(
                _categorey[index],
                style:
                    _selectedItem == index ? AppStyle.title : AppStyle.subTitle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
