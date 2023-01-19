import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class RaisedButtonCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;
  final Color borderColor;
  RaisedButtonCustomWidget(
      {required this.icon,
      required this.text,
      required this.onPressed,
      this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        this.icon,
        color: Colors.white,
      ),
    );
  }
}
