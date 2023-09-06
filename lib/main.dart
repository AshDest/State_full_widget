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
  Color appBarColor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  showMyDialog(dialog: createAlert());
                },
                child: const Text('Montrer une alerte')
            ),
            ElevatedButton(
              onPressed:(){
                showMyDialog(dialog: createSimple());
              },
              child: const Text('Montrer simple'),
            )

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

  AlertDialog createAlert() {
    final alert = AlertDialog(
      title: const Text("Ma first Alert"),
      content: const Text("Ceci est le contenu de mon alerte"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                appBarColor = appBarColor == Colors.lightBlue ? Colors.redAccent : Colors.lightBlue;
              });
            },
            child: const Text('Changer le AppBar')),
      ],
    );
    return alert;
  }
  Future <void> showMyDialog({required Widget dialog}) async{
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        });
  }

  SimpleDialog createSimple(){
    final simple = SimpleDialog(
      title: const Text('Je suis un simple dialogue'),
      children: [
        const Icon( Icons.add_a_photo_outlined, size: 50, color: Colors.redAccent),
        const Text("Je suis comme une colonne"),
        const Divider(),
        const Text("Mais je suis un Pop Up"),
        option()
      ],
      elevation: 15,
    );
    return simple;
  }
  SimpleDialogOption option() {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Fermer'),
    );
  }
}
