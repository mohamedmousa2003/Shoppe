import 'package:e/core/styles/colors.dart';
import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;

  const CategoryCardItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    // Create a container for the category card
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 16.h),
      // Height of the card set with fixed size to make all image same size but it can be deleted without affecting the code
      height:100.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            // Background image for the category
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Overlay with category title and button
            Positioned.fill(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 18.w, vertical: 8.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Category title
                              Text(
                                title,
                                style: AppTextStyles.textStyle20.copyWith(
                                    color: MyColors.red,
                                    fontSize: 16.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Shop Now button
                              SizedBox(
                                width: 110.w,
                                height: 35.h,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(120.w, 30.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 0),
                                        backgroundColor: MyColors.bluePrimary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.r))),
                                    child: Text(
                                      "Shop Now",
                                      style: AppTextStyles.textStyle18,
                                    )),
                              )
                            ],
                          )),
                      const Spacer()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}