import 'package:flutter/material.dart';

//Light theme
Color lightScaffoldColor = const Color(0xFFF8F8F8);
Color lightCardColor = const Color(0xFFFfFFFf); //F0FFFF
Color lightBackgroundColor = const Color(0xFFD0E8F2);

Color gptColor = const Color.fromRGBO(52, 53, 65, 1);
Color lightGptColor = const Color.fromRGBO(68, 70, 84, 1);

final Conversations = [
  {
    'msg': "What is full stack dev ?",
    "chatIndex": 0,
  },
  {
    'msg':
        "Flutter is a framework nadi Flutter is a framework nadiFlutter is a framework nadiFlutter is a framework nadi Fullstakck is like anwar flutter for mobile laravel Api datascience ML Ai Big data models integration,      ",
    "chatIndex": 1,
  },
  {
    'msg': "What is Flutter ?",
    "chatIndex": 0,
  },
  {
    'msg':
        "Flutter is a framework nadi Flutter is a framework nadiFlutter is a framework nadiFlutter is a framework nadi",
    "chatIndex": 1,
  },
];

List<String> models = [
  "modal1",
  "modal2",
  "modal3",
];

List<DropdownMenuItem<String>> items = models
    .map((model) => DropdownMenuItem<String>(value: model, child: Text(model)))
    .toList();
