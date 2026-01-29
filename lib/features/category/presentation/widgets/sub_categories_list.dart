// import 'package:e/core/styles/styles.dart';
// import 'package:flutter/material.dart';
//
// import '../../data/models/CategoryModel.dart';
// import 'category_card_item.dart';
// import 'sub_category_item.dart';
//
// class SubCategoriesList extends StatelessWidget {
//   CategoryModel? subCategories;
//
//   SubCategoriesList({required this.subCategories, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 2,
//       child: CustomScrollView(
//         slivers: <Widget>[
//           // category title
//           SliverToBoxAdapter(
//             child: Text(
//               'Laptops & Electronics',
//               style: AppTextStyles.textStyle14
//             ),
//           ),
//           // the category card
//           SliverToBoxAdapter(
//             child: CategoryCardItem("Laptops & Electronics",
//                 ImageAssets.categoryCardImage, goToCategoryProductsListScreen),
//           ),
//           // the grid view of the subcategories
//           SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                 childCount: subCategories?.data?.length ?? 0,
//                     (context, index) => InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, Routes.productsScreenRoute,
//                         arguments: subCategories?.data?[index].catId);
//                   },
//                   child: SubCategoryItem(
//                     subCategories?.data?[index].name?.split(" ").first ?? "",
//                     ImageAssets.subcategoryCardImage,
//                   ),
//                 ),
//               ),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.75,
//                 mainAxisSpacing: AppSize.s8,
//                 crossAxisSpacing: AppSize.s8,
//               ))
//         ],
//       ),
//     );
//   }
//
//   goToCategoryProductsListScreen() {}
// }