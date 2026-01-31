import 'package:flutter/material.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';

class ContainerTitle extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const ContainerTitle({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.elMessIri20,
          ),
          Spacer(),
          Text(
            viewAll,
            style: AppTextStyles.elMessIri20.copyWith(
              color: MyColors.bluePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
