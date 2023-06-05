import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(title),
        ),
      ),
      body: Center(
        child: Text('Welcome to $title'),
      ),
    );
  }
}
