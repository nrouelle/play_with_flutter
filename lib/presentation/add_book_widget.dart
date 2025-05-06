import 'package:flutter/material.dart';
import 'package:testformvalidation/presentation/booklist.dart';

class AddBookWidget extends StatefulWidget {
  const AddBookWidget({super.key, required this.title});
  final String title;

  @override
  State<AddBookWidget> createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends State<AddBookWidget> {
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
