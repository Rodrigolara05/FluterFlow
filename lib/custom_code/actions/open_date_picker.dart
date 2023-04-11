// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future<DateTime> openDatePicker(
    BuildContext context, String currentTime) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.parse(currentTime),
    firstDate: DateTime(1950),
    lastDate: DateTime.now(),
    keyboardType: TextInputType.text,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Color(0xFFC5181D),
            onPrimary: Colors.white,
            onSurface: Color(0xFF242729),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color(0xFFC5181D), // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  return pickedDate!;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
