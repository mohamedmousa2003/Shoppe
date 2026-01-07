import 'package:e/core/commom/widget/custom_button.dart';
import 'package:e/core/styles/colors.dart';
import 'package:e/core/styles/styles.dart';
import 'package:e/features/auth/presentation/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/images_assets.dart';
import '../../../../core/constant/text.dart';
import 'login.dart';

class WelcomeScreenView extends StatelessWidget {
  static const String routeName = "WelcomeScreenView";
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Spacer(flex: 2),

              // Logo SVG
              SvgPicture.asset(
                ImagesSvg.logo,
                width: 200.w,
                height: 200.h,
                fit: BoxFit.cover,
              ),

              // App Name
              Text(shoppe, style: AppTextStyles.raleWay48),

              SizedBox(height: 12.h),

              // Subtitle / description
              Text(
                title,
                style: AppTextStyles.nuNiToSans19.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),

              Spacer(flex: 1),

              // Login
              CustomButton(
                text: login,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Login.routeName);
                },
              ),

              SizedBox(height: 30.h),

              // Register
              CustomButton(
                text: register,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Register.routeName);
                },
                backgroundColor: MyColors.greyLighter,
                textColor: MyColors.black,
              ),

              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
