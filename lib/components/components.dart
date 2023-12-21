import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';

class HashTag extends StatelessWidget {
  const HashTag(
      {super.key,
      required this.content,
      this.width = 167,
      this.height = 44,
      this.fontSize = 22});

  final String content;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.primary,
          width: 1,
        ),
        color: AppColor.neutral2,
      ),
      child: Center(
        child: Text("# $content",
            style: hb24.copyWith(fontSize: fontSize, color: AppColor.primary)),
      ),
    );
  }
}
