import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Widget? suffixIcon;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final Size? buttonSize;
  final Color? textColor;

  const SubmitButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.color,
    this.suffixIcon,
    this.padding,
    this.borderColor,
    this.buttonSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: buttonSize ?? const Size(120, 45),
          backgroundColor: color,
          side:
              BorderSide(color: borderColor ?? Colors.transparent, width: 0.5)),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(buttonText,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: textColor ?? Colors.white,
                  )),
            ),
          ),
          const SizedBox(width: 5),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
