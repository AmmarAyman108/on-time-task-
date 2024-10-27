import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final IconData? leadingIcon;
  const CustomAppBar({
    super.key,
    this.leadingIcon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        leadingIcon,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        title ?? '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
          color: Colors.white,
        ),
      ),
    ]);
  }
}
