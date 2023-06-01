import 'package:Flutter_GPT/screens/ChatScreen.dart';
import 'package:flutter/material.dart';

import 'consts/global_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter 3.0.4 ',
      theme: ThemeData(
        scaffoldBackgroundColor: gptColor,
        primaryColor: lightCardColor,
        backgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: gptColor,
          ),
          backgroundColor: lightGptColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: gptColor, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: gptColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,
        ),
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: gptColor,
              brightness: Brightness.light,
            ),
      ),
      home: const ChatScreen(),
      // home: const HomeScreen(),
    );
  }
}
