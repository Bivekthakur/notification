import 'package:flutter/material.dart';
import 'package:notification/login/login_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: ListView(
        children: const [Center(child: Text('Hi  How are uh '))],
      ),
    );
  }
}
