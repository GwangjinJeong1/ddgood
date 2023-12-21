import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';

class HashTag extends StatelessWidget {
  const HashTag({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.primary,
          width: 1,
        ),
        color: AppColor.tertiery,
      ),
      child: Center(
        child: Text("# $content",
            style: hb24.copyWith(fontSize: 22, color: AppColor.primary)),
      ),
    );
  }
}
