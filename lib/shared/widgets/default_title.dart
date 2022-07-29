import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class DefaultTitle extends StatelessWidget {
  const DefaultTitle(
    this.text, {
    Key? key,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.w600,
    this.size = 16,
    this.leftPadding = 16,
  }) : super(key: key);
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final double leftPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: DefaultText(
        text,
        fontWeight: fontWeight,
        size: size,
        color: color,
      ),
    );
  }
}
