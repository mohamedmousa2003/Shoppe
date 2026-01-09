import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';


class LoginOrSignUp extends StatelessWidget {
  String startTitle;
  String endTitle;
  final VoidCallback onPressed;

  LoginOrSignUp({
    super.key,
    required this.onPressed,
    required this.endTitle,
    required this.startTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startTitle,
          style: AppTextStyles.textStyle18.copyWith(
            color: MyColors.black
          )
        ),
        SizedBox(width: 6.w,),
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap:onPressed,
          child: Text(
            endTitle,
            style: AppTextStyles.textStyle20.copyWith(
              color: MyColors.bluePrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}