import 'package:e/core/api/api_manager.dart';
import 'package:e/core/constant/text.dart';
import 'package:e/features/auth/data/data_sources/remote/auth_repo_data_source_impl.dart';
import 'package:e/features/auth/domain/use_cases/login_used_case.dart';
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
import '../../../navigation_bar_screen/view/navigation_bar_screen.dart';
import '../../data/repositories/auth_repo_impl.dart';
import '../cubit/cubit/login_cubit.dart';
import '../cubit/state/login_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_or_signup.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/title_textfiel.dart';

class Login extends StatelessWidget {
  static const String routeName = "login";
  Login({super.key});

  final emailController = TextEditingController(text: "mousa11111@gmail.com");
  final passwordController = TextEditingController(text: "Ahmed@123");
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginUseCase: LoginUsedCase(
          repoAuth: AuthRepoImpl(AuthRepoDataSourceImpl(ApiManager())),
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Image.asset(
              ImagePng.backgroundRegister,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            // Login Form
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  AppDialog.showLoading(
                    context: context,
                    message: "Loading!!!!",
                  );
                }
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(
                    context,
                    NavigationBarScreen.routeName,
                  );
                  AppDialog.showSnackBar(context, "success Login ");
                } else if (state is LoginError) {
                  AppDialog.showMessage(context: context, message: state.error);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
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
                                validator: (email) =>
                                    AppValidators.email(email),
                                controller: emailController,
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
                                controller: passwordController,
                              ),
                              const CustomSizedBox(),

                              // Login Button
                              AuthButton(
                                text: login,
                                emailController: emailController,
                                passwordController: passwordController,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<LoginCubit>().login(
                                      emailController.text,
                                      passwordController.text,
                                    );
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
