import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/manager/favoriteCubit/favorite_cubit.dart';
import 'package:caffino/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Cupdetails extends StatelessWidget {
  const Cupdetails({super.key, required this.cups});
  final CoffeeModel cups;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoffeeImage(
                cups: cups,
              ),
              CofeeDetailsWidget(
                cups: cups,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CofeeDetailsWidget extends StatefulWidget {
  const CofeeDetailsWidget({
    super.key,
    required this.cups,
  });
  final CoffeeModel cups;
  @override
  State<CofeeDetailsWidget> createState() => _CofeeDetailsWidgetState();
}

class _CofeeDetailsWidgetState extends State<CofeeDetailsWidget> {
  bool _isFavorite = false;
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.cups.title ?? 'Cappuccino',
                style: const TextStyle(fontSize: 24),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });

                  context.read<FavoriteCubit>().addToFavorite(widget.cups);
                },
                icon: Icon(
                    context.read<FavoriteCubit>().isFavorite(widget.cups)
                        ? Icons.favorite
                        : FontAwesomeIcons.heart,
                    size: 30,
                    color: context.read<FavoriteCubit>().isFavorite(widget.cups)
                        ? Colors.red
                        : Colors.grey),
                tooltip:
                    _isFavorite ? 'Remove from favorites' : 'Add to favorites',
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Drizzled with Caramel',
                style: TextStyle(fontSize: 16.sp),
              ),
              const SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/star.png',
                    height: 11.h,
                    width: 12.w,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.cups.rating!.rate.toString(),
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 260,
                  height: _isExpanded ? 80 : null,
                  child: Text(
                    widget.cups.description ??
                        'A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup ...A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup ... ',
                    overflow: _isExpanded
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
                    maxLines: _isExpanded ? 2 : null,
                  ),
                ),
                Text(
                  _isExpanded ? 'Read More' : 'Read Less',
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Choice of Milk',
            style: TextStyle(fontSize: 14.sp),
          ),
          ChoiceMilkWidget(),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: GoogleFonts.openSans.toString()),
                  ),
                  Text(
                    "${widget.cups.price.toString()} LE",
                    style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.openSans.toString()),
                  ),
                ],
              ),
              CustomButton(
                child: Text(
                  'BUY NOW',
                  style: TextStyle(
                      color: Appcolor.darkNavy,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.openSans.toString()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.onTap,
  });
  final Widget child;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 253,
        padding: const EdgeInsets.symmetric(vertical: 11),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Appcolor.titleColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class ChoiceMilkWidget extends StatefulWidget {
  ChoiceMilkWidget({
    super.key,
  });

  @override
  State<ChoiceMilkWidget> createState() => _ChoiceMilkWidgetState();
}

class _ChoiceMilkWidgetState extends State<ChoiceMilkWidget> {
  List<String> choices = ['Oat milk', 'Soy Milk', 'Almond Milk'];
  int isfilled = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: SizedBox(
        height: 40,
        width: 340,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: choices.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () => setState(() {
              isfilled = index;
            }),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 34,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isfilled == index ? Appcolor.titleColor : null,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: isfilled == index
                      ? null
                      : Border(
                          top: BorderSide(color: Appcolor.titleColor),
                          bottom: BorderSide(color: Appcolor.titleColor),
                          left: BorderSide(color: Appcolor.titleColor),
                          right: BorderSide(color: Appcolor.titleColor),
                        ),
                ),
                child: Text(
                  choices[index],
                  style: TextStyle(
                      color: isfilled == index ? Appcolor.darkNavy : null,
                      fontSize: 14.sp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeImage extends StatelessWidget {
  const CoffeeImage({
    super.key,
    required this.cups,
  });
  final CoffeeModel cups;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 0.9,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                cups.image!,
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.4), blurRadius: 6),
                ]),
            child: IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
