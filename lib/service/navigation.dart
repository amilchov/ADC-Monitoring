import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Navigation {
  static void primitiveNavigation(BuildContext context, Widget route) {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => route));
  }

  static void returnRoute(BuildContext context) {
    Navigator.pop(context);
  }
}