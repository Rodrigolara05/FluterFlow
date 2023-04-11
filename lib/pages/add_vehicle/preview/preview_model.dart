import '/backend/api_requests/api_calls.dart';
import '/components/carrousel_panel/carrousel_panel_widget.dart';
import '/components/carrousel_panel_damege/carrousel_panel_damege_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/general_condition/general_condition_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreviewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Backend Call - API (Vehicle info Step four)] action in IconButton widget.
  ApiCallResponse? apiResultEdit4;
  // Stores action output result for [Backend Call - API (Vehicle info Step two)] action in IconButton widget.
  ApiCallResponse? apiResultEdit2;
  // Stores action output result for [Backend Call - API (Vehicle info Step one)] action in IconButton widget.
  ApiCallResponse? apiResultEdit1;
  // Stores action output result for [Backend Call - API (Vehicle info Step two)] action in IconButton widget.
  ApiCallResponse? apiResultEdit2Two;
  // Stores action output result for [Backend Call - API (Activate auction)] action in Button widget.
  ApiCallResponse? apiResultActivate;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    navBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
