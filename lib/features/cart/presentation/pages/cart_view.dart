import 'package:e/Di/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_get_cart.dart';

class CartView extends StatelessWidget {
  static const String routeName = "cart";

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..getCart(),
      child: Scaffold(
        //// AppBar
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            cart,
            style: AppTextStyles.elMessIri20.copyWith(
              color: MyColors.bluePrimary,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: MyColors.bluePrimary, size: 30),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: MyColors.bluePrimary,
                size: 30,
              ),
            ),
          ],
        ),

        /// Body
        body:Padding(
          padding:  EdgeInsets.only(bottom: 180.0.h),
          child: CustomGetCart(),
        ),

        /// BOTTOM SHEET
        bottomSheet: CustomBottomSheet(),
      ),
    );
  }
}
