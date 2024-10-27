import 'package:flutter/material.dart';

class CustomDismissibleWidget extends StatelessWidget {
  final Function(DismissDirection)? onDismissed;
  final Widget child;
  const CustomDismissibleWidget({
    super.key,
    required this.child,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        onDismissed: onDismissed,
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 17, 0),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: child);
  }
}
