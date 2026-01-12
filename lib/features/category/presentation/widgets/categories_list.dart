import 'package:cached_network_image/cached_network_image.dart';
import 'package:e/core/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData category;

  const CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: MyColors.black,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// 🖼 Image
          CachedNetworkImage(
            height: 70.h,
            width: 70.w,
            imageUrl: category.images?.first ?? "",
            placeholder: (context, url) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                radius: 35.r,
                backgroundImage: imageProvider,
              );
            },
          ),

          SizedBox(width: 16.w),

          /// 📝 Text
          Expanded(
            child: Text(
              category.category?.name ?? "",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
