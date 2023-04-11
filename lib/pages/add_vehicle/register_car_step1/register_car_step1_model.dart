import '/backend/api_requests/api_calls.dart';
import '/components/loose_progress/loose_progress_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterCarStep1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLabelBrandVisible = false;

  bool isLabelModelVisible = false;

  bool isLabelTypeVisible = false;

  bool isLabelFuelVisible = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Vehicle Data by Type)] action in RegisterCar_step1 widget.
  ApiCallResponse? apiResultEditInfo;
  Completer<ApiCallResponse>? apiRequestCompleter4;
  Completer<ApiCallResponse>? apiRequestCompleter3;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Backend Call - API (Register vehicle)] action in Text widget.
  ApiCallResponse? apiResultSaveRegisterWeb;
  // Stores action output result for [Backend Call - API (Update vehicle StepOne)] action in Text widget.
  ApiCallResponse? apiResultSaveUpdateWeb;
  // State field(s) for DropDownBrand widget.
  String? dropDownBrandValue;
  FormFieldController<String>? dropDownBrandController;
  // State field(s) for DropDownModel widget.
  String? dropDownModelValue;
  FormFieldController<String>? dropDownModelController;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeController;
  // Stores action output result for [Backend Call - API (Vehicle Data by Type)] action in DropDownType widget.
  ApiCallResponse? apiResultType;
  // State field(s) for DropDownFuel widget.
  int? dropDownFuelValue;
  FormFieldController<int>? dropDownFuelController;
  // Stores action output result for [Backend Call - API (Update vehicle StepOne)] action in ButtonNext widget.
  ApiCallResponse? apiResultEditUpdate;
  // Stores action output result for [Backend Call - API (Update vehicle StepOne)] action in ButtonNext widget.
  ApiCallResponse? apiResultEditUpdate2;
  // Stores action output result for [Backend Call - API (Vehicle info Step two)] action in ButtonNext widget.
  ApiCallResponse? apiResultInfo2;
  // Stores action output result for [Backend Call - API (Register vehicle)] action in ButtonNext widget.
  ApiCallResponse? apiResultNextAutoRegister;
  // Stores action output result for [Backend Call - API (Register vehicle)] action in ButtonNext widget.
  ApiCallResponse? apiResultNextRegister;
  // Stores action output result for [Backend Call - API (Update vehicle StepOne)] action in ButtonNext widget.
  ApiCallResponse? apiResultNextUpdate;
  // Stores action output result for [Backend Call - API (Vehicle info Step two)] action in ButtonNext widget.
  ApiCallResponse? apiResultInfo2Back;
  // Stores action output result for [Backend Call - API (Register vehicle)] action in IconButton widget.
  ApiCallResponse? apiResultSaveRegister;
  // Stores action output result for [Backend Call - API (Update vehicle StepOne)] action in IconButton widget.
  ApiCallResponse? apiResultSaveUpdate;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    navBarModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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
}
