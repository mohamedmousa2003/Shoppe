import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/styles/theme.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/register.dart';
import 'features/auth/presentation/pages/welcome_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.themeData,
          initialRoute: WelcomeScreenView.routeName,
          routes: {
            WelcomeScreenView.routeName:(context) => WelcomeScreenView(),
            Register.routeName:(context) => Register(),
            Login.routeName:(context) => Login(),
          },
        );
      },
    );
  }
}
