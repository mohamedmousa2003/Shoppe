import 'package:cached_network_image/cached_network_image.dart';
import 'package:e/features/home/data/models/ModelCategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/styles/styles.dart';


class CategoryGridView extends StatelessWidget {
  Data data;
  final VoidCallback onClick;
  CategoryGridView({super.key,required this.data,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onClick,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: 85.h,
                width: 100.w,
                fit: BoxFit.cover,
                imageUrl: data.image ?? "",
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              CustomSizedBox(height: 5),
              Text(
                data.name ??"",
                style: AppTextStyles.elMessIri20,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
    );
  }
}