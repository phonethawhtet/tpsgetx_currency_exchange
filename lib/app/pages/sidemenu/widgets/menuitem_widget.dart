import 'package:flutter/material.dart';

Widget SideMenuItem(
  String text, {
  Function()? onCallBack,
  IconData? icon,
  Function()? onPress,
}) {
  return InkWell(
      onTap: () => onPress?.call(),
      child: Container(
          color: Colors.transparent,
          //width: double.infinity,

          child: Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(icon),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.start,
                  ),
                ],
              ))));
}
