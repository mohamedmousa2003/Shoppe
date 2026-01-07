import 'package:e/core/constant/text.dart';
import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/catergory_gridview.dart';
import '../widgets/container_title.dart';
import '../widgets/slider_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w ,vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shop,style: AppTextStyles.elMessIri40,),
              CustomSizedBox(height: 10),
              SliderImage(),
              CustomSizedBox(),
              ContainerTitle(
                onTap: (){},
                title: categories,
              ),
              CustomSizedBox(),
              SizedBox(
                height: 350.h,
                child: CategoryGridView(),
              ),
              CustomSizedBox(),
              ContainerTitle(
                onTap: (){},
                title: categories,
              ),
              CustomSizedBox(),
              SizedBox(
                height: 350.h,
                child: CategoryGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
