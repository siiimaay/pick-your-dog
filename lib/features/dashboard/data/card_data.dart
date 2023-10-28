import 'package:flutter/material.dart';

class CardData {
  final String content;
  final void Function(BuildContext) onPressed;

  CardData({
    required this.content,
    required this.onPressed,
  });
}
