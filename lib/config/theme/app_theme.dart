import 'package:flutter/material.dart';
import 'package:task_app/core/colors.dart';

abstract class AppTheme {
  static ThemeData get getTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorsManager.primaryColor,
      );
}
