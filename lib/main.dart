import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/shared_preferences.dart';
import 'core/network/check_internet_connection.dart';
import 'core/observer/observer.dart';
import 'core/styles/theme.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/register.dart';
import 'features/auth/presentation/pages/welcome_screen_view.dart';
import 'features/cart/presentation/pages/cart_view.dart';
import 'features/category/presentation/pages/category_screen.dart';
import 'features/category/presentation/pages/product_details.dart';
import 'features/home/presentation/pages/screen_view_all.dart';
import 'features/navigation_bar_screen/view/navigation_bar_screen.dart';
import 'Di/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  final String? token = CacheHelper.getData<String>('token');
  await NetworkUtils.isConnected();
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.themeData,
          initialRoute:
          token == null ? Login.routeName : NavigationBarScreen.routeName,
          routes: {
            NavigationBarScreen.routeName: (_) => NavigationBarScreen(),
            WelcomeScreenView.routeName: (_) =>
            const WelcomeScreenView(),
            Register.routeName: (_) =>  Register(),
            ScreenViewAll.routeName: (_) =>  ScreenViewAll(),
            Login.routeName: (_) =>  Login(),
            CategoryScreen.routeName: (_) =>  CategoryScreen(),
            ProductDetails.routeName: (_) =>  ProductDetails(),
            CartView.routeName: (_) =>  CartView(),
          },
        );
      },
    );
  }
}
