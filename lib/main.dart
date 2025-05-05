import 'package:flutter/material.dart';
import 'package:testformvalidation/booklist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form validation',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Form Validation'),
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
  final _formKey = GlobalKey<FormState>();

  void _showSnackBar() {
    if (_formKey.currentState!.validate()) {
      final snackBar = SnackBar(
        content: const Text('Livre ajouté!'),
        action: SnackBarAction(label: 'Annuler', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _navigateToBookList();
    }
  }

  void _navigateToBookList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookListWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Titre du livre :'),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Merci d\'indiquer le titre !');
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _showSnackBar,
                child: const Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
