import 'package:e/core/styles/colors.dart';
import 'package:e/core/styles/styles.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:e/features/home/presentation/bloc/state/get_sub_categories_state.dart';
import 'package:e/Di/injectable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/constant/text.dart';
import '../bloc/cubit/get_sub_categories_cubit.dart';

class CustomSubCategory extends StatelessWidget {
  Data categoryModel;
  final String categoryId;

  CustomSubCategory(
      {super.key, required this.categoryModel, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<GetSubCategoriesCubit>()
        ..getCategories(categoryId),
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(CupertinoIcons.back),
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: MyColors.white,
          iconTheme:IconThemeData(
            color: MyColors.bluePrimary,
            size: 30,
          ) ,
        ),
        body: BlocBuilder<GetSubCategoriesCubit, GetSubCategoriesState>(
              builder: (context, state) {
                if (state is GetSubCategoriesLoading) {
                  return Center(child: Image.asset(
                    AnimationGif.loading,
                    height: 400.h,
                    width: 400.w,
                  ));
                }

                if (state is GetSubCategoriesError) {
                  return Center(child: Text(state.message));
                }

                if (state is GetSubCategoriesSuccess) {
                  final subCategories = state.products.data;
                  if(subCategories!.isEmpty){
                    return  Center(
                        child: Text(noCategoriesFound,style: AppTextStyles.elMessIri40.copyWith(
                          color: MyColors.bluePrimary
                        ),));
                  }

                  return ListView.builder(
                    itemCount: subCategories.length,
                    itemBuilder: (context, index) {
                      final sub = subCategories[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                        elevation: 5,
                        color: MyColors.greyLighter,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(15.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    sub.slug ?? "-",
                                    style: AppTextStyles.raleWay20,
                                  ),
                                  Spacer(),
                                  Icon(CupertinoIcons.forward,color:MyColors.bluePrimary,size: 30,),
                                ],
                              ),


                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Created: ${sub.createdAt != null ? DateTime.parse(sub.createdAt!).toLocal().toString().split(' ')[0] : "-"}",
                              //       style: AppTextStyles.elMessIri18,
                              //     ),
                              //     Text(
                              //       "Updated: ${sub.updatedAt != null ? DateTime.parse(sub.updatedAt!).toLocal().toString().split(' ')[0] : "-"}",
                              //       style: AppTextStyles.elMessIri18,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  );

                }

                return const SizedBox.shrink(); // fallback
              },
            )

      ),
    );
  }
}
