import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isClosed = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxRegion widget.
  bool? checkboxRegionValue;
  // State field(s) for DropDownRegion widget.
  String? dropDownRegionValue;
  FormFieldController<String>? dropDownRegionController;
  // State field(s) for CheckboxFavorite widget.
  bool? checkboxFavoriteValue;
  // State field(s) for CheckboxBuyNow widget.
  bool? checkboxBuyNowValue;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

  String? get radioButtonValue1 => radioButtonController1?.value;
  String? get radioButtonValue2 => radioButtonController2?.value;
}
