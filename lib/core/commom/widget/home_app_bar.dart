import 'package:e/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../features/cart/presentation/pages/cart_view.dart';
import '../../../features/category/presentation/pages/category_screen.dart';
import '../../constant/icon_assets.dart';
import '../../constant/text.dart';
import '../../styles/styles.dart';

class HomeScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.white,
      surfaceTintColor: MyColors.white,
      automaticallyImplyLeading: false,
      title: Text(
        shop,
        style: AppTextStyles.elMessIri40.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              /// 🔍 Search Bar
              Expanded(
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: MyColors.greyLighter,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12.w),
                      SvgPicture.asset(
                        IconsSvg.icSearch,
                        width: 28.w,
                        color: MyColors.greyDark,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Search products",
                          style: AppTextStyles.elMessIri20.copyWith(
                            color: MyColors.greyDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              /// 🛒 Cart with badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    onTap: () => Navigator.pushNamed(
                      context,
                      CartView.routeName,
                    ),
                    child: Container(
                      height: 60.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: MyColors.bluePrimary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          IconsSvg.icCart,
                          color: MyColors.bluePrimary,
                        ),
                      ),
                    ),
                  ),

                  /// 🔴 Badge
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: MyColors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "4",
                        style: AppTextStyles.elMessIri16.copyWith(
                          color: MyColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
}
