import 'package:e/core/constant/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';

class SliderImage extends StatelessWidget {
  SliderImage({super.key});

  final List<String> images = [
    ImagePng.imageSlider1,
    ImagePng.imageSlider2,
    ImagePng.imageSlider3,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ImageSlideshow(
        width: double.infinity,
        height: 250.h,
        initialPage: 0,
        indicatorColor: MyColors.bluePrimary,
        indicatorBackgroundColor: MyColors.greyDark,
        autoPlayInterval: 4000,
        isLoop: true,
        children: images.map((url) {
          return Image.asset(
            url,
            fit: BoxFit.cover, // cover افضل من fill
            width: double.infinity,
            height: 250.h,
          );
        }).toList(),
      ),
    );
  }
}
