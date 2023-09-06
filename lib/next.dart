import 'package:flutter/material.dart';

class Next extends StatefulWidget{
  final color;
  Next({required this.color});
  @override
  NextState createState() => NextState();
}

class NextState extends State<Next>{
  bool showApp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (showApp)? AppBar(
        title: const Text('New Page'),
        backgroundColor: widget.color,
      ): null,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState(() {
                  showApp = !showApp;
                });
              },
              child: const Text('Toggle App Bar'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Retour'),
            ),
          ],
        )
      ),
    );
  }
}