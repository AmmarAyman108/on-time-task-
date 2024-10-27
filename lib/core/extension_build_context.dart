import 'package:flutter/material.dart';
import 'package:task_app/core/colors.dart';

extension ExtensionContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  showBottomSheet({required Widget child, bool isScrollControlled = false}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      sheetAnimationStyle: AnimationStyle(
        reverseCurve: Curves.bounceIn,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 500),
      ),
      backgroundColor: ColorsManager.darkBlueColor,
      context: this,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // Adjust for keyboard height
        ),
        child: child,
      ),
    );
  }
}
