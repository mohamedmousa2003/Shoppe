import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/images_assets.dart';
import '../../styles/colors.dart';
import '../../styles/styles.dart';

class CustomTextFormApp extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final bool isPassword;
  final bool isPhone;
  final bool isSearch;

  final TextInputType keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;

  const CustomTextFormApp({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.isPhone = false,
    this.isSearch = false,
    this.keyboardType = TextInputType.text,
    this.contentPadding,
    this.prefixWidget,
  });

  @override
  State<CustomTextFormApp> createState() => _CustomTextFormAppState();
}

class _CustomTextFormAppState extends State<CustomTextFormApp> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      style: AppTextStyles.elMessIri20,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.greyLighter,
        hintText: widget.hintText,
        hintStyle: AppTextStyles.elMessIri18,
        errorStyle: AppTextStyles.elMessIri16.copyWith(color: MyColors.red),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),

        prefixIcon: _buildPrefixIcon(),
        suffixIcon: widget.isPassword ? _buildEyeIcon() : null,

        enabledBorder: _outlineBorder(MyColors.greyDark),
        focusedBorder: _outlineBorder(MyColors.bluePrimary, width: 2.5),
        errorBorder: _outlineBorder(MyColors.red),
      ),
    );
  }

  /// ===================== Helpers =====================

  OutlineInputBorder _outlineBorder(Color color, {double width = 1.5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: color, width: width.w),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixWidget != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: widget.prefixWidget,
      );
    }

    if (widget.isPhone) {
      return const ContainerFlagWidget();
    }

    if (widget.isSearch) {
      return IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/icon-search.svg',
          width: 26.w,
          height: 26.h,
        ),
      );
    }

    return null;
  }

  Widget _buildEyeIcon() {
    return InkWell(
      onTap: () => setState(() => _obscureText = !_obscureText),
      child: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        size: 23.sp,
        color: MyColors.black,
      ),
    );
  }
}

/// ===================== Phone Prefix =====================

class ContainerFlagWidget extends StatelessWidget {
  const ContainerFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: 4.0.h),
            child: Image.asset(
              ImagePng.egypt,
              width: 25.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            '+2',
            style: AppTextStyles.elMessIri20,
          ),
        ],
      ),
    );
  }
}
