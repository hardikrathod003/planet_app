import 'package:flutter/material.dart';
import 'package:planet_app/detail_page.dart';

import 'Homepage.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Homepage(),
      "detail_page": (context) => Details_page(),
    },
  ));
}
