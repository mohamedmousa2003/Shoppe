import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Di/injectable.dart';
import '../bloc/cubit/home_cubit.dart';
import '../widgets/brands_gridview.dart';

class ScreenViewAll extends StatelessWidget {
  static const String routeName = "viewAll";
  const ScreenViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadHomeData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Brands"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.h),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is HomeError) {
                return Center(child: Text(state.message));
              }

              if (state is HomeLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      GridView.builder(
                        shrinkWrap: true, // يخلي الGridView ياخد height حسب المحتوى
                        physics: NeverScrollableScrollPhysics(), // scroll عالي فوق فقط
                        itemCount: state.brands.data?.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final brand = state.brands.data![index];
                          return BrandsGridview(
                            data: brand,
                            onClick: () {},
                          );
                        },
                      ),
                    ],
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
