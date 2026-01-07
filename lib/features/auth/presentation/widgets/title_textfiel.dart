import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
class TitleTextField extends StatelessWidget {
  TitleTextField({required this.title, super.key});
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.elMessIri20,
          ),
          SizedBox(height:10.h),
        ],
      ),
    );
  }
}