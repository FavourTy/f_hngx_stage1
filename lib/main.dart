import 'package:flutter/material.dart';
import 'package:task_one/slack_page.dart';

void main() {
  runApp( MaterialApp(
    home: SlackPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true
    ),
  ));
}

