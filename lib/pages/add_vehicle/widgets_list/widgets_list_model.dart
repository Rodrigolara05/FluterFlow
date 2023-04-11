import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WidgetsListModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get widgets Properties)] action in WidgetsList widget.
  ApiCallResponse? apiResultGetwidgets;
  // State field(s) for Checkbox01 widget.
  bool? checkbox01Value;
  // State field(s) for Checkbox02 widget.
  bool? checkbox02Value;
  // State field(s) for Checkbox03 widget.
  bool? checkbox03Value;
  // State field(s) for Checkbox05 widget.
  bool? checkbox05Value;
  // State field(s) for Checkbox06 widget.
  bool? checkbox06Value;
  // State field(s) for Checkbox07 widget.
  bool? checkbox07Value;
  // State field(s) for Checkbox08 widget.
  bool? checkbox08Value;
  // State field(s) for Checkbox10 widget.
  bool? checkbox10Value;
  // State field(s) for Checkbox11 widget.
  bool? checkbox11Value;
  // State field(s) for Checkbox12 widget.
  bool? checkbox12Value;
  // State field(s) for Checkbox13 widget.
  bool? checkbox13Value;
  // State field(s) for Checkbox14 widget.
  bool? checkbox14Value;
  // State field(s) for Checkbox15 widget.
  bool? checkbox15Value;
  // State field(s) for Checkbox16 widget.
  bool? checkbox16Value;
  // State field(s) for RadioButton17 widget.
  FormFieldController<String>? radioButton17Controller;
  // State field(s) for Checkbox18 widget.
  bool? checkbox18Value;
  // State field(s) for Checkbox19 widget.
  bool? checkbox19Value;
  // State field(s) for Checkbox20 widget.
  bool? checkbox20Value;
  // State field(s) for Checkbox21 widget.
  bool? checkbox21Value;
  // State field(s) for Checkbox22 widget.
  bool? checkbox22Value;
  // State field(s) for Checkbox23 widget.
  bool? checkbox23Value;
  // State field(s) for Checkbox24 widget.
  bool? checkbox24Value;
  // State field(s) for RadioButton25 widget.
  FormFieldController<String>? radioButton25Controller;
  // State field(s) for Checkbox26 widget.
  bool? checkbox26Value;
  // State field(s) for Checkbox27 widget.
  bool? checkbox27Value;
  // State field(s) for RadioButton28 widget.
  FormFieldController<String>? radioButton28Controller;
  // State field(s) for Checkbox29 widget.
  bool? checkbox29Value;
  // State field(s) for Checkbox30 widget.
  bool? checkbox30Value;
  // State field(s) for Checkbox31 widget.
  bool? checkbox31Value;
  // State field(s) for Checkbox32 widget.
  bool? checkbox32Value;
  // State field(s) for Checkbox34 widget.
  bool? checkbox34Value;
  // State field(s) for Checkbox35 widget.
  bool? checkbox35Value;
  // State field(s) for Checkbox36 widget.
  bool? checkbox36Value;
  // State field(s) for Checkbox37 widget.
  bool? checkbox37Value;
  // State field(s) for Checkbox38 widget.
  bool? checkbox38Value;
  // State field(s) for Checkbox39 widget.
  bool? checkbox39Value;
  // State field(s) for RadioButton40 widget.
  FormFieldController<String>? radioButton40Controller;
  // State field(s) for Checkbox41 widget.
  bool? checkbox41Value;
  // State field(s) for Checkbox42 widget.
  bool? checkbox42Value;
  // State field(s) for Checkbox43 widget.
  bool? checkbox43Value;
  // State field(s) for Checkbox44 widget.
  bool? checkbox44Value;
  // State field(s) for Checkbox45 widget.
  bool? checkbox45Value;
  // State field(s) for Checkbox46 widget.
  bool? checkbox46Value;
  // State field(s) for Checkbox47 widget.
  bool? checkbox47Value;
  // State field(s) for Checkbox48 widget.
  bool? checkbox48Value;
  // Stores action output result for [Backend Call - API (Save widgets)] action in Button widget.
  ApiCallResponse? apiResultSaveWidgets;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

  String? get radioButton17Value => radioButton17Controller?.value;
  String? get radioButton25Value => radioButton25Controller?.value;
  String? get radioButton28Value => radioButton28Controller?.value;
  String? get radioButton40Value => radioButton40Controller?.value;
}
