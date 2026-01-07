import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';


class AppDialog {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).canvasColor,
          content: Row(
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
             SizedBox(width:10.w),
              Text(
                message,
                style: AppTextStyles.textStyle24.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showMessage(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text(
                'ok',
                style: AppTextStyles.textStyle24.copyWith(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            )
          ],
          title: Icon(
            Icons.warning_amber,
            color: MyColors.red,
            size: 30.sp,
          ),
          content: Text(
            message,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textStyle18.copyWith(
              color: Theme.of(context).canvasColor,
            ),
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      width: 300.w,
      duration: const Duration(milliseconds: 300),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}