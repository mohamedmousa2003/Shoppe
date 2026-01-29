import 'package:e/core/constant/text.dart';
import 'package:e/features/auth/presentation/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/custom_text_form_field.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../Di/injectable.dart';
import '../../../navigation_bar_screen/view/navigation_bar_screen.dart';
import '../cubit/cubit/login_cubit.dart';
import '../cubit/state/login_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_or_signup.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/title_textfiel.dart';

class Login extends StatelessWidget {
  static const String routeName = "login";
  Login({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  LoginCubit viewModel = getIt<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            ImagePng.backgroundRegister,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          // Login Form
          BlocListener<LoginCubit, LoginState>(
            bloc: viewModel,



            listener: (context, state) {

              if (state is LoginLoading) {
                AppDialog.showLoading(context: context);
              }

              else if (state is LoginError) {
                AppDialog.hideLoading(context);
                AppDialog.showMessage(
                  context: context,
                  message: state.error,
                );
              }
              else if (state is LoginSuccess) {
                AppDialog.hideLoading(context);
                AppDialog.showSnackBar(context, "success Login");
                Navigator.pushReplacementNamed(
                  context,
                  NavigationBarScreen.routeName,
                );
              }
            },






            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 10.w,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomSizedBox(height: 50),
                          Text(goodToSee, style: AppTextStyles.elMessIri30),
                          const CustomSizedBox(height: 50),

                          // Email
                          TitleTextField(title: email),
                          CustomTextFormApp(
                            hintText: enterYourEmail,
                            prefixWidget: const Icon(CupertinoIcons.mail),
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                            validator: (email) => AppValidators.email(email),
                            controller: viewModel.emailController,
                          ),
                          const CustomSizedBox(),

                          // Password
                          TitleTextField(title: password),
                          CustomTextFormApp(
                            hintText: titleEnterNewPassword,
                            prefixWidget: const Icon(CupertinoIcons.lock),
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            validator: (password) =>
                                AppValidators.password(password),
                            controller: viewModel.passwordController,
                          ),
                          const CustomSizedBox(),

                          // Login Button
                          AuthButton(
                            text: login,
                            emailController: viewModel.emailController,
                            passwordController: viewModel.passwordController,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                viewModel.login();
                              }
                            },
                          ),
                          const CustomSizedBox(height: 50),

                          // Register Link
                          LoginOrSignUp(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Register.routeName,
                              );
                            },
                            startTitle: noHaveAccount,
                            endTitle: register,
                          ),
                        ],
                      ),
                    ),
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
