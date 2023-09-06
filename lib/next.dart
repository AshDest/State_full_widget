import 'package:flutter/material.dart';

class Next extends StatefulWidget{
  final color;
  Next({required this.color});
  @override
  NextState createState() => NextState();
}

class NextState extends State<Next>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: const Text('That is my Next Page'),
      ),
    );
  }
}