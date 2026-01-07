import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomSizedBox extends StatelessWidget {
  final int height;
  const  CustomSizedBox({super.key ,this.height =25});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
