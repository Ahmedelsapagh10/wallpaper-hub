import 'package:flutter/material.dart';
import 'package:pexels/view/pages/homeScreen.dart';

AppBar appBartitle(BuildContext context) {
  return AppBar(
      foregroundColor: Colors.black,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => HomeScreen())));
        },
        child: Text.rich(TextSpan(children: [
          const TextSpan(
              text: 'Wallpaper',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Hub',
              style: TextStyle(
                  color: Colors.blue[700], fontWeight: FontWeight.bold)),
        ])),
      ));
}
