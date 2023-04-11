// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:azstore/azstore.dart';
import 'package:image_picker/image_picker.dart';

Future<String> deleteFileFromAzure(String connectionString, String imageName,
    int locationId, String vehicleId) async {
  String result = "";
  try {
    String _connectionString = connectionString;

    var storage = AzureStorage.parse(_connectionString);

    String containerName;
    if (locationId == 0) {
      containerName = "vehicleimages";
    } else if (locationId == 1) {
      containerName = "vehicledamages";
    } else if (locationId == 2) {
      containerName = "vehiclefiles";
    } else {
      containerName = "";
    }

    await storage.deleteBlob('/$containerName/$vehicleId/$imageName');
  } catch (e) {
    debugPrint('An error occured. Error: $e');
    result = e.toString();
  }
  return result;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
