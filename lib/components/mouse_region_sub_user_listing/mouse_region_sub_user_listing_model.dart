import '/backend/api_requests/api_calls.dart';
import '/components/delete_account/delete_account_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MouseRegionSubUserListingModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isSelected = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - API (Activate deactivate subuser)] action in Container widget.
  ApiCallResponse? apiResultf7d;
  // Stores action output result for [Backend Call - API (Activate deactivate subuser)] action in IconButton widget.
  ApiCallResponse? apiResultActivate;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
