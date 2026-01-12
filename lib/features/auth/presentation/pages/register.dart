import 'package:e/core/constant/text.dart';
import 'package:e/core/styles/styles.dart';
import 'package:e/features/auth/domain/use_cases/register_use_case.dart';
import 'package:e/features/auth/presentation/cubit/cubit/register_cubit.dart';
import 'package:e/features/auth/presentation/cubit/state/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/commom/widget/custom_text_form_field.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../injectable.dart';
import '../../../navigation_bar_screen/view/navigation_bar_screen.dart';
import '../../data/data_sources/remote/auth_repo_data_source_impl.dart';
import '../../data/repositories/auth_repo_impl.dart';
import '../../domain/entities/register_entity.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_or_signup.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/title_textfiel.dart';
import 'login.dart';

class Register extends StatelessWidget {
  static const String routeName = "register";

  Register({super.key});
  final emailController = TextEditingController(
    text: "mousa2003mohamed@gmail.com",
  );
  final nameController = TextEditingController(text: "mohamed mousa");
  final passwordController = TextEditingController(text: "mousa123456789");
  final rePasswordController = TextEditingController(text: "mousa123456789");
  final phoneController = TextEditingController(text: "01285947399");
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),

      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              ImagePng.backgroundRegister,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  AppDialog.showLoading(
                    context: context,
                    message: "Loading!!!!",
                  );
                }
                if (state is RegisterSuccess) {
                  Navigator.pushReplacementNamed(
                    context,
                    NavigationBarScreen.routeName,
                  );
                  AppDialog.showSnackBar(context, "success Login ");
                } else if (state is RegisterError) {
                  print("=========================================");
                  print(state.error);
                  print("=========================================");
                  AppDialog.showMessage(context: context, message: state.error);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 10.w,
                    ),
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
                            controller: nameController,
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
                            controller: emailController,
                          ),
                          const CustomSizedBox(),

                          // phone
                          TitleTextField(title: phone),
                          CustomTextFormApp(
                            hintText: enterYourPhone,
                            isPhone: true,
                            keyboardType: TextInputType.phone,
                            isPassword: false,
                            validator: (value) => AppValidators.phone(value),
                            controller: phoneController,
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
                            controller: passwordController,
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
                              passwordController.text,
                            ),
                            controller: rePasswordController,
                          ),
                          const CustomSizedBox(height: 50),
                          const CustomSizedBox(),

                          // Login Button
                          AuthButton(
                            text: login,
                            emailController: emailController,
                            passwordController: passwordController,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<RegisterCubit>().register(
                                  RegisterEntity(
                                    password: passwordController.text,
                                    email: emailController.text,
                                    rePassword: rePasswordController.text,
                                    fullName: nameController.text,
                                    phone: phoneController.text,
                                  ),
                                );
                              }
                            },
                          ),
                          const CustomSizedBox(height: 50),

                          // Have Account
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
