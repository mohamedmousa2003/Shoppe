import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/commom/widget/home_app_bar.dart';
import '../../../core/constant/icon_assets.dart';
import '../../../core/styles/colors.dart';
import '../view_model/navigation_bar_cubit.dart';

class NavigationBarScreen extends StatelessWidget {
  static const String routeName = "NavigationBarScreen";

  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBarCubit(),
      child: const _NavigationBarView(),
    );
  }
}

class _NavigationBarView extends StatelessWidget {
  const _NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarCubit viewModel = context.read<NavigationBarCubit>();
    final List<_NavItem> navItems = [
      _NavItem( IconsSvg.homeSelected ,IconsSvg.homeUnSelected),
      _NavItem(IconsSvg.categorySelected ,IconsSvg.categoryUnSelected),
      _NavItem( IconsSvg.loveSelected, IconsSvg.loveUnSelected),
      _NavItem(IconsSvg.profileSelected ,IconsSvg.profileUnSelected),
    ];

    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeScreenAppBar(),
          body: viewModel.screens[viewModel.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: MyColors.white,
            onTap: viewModel.changeIndex,
            items: navItems.map((item) {
              return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  item.unSelected,
                ),
                activeIcon: SvgPicture.asset(
                  item.selected,
                  color: MyColors.bluePrimary,
                ),
                label: '',
              );
            }).toList(),
          ),

        );
      },
    );
  }
}

class _NavItem {
  final String unSelected;
  final String selected;
  const _NavItem(this.unSelected, this.selected);
}
