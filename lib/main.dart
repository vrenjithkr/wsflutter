import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'MessageScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/chat',
      routes: {
        '/chat': (context) => ChatScreen('123'),
        '/messages': (context) => MessageScreen(),
      },
    );
  }
}
