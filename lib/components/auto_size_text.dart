import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

autoTextSize(String label,{ TextStyle? textStyle,TextAlign? textAlign = TextAlign.center}) => AutoSizeText(
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  minFontSize: 8,
  maxFontSize: 30,
  textAlign: textAlign,
  label,
  style: textStyle,
);