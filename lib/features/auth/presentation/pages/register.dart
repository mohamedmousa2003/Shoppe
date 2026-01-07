import 'package:e/core/constant/text.dart';
import 'package:e/core/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commom/widget/custom_text_form_field.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/utils/app_validators.dart';
import '../widgets/login_or_signup.dart';
import '../widgets/size_box.dart';
import '../widgets/title_textfiel.dart';
import 'login.dart';

class Register extends StatelessWidget {
  static const String routeName = "register";
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImagePng.backgroundRegister,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(createAccount, style: AppTextStyles.elMessIri25),
                const CustomSizedBox(height: 50),
                // Name
                TitleTextField(title: fullName),
                CustomTextFormApp(
                  hintText: fullName,
                  prefixWidget: const Icon(CupertinoIcons.person),
                  keyboardtype: TextInputType.name,
                  isObscureText: false,
                  validator: (value) => AppValidators.name(value),
                  controller: null,
                ),
                const CustomSizedBox(),

                // Email
                TitleTextField(title: email),
                CustomTextFormApp(
                  hintText: enterYourEmail,
                  prefixWidget: const Icon(CupertinoIcons.mail),
                  keyboardtype: TextInputType.emailAddress,
                  isObscureText: false,
                  validator: (value) => AppValidators.email(value),
                  controller: null,
                ),
                const CustomSizedBox(),

                // Password
                TitleTextField(title: password),
                CustomTextFormApp(
                  hintText: titleEnterNewPassword,
                  prefixWidget: const Icon(CupertinoIcons.lock),
                  keyboardtype: TextInputType.visiblePassword,
                  isObscureText: true,
                  showObscureText: true,
                  validator: (value) => AppValidators.password(value),
                  controller: null,
                ),
                const CustomSizedBox(),

                // Confirm Password
                TitleTextField(title: confirmation),
                CustomTextFormApp(
                  hintText: confirmPassword,
                  prefixWidget: const Icon(CupertinoIcons.lock),
                  keyboardtype: TextInputType.visiblePassword,
                  isObscureText: true,
                  showObscureText: true,
                  validator: (value) => AppValidators.confirmPassword(value, "dddddddd"),
                  controller: null,
                ),
                const CustomSizedBox(height: 50),
                // Have Account
                LoginOrSignUp(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Login.routeName);
                  },
                  startTitle: haveAccount,
                  endTitle: login,
                ),
                const CustomSizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
