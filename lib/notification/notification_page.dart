import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(),
      body: ListView(
        children: const [
          Text('Hi  How are uh ')
        ],

      ),
    );
  }
}
