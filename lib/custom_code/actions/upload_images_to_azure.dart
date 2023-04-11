// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:azstore/azstore.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> uploadImagesToAzure(
    BuildContext context,
    String connectionString,
    String vehicleId,
    int locationId,
    int availableQty,
    String errorSizeMsg) async {
  List<dynamic> result = [];
  List<XFile>? tempListFile;
  try {
    final ImagePicker _picker = ImagePicker();
    tempListFile = await _picker.pickMultiImage(
        imageQuality: 50, requestFullMetadata: false);
    //assert(tempListFile.isNotEmpty);
    if (tempListFile.isNotEmpty) {
      String _connectionString = connectionString;
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

      int counter = 1;
      //bool hasPortraitImages = true;
      //String message = "";

      for (var element in tempListFile) {
        if (counter > availableQty) {
          break;
        }

        var storage = AzureStorage.parse(_connectionString);
        String extension = element.name.split('.').last;
        String dateNow = DateFormat('MMddhhmmss').format(DateTime.now());
        var picId = "img" +
            locationId.toString().padLeft(2, '0') +
            dateNow +
            counter.toString().padLeft(2, '0');
        Uint8List? bytes = await element.readAsBytes();
        await storage.putBlob('/$containerName/$vehicleId/$picId.$extension',
            contentType: 'image/$extension', bodyBytes: bytes);

        result.add({
          'vehicleId': vehicleId,
          'positionDescriptor': counter,
          'imageBlogName': '$picId.$extension'
        });

        counter = counter + 1;
      }
    }
  } catch (e) {
    debugPrint('An error occured. Error: $e');
    //result = e.toString();
  }
  return result;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
