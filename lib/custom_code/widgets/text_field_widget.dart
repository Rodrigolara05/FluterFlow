// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  // Crea un controlador de texto. Lo usaremos para recuperar el valor actual
  // del TextField!
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    // Esto también elimina el listener _printLatestValue
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: myController,
          maxLength: 300,
          maxLines: 3,
          decoration: InputDecoration(border: OutlineInputBorder()),
          onChanged: (text) {
            FFAppState().textfieldTest = text;
          },
        )
      ],
    );
  }
}
