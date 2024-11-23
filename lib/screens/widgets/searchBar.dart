import 'package:caffino/manager/homeCubit/coffee_cubit_cubit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      height: 40.h,
      width: 343.w,
      decoration: BoxDecoration(
          color: Appcolor.darkNavy, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        onChanged: (text){
           context.read<CoffeeCubitCubit>().setSearchText(text);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.h),
            hintText: 'Browse your favourite coffee...',
            hintStyle: TextStyle(fontSize: 14.h),
            prefixIcon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 16.h,
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
