import 'package:e/core/styles/colors.dart';
import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String title;

  final bool isSelected;
  final Function onItemClick;

  const CategoryItem(this.index, this.title, this.isSelected, this.onItemClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // Handle item click by calling onItemClick callback
    return InkWell(
      onTap: () => onItemClick(index),
      child: Container(
        // Set background color based on selection
        color: isSelected? MyColors.white:MyColors.transparent,
        padding:  EdgeInsets.all(8.w),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: 8.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: MyColors.bluePrimary,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: 16.h, horizontal: 8.w),
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.textStyle14,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}