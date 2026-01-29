import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../../../../core/styles/styles.dart';
import '../../data/models/ModelCategories.dart';

class BrandsGridview extends StatelessWidget {
  final Data data;
  final VoidCallback onClick;

  const BrandsGridview({
    super.key,
    required this.data,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          CachedNetworkImage(
            height: 150.h,
            width: 150.w,
            imageUrl: data.image ?? '',
            placeholder: (_, __) =>
            const CircularProgressIndicator(),
            errorWidget: (_, __, ___) =>
            const Icon(Icons.error),
            imageBuilder: (_, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
