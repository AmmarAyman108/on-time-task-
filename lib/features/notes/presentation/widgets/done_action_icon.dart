import 'package:flutter/material.dart';

class DoneIActionIcon extends StatelessWidget {
  const DoneIActionIcon({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withOpacity(.05)),
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: onPressed,
        icon: const Icon(
          Icons.done,
          size: 30,
        ),
      ),
    );
  }
}
