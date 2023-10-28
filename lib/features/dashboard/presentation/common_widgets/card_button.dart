import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String content;
  final void Function(BuildContext) onPressed;

  const CardButton({
    super.key,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPressed(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 3,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/dog_main.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                  opacity: const AlwaysStoppedAnimation(0.85),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    content,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
