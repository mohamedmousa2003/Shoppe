import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/shared_preferences.dart';
import 'core/observer/observer.dart';
import 'core/styles/theme.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/register.dart';
import 'features/auth/presentation/pages/welcome_screen_view.dart';
import 'features/navigation_bar_screen/view/navigation_bar_screen.dart';
import 'injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  final String? token = CacheHelper.getData<String>('token');
  configureDependencies();
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.themeData,
          initialRoute:
          token == null ? Login.routeName : NavigationBarScreen.routeName,
          routes: {
            NavigationBarScreen.routeName: (_) =>
            const NavigationBarScreen(),
            WelcomeScreenView.routeName: (_) =>
            const WelcomeScreenView(),
            Register.routeName: (_) =>  Register(),
            Login.routeName: (_) =>  Login(),
          },
        );
      },
    );
  }
}
