import 'package:flutter/cupertino.dart';

class SliverIndicator extends StatelessWidget {
  const SliverIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
