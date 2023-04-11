// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:azstore/azstore.dart';
import 'package:file_picker/file_picker.dart';

Future<String> uploadFileToAzure(
    String connectionString, String vehicleId, String positionId) async {
  String result = "";
  FilePickerResult? tempFile;
  try {
    //final _picker = f();
    tempFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['bmp', 'jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx']);
    assert(tempFile != null);
    Uint8List? bytes =
        tempFile != null ? await tempFile.files?.first.bytes : null;
    String _connectionString = connectionString;
    String? extension =
        tempFile != null ? await tempFile.files?.first.extension : null;
    var storage = AzureStorage.parse(_connectionString);
    var picId = "file" + positionId.padLeft(4, '0');
    String containerName = "vehiclefiles";

    result = '$picId.$extension';
    await storage.putBlob(
      '/$containerName/$vehicleId/$picId.$extension',
      bodyBytes: bytes,
      contentType: 'image/$extension',
    );
    result = '$picId.$extension';
  } catch (e) {
    debugPrint('An error occured. Error: $e');
    result += e.toString();
  }
  return result;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
