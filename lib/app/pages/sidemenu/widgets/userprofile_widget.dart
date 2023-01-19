import 'package:flutter/material.dart';

Widget userprofileRectangle(
    {profileSize = 30.0, isLogin = false, String name = ""}) {
  return Padding(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: profileSize,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.grey,
                size: profileSize * 2 - 10,
              ),
            ),
            SizedBox(width: 10),
            if (isLogin)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Name',
                  ),
                  SizedBox(height: 3),
                  Text(
                    name,
                  ),
                ],
              ),
            if (!isLogin) ElevatedButton(child: Text("Login"), onPressed: () {}),
            SizedBox(height: 5)
          ]));
}
