
import 'package:e/core/styles/colors.dart';
import 'package:e/features/category/presentation/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/CategoryModel.dart';
import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  CategoryModel? categoryModel;

  CategoriesList({required this.categoryModel, super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.containerGray,
            border: Border(
              // set the border for only 3 sides
                top: BorderSide(
                    width: 2.w,
                    color: MyColors.bluePrimary.withOpacity(0.3)),
                left: BorderSide(
                    width: 2.w,
                    color: MyColors.bluePrimary.withOpacity(0.3)),
                bottom: BorderSide(
                    width: 2.w,
                    color: MyColors.bluePrimary.withOpacity(0.3))),
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
          ),

          // the categories items list
          child: ClipRRect(
            // clip the corners of the container that hold the list view
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: ListView.builder(
              itemCount: widget.categoryModel?.data?.length ?? 0,
              itemBuilder: (context, index) => CategoryItem(
                  index,
                  widget.categoryModel?.data?[index].category?.name ?? "",
                  selectedIndex == index,
                  onItemClick
              ),
            ),
          ),
        ));
  }

  // callback function to change the selected index
  void onItemClick(int index) {
    setState(() {
      selectedIndex = index;
      // BlocProvider.of<CategoryCubit>(context).getProduct(
      //     GetSubCategoriesEvent(widget.categoryModel?.data?[index].sId ?? ""));
    });
  }
}