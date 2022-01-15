import 'package:flutter/material.dart';

class AddQuote extends StatefulWidget {
  const AddQuote({Key? key}) : super(key: key);

  @override
  _AddQuoteState createState() {
    return _AddQuoteState();
  }
}

class _AddQuoteState extends State<AddQuote> {
  final _formKey = GlobalKey<FormState>();
  final quoteController = TextEditingController();
  final authorController = TextEditingController();
  final actorController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    quoteController.dispose();
    authorController.dispose();
    actorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Movie Quotes'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildFormInputs(
                  'Please enter a movie quote', _formKey, quoteController),
              _buildFormInputs(
                  'Please enter the quote author', _formKey, actorController),
              _buildFormInputs(
                  'Please enter the actors name', _formKey, authorController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Adding Quote')));
                    }
                  },
                  child: const Text('Add Quote'),
                ),
              )
            ],
          ),
        ));
  }
}

Padding _buildFormInputs(String hint, formKey, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: hint),
    ),
  );
}