import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/colors.dart';

class CustomTextFormApp extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final bool showObscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType keyboardtype;
  final Widget? prefixWidget; // ✅ أي Widget ممكن تحطه هنا

  const CustomTextFormApp({
    Key? key,
    required this.hintText,
    this.isObscureText = false,
    this.showObscureText = false,
    this.validator,
    this.controller,
    this.contentPadding,
    this.keyboardtype = TextInputType.text,
    this.prefixWidget,
  }) : super(key: key);

  @override
  State<CustomTextFormApp> createState() => _CustomTextFormAppState();
}

class _CustomTextFormAppState extends State<CustomTextFormApp> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      keyboardType: widget.keyboardtype,
      style: AppTextStyles.elMessIri20,
      decoration: InputDecoration(
        fillColor: MyColors.greyLighter,
        filled: true,
        contentPadding:
        widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.elMessIri18,
        errorStyle: AppTextStyles.elMessIri16,
        errorMaxLines: 1,

        prefixIcon: widget.prefixWidget != null
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: widget.prefixWidget,
        )
            : null,

        // Eye toggle للـ password
        suffixIcon: widget.showObscureText ? _eyeIcon() : null,

        enabledBorder: _customOutLineInputBorder(color: MyColors.greyDark),
        errorBorder: _customOutLineInputBorder(color: MyColors.red),
        focusedBorder: _customOutLineInputBorder(color: MyColors.bluePrimary, width: 2.5),
      ),
    );
  }

  OutlineInputBorder _customOutLineInputBorder({required Color color, double width = 1.5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: color, width: width.w),
    );
  }

  Widget _eyeIcon() {
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

class ContainerFlagWidget extends StatelessWidget {
  const ContainerFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 85.w,
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        children: [
          Image.asset(
            'assets/image/Egypt.png',
            width: 25.w,
            height: 25.h,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 5.w),
          Text('+20', style: TextStyle(fontSize: 20.sp)),
        ],
      ),
    );
  }
}


