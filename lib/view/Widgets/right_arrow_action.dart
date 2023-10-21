import 'package:flutter/material.dart';

import '../../utils/color.dart';

class RightArrow extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const RightArrow(this.text, {super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(text),
            Icon(
              Icons.trending_flat,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
