import 'package:flutter/material.dart';
import 'package:planet_app/screens/detail_page.dart';

import 'screens/Homepage.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Homepage(),
      "detail_page": (context) => Details_page(),
    },
  ));
}
