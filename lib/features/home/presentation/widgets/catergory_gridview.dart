import 'package:e/core/constant/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/styles/styles.dart';


class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,

      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.w,
        crossAxisSpacing: 2.h,
      ),
      itemBuilder: (context, index) => Container(
        height: 150.h,
        width: 80.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
               child:  Image.asset(
              ImagePng.imageSlider1,
                fit: BoxFit.cover,
                height: 90.h,
                width: 90.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            CustomSizedBox(height: 5),
            Text(
              "Women's fashion",
              style: AppTextStyles.elMessIri20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      itemCount: 20,
    );
  }
}