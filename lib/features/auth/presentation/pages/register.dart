import 'package:e/core/constant/text.dart';
import 'package:e/core/styles/styles.dart';
import 'package:e/features/auth/presentation/cubit/cubit/register_cubit.dart';
import 'package:e/features/auth/presentation/cubit/state/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/custom_text_form_field.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../Di/injectable.dart';
import '../../../navigation_bar_screen/view/navigation_bar_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_or_signup.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/title_textfiel.dart';
import 'login.dart';

class Register extends StatelessWidget {
  static const String routeName = "register";

  Register({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  RegisterCubit viewModel = getIt<RegisterCubit>();
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
          // BlocListener for RegisterCubit
          BlocListener<RegisterCubit, RegisterState>(
            bloc: viewModel,
            listener: (context, state) {
              if (state is RegisterLoading) {
                AppDialog.showLoading(
                  context: context,
                );
              }

              else if (state is RegisterSuccess) {
                AppDialog.showSnackBar(context, "Success Register");
                AppDialog.hideLoading(context);
                Navigator.pushReplacementNamed(
                  context,
                  NavigationBarScreen.routeName,
                );

              }

              else if (state is RegisterError) {
                AppDialog.hideLoading(context);
                AppDialog.showMessage(
                  context: context,
                  message: state.error,
                );
              }

            },
            // The child of BlocListener is your actual UI
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSizedBox(height: 50),
                      Text(createAccount, style: AppTextStyles.elMessIri30),
                      const CustomSizedBox(height: 30),

                      // Name
                      TitleTextField(title: fullName),
                      CustomTextFormApp(
                        hintText: fullName,
                        prefixWidget: const Icon(CupertinoIcons.person),
                        keyboardType: TextInputType.name,
                        isPassword: false,
                        validator: (value) => AppValidators.name(value),
                        controller: viewModel.nameController,
                      ),
                      const CustomSizedBox(),

                      // Email
                      TitleTextField(title: email),
                      CustomTextFormApp(
                        hintText: enterYourEmail,
                        prefixWidget: const Icon(CupertinoIcons.mail),
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        validator: (value) => AppValidators.email(value),
                        controller: viewModel.emailController,
                      ),
                      const CustomSizedBox(),

                      // Phone
                      TitleTextField(title: phone),
                      CustomTextFormApp(
                        hintText: enterYourPhone,
                        isPhone: true,
                        keyboardType: TextInputType.phone,
                        isPassword: false,
                        validator: (value) => AppValidators.phone(value),
                        controller: viewModel.phoneController,
                      ),
                      const CustomSizedBox(),

                      // Password
                      TitleTextField(title: password),
                      CustomTextFormApp(
                        hintText: titleEnterNewPassword,
                        prefixWidget: const Icon(CupertinoIcons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        validator: (value) => AppValidators.password(value),
                        controller: viewModel.passwordController,
                      ),
                      const CustomSizedBox(),

                      // Confirm Password
                      TitleTextField(title: confirmation),
                      CustomTextFormApp(
                        hintText: confirmPassword,
                        prefixWidget: const Icon(CupertinoIcons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        validator: (value) => AppValidators.confirmPassword(
                          value,
                          viewModel.passwordController.text,
                        ),
                        controller: viewModel.rePasswordController,
                      ),
                      const CustomSizedBox(height: 50),

                      // Register Button
                      AuthButton(
                        text: register,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            viewModel.register();
                          }
                        },
                        emailController: viewModel.emailController,
                        passwordController: viewModel.emailController,
                      ),
                      const CustomSizedBox(height: 50),

                      // Already have account
                      LoginOrSignUp(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Login.routeName,
                          );
                        },
                        startTitle: haveAccount,
                        endTitle: login,
                      ),
                      const CustomSizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
