import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../category/presentation/pages/category_screen.dart';
import '../../home/presentation/pages/home_screen.dart';
import '../../love/presentation/pages/love_screen.dart';
import '../../profile/presentation/pages/profile_screen.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    ProductList(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    emit(NavigationBarInitial());
    currentIndex = index;
    emit(NavigationBarChangeIndexState());
  }
}