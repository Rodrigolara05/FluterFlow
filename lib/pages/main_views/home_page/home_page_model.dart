import '/backend/api_requests/api_calls.dart';
import '/components/car_card/car_card_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/home_emptystate/home_emptystate_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int minYearModel = 0;

  int minYearMin = 0;

  int minYearMax = 0;

  bool isLoading = false;

  dynamic jsonModels;

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for DropDownBrand widget.
  String? dropDownBrandValue;
  FormFieldController<String>? dropDownBrandController;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for DropDownRegion widget.
  String? dropDownRegionValue;
  FormFieldController<String>? dropDownRegionController;
  // State field(s) for DropDownPassenger widget.
  String? dropDownPassengerValue;
  FormFieldController<String>? dropDownPassengerController;
  // State field(s) for DropDownFuel widget.
  int? dropDownFuelValue;
  FormFieldController<int>? dropDownFuelController;
  // State field(s) for DropDownModel widget.
  String? dropDownModelValue;
  FormFieldController<String>? dropDownModelController;
  // State field(s) for DropDownMinYear widget.
  String? dropDownMinYearValue;
  FormFieldController<String>? dropDownMinYearController;
  // State field(s) for DropDownMaxYear widget.
  String? dropDownMaxYearValue;
  FormFieldController<String>? dropDownMaxYearController;
  // State field(s) for DropDownCommercial widget.
  String? dropDownCommercialValue;
  FormFieldController<String>? dropDownCommercialController;
  // State field(s) for TextFieldMinPrice widget.
  TextEditingController? textFieldMinPriceController;
  String? Function(BuildContext, String?)? textFieldMinPriceControllerValidator;
  // State field(s) for TextFieldMaxPrice widget.
  TextEditingController? textFieldMaxPriceController;
  String? Function(BuildContext, String?)? textFieldMaxPriceControllerValidator;
  // Model for Filter component.
  late FilterModel filterModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    filterModel = createModel(context, () => FilterModel());
  }

  void dispose() {
    navBarModel.dispose();
    textFieldMinPriceController?.dispose();
    textFieldMaxPriceController?.dispose();
    filterModel.dispose();
  }

  /// Additional helper methods are added here.

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
