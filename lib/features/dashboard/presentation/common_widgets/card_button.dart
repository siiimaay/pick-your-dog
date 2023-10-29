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
                  'assets/images/main_dog.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                  opacity: const AlwaysStoppedAnimation(0.85),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 5,
                child: Container(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff36454f).withOpacity(0.3),
                    ),
                    child: Text(
                      content,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
