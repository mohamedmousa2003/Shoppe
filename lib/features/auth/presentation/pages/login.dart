import 'package:e/core/constant/text.dart';
import 'package:e/features/auth/presentation/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/custom_text_form_field.dart';

import '../../../../core/constant/images_assets.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/app_validators.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_or_signup.dart';
import '../widgets/size_box.dart';
import '../widgets/title_textfiel.dart';

class Login extends StatelessWidget {
  static const String routeName =" login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
            Text(goodToSee, style: AppTextStyles.elMessIri25),
            const CustomSizedBox(height: 50),
            // Email
              TitleTextField(title: email),
              CustomTextFormApp(
                hintText: enterYourEmail,
                prefixWidget: const Icon(CupertinoIcons.mail),
                keyboardtype: TextInputType.emailAddress,
                isObscureText: false,
                validator: (email) => AppValidators.email(email),
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
                validator: (password) => AppValidators.password(password),
                controller: null,
              ),
              const CustomSizedBox(),
            //  AuthButton(
            //   text: login,
            //   emailController: "fffffffffff",
            //   passwordController: "ffffffffffffff",
            //   onPressed: (){
            //     if (formKey.currentState!.validate()) {
            //
            //     }
            //   },
            //
            // ),
              const CustomSizedBox(),


              const CustomSizedBox(height: 50),
              // Have Account
              LoginOrSignUp(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Register.routeName);
                },
                startTitle: noHaveAccount,
                endTitle: register,
              ),
              const CustomSizedBox(),

            ],
          ),
      )],
      ),
    );
  }
}
