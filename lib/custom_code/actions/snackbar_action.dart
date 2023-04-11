// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future snackbarAction(BuildContext context, String? msg) async {
  // Add your function code here!
  final snackBar = SnackBar(
    content: Text(msg!),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 4000),
    width: 700, // Width of the SnackBar.
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //return snackBar;
}
