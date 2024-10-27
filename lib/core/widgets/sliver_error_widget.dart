
import 'package:flutter/material.dart';

class SliverErrorWidget extends StatelessWidget {
  final String errorMessage ;

  const SliverErrorWidget({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(errorMessage),
      ),
    );
  }
}