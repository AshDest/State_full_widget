import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pop up et Nav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color btnColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  final alert = AlertDialog(
                    title: const Text("Ma first Alert"),
                    content: const Text("Ceci est le contenu de mon alerte"),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return alert;
                      });
                },
                child: Text('Montrer une alerte')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: btnColor,
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(createSnack(text: 'Snack evolue'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SnackBar createSnack({required String text}) {
    final content = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.thumb_up),
        Text(text),
      ],
    );
    final snack = SnackBar(
        content: content,
      action: SnackBarAction(
        label: 'Changer couleur btn',
        onPressed: () {
          setState(() {
            btnColor = btnColor == Colors.greenAccent ? Colors.redAccent : Colors.greenAccent;
          });
        },
        textColor: Colors.red,
      ),
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
    );
    return snack;
  }
}
