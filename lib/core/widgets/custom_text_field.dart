import 'package:flutter/material.dart';
import 'package:task_app/core/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final double circular;
  TextEditingController? controller;
  AutovalidateMode? autovalidateMode;
  TextInputType? keyboardType;
  void Function()? onTap;

  CustomTextField({
    super.key,
    required this.hint,
    this.keyboardType,
    this.autovalidateMode,
    this.maxLines = 1,
    this.circular = 50,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autovalidateMode: autovalidateMode,
      scrollPhysics: const BouncingScrollPhysics(),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required.';
        }
        return null;
      },
      style: const TextStyle(
        fontSize: 18,
      ),
      maxLines: maxLines,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: .5),
          borderRadius: BorderRadius.circular(circular),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(circular),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(circular)),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: ColorsManager.whiteColor),
          borderRadius: BorderRadius.circular(circular),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(circular),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(circular),
        ),
      ),
    );
  }
}
