import '/backend/api_requests/api_calls.dart';
import '/components/loose_progress/loose_progress_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/picture_preview/picture_preview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterCarStep3Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? isNotLoading = true;

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Custom Action - uploadImagesToAzure] action in IconButton widget.
  dynamic? apiResultUploadImages;
  // Stores action output result for [Backend Call - API (Post vehicle info images  collection)] action in IconButton widget.
  ApiCallResponse? apiResultSaveImages;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Custom Action - uploadImagesToAzure] action in IconButton widget.
  dynamic? apiResultUploadDamages;
  // Stores action output result for [Backend Call - API (Post vehicle info damaged images  collection )] action in IconButton widget.
  ApiCallResponse? apiResultSaveDamages;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonController;
  // Stores action output result for [Custom Action - uploadFileToAzure] action in Text widget.
  String? isFileUploaded00;
  Completer<ApiCallResponse>? apiRequestCompleter3;
  // Stores action output result for [Custom Action - deleteFileFromAzure] action in Icon widget.
  String? azureDeleteFile0;
  // Stores action output result for [Backend Call - API (Delete File)] action in Icon widget.
  ApiCallResponse? apiResultDeleteFile;
  // Stores action output result for [Custom Action - uploadFileToAzure] action in Text widget.
  String? isFileUploaded01;
  // Stores action output result for [Custom Action - deleteFileFromAzure] action in Icon widget.
  String? azureDeleteFile1;
  // Stores action output result for [Backend Call - API (Delete File)] action in Icon widget.
  ApiCallResponse? apiResultDeleteFile1;
  // Stores action output result for [Custom Action - uploadFileToAzure] action in Text widget.
  String? isFileUploaded02;
  // Stores action output result for [Custom Action - deleteFileFromAzure] action in Icon widget.
  String? azureDeleteFile2;
  // Stores action output result for [Backend Call - API (Delete File)] action in Icon widget.
  ApiCallResponse? apiResultDeleteFile2;
  // Stores action output result for [Backend Call - API (Get vehicle images)] action in ButtonNext widget.
  ApiCallResponse? apiResultImagesNext;
  // Stores action output result for [Backend Call - API (Get damaged vehicle images)] action in ButtonNext widget.
  ApiCallResponse? apiResultDamagedImagesNext;
  // Stores action output result for [Backend Call - API (Get vehicle files)] action in ButtonNext widget.
  ApiCallResponse? apiResultFiles;
  // Stores action output result for [Backend Call - API (Update vehicle StepThree)] action in ButtonNext widget.
  ApiCallResponse? apiUpdateStep3Result;
  // Stores action output result for [Backend Call - API (Vehicle info Step four)] action in ButtonNext widget.
  ApiCallResponse? apiResultInfo4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    navBarModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  String? get radioButtonValue => radioButtonController?.value;
  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
