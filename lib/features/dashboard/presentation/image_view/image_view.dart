import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final List<Widget> children;

  const ImageView({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment:
          children.length > 1 ? WrapAlignment.center : WrapAlignment.start,
      children: children,
    );
  }
}
