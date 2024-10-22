import 'package:flutter/material.dart';

class RightPageView extends StatelessWidget {
  const RightPageView({
    super.key,
    required this.flex,
  });

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
