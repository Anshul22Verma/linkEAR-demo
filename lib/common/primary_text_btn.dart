import 'package:flutter/material.dart';
import 'package:linkear/constants/colors.dart';
import 'package:linkear/constants/dimens.dart';
import 'package:linkear/constants/styles.dart';

class NxTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;

  const NxTextButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.padding,
    this.margin,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? Dimens.edgeInsets0,
        margin: margin ?? Dimens.edgeInsets0,
        child: Text(
          label,
          style: labelStyle ??
              AppStyles.style16Bold.copyWith(
                color: ColorValues.primaryLightColor,
              ),
        ),
      ),
    );
  }
}
