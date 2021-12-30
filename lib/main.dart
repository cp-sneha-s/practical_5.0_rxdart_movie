import 'package:flutter/material.dart';
import 'package:rxdart_example/screens/movie_list.dart';
import 'package:rxdart_example/service_locator.dart';

void main() {
  setUpLocator();
  runApp( MaterialApp(
    theme: ThemeData.light(),
      home: HomeScreen()));
}

