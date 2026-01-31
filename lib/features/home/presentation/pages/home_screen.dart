import 'package:e/core/constant/text.dart';
import 'package:e/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:e/Di/injectable.dart';
import 'package:e/features/home/presentation/pages/screen_view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/brands_gridview.dart';
import '../widgets/catergory_gridview.dart';
import '../widgets/container_title.dart';
import '../widgets/custom_sub_category.dart';
import '../widgets/slider_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadHomeData(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 30.h),
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
                      SliderImage(),
                      const CustomSizedBox(),

                      // Categories Section
                      ContainerTitle(onTap: () {}, title: categoriesText),
                      const CustomSizedBox(),
                      SizedBox(
                        height: 350.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.data?.length ?? 0,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemBuilder: (context, index) {
                            final category = state.categories.data![index];
                            return CategoryGridView(
                              data: category,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CustomSubCategory(
                                      categoryId: category.id!,
                                      categoryModel: category,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),

                      const CustomSizedBox(),

                      // Brands Section
                      ContainerTitle(
                        onTap: () {
                          Navigator.pushNamed(context, ScreenViewAll.routeName);
                        },
                        title: 'Brands',
                      ),
                      const CustomSizedBox(),
                      SizedBox(
                        height: 350.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 12,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemBuilder: (context, index) {
                            final brand = state.brands.data![index];
                            return BrandsGridview(data: brand, onClick: () {

                            });
                          },
                        ),
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
