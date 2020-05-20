import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: 'Flutter ',
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.blue
      ),
      children: <TextSpan>[
        TextSpan(
            text: 'Authentication',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red
            )
        ),
      ],
    ),
  );
}
