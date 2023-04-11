import '/backend/api_requests/api_calls.dart';
import '/components/actionss_sub_user_listing/actionss_sub_user_listing_widget.dart';
import '/components/empty_sub_use_listing/empty_sub_use_listing_widget.dart';
import '/components/mouse_region_sub_user_listing/mouse_region_sub_user_listing_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubUserListingModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int resultCount = 10;

  int resultTotal = 0;

  int resultSkip = 0;

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Models for MouseRegionSubUserListing dynamic component.
  late FlutterFlowDynamicModels<MouseRegionSubUserListingModel>
      mouseRegionSubUserListingModels;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (Activate deactivate subuser)] action in Container widget.
  ApiCallResponse? apiResultActivateM;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    mouseRegionSubUserListingModels =
        FlutterFlowDynamicModels(() => MouseRegionSubUserListingModel());
  }

  void dispose() {
    navBarModel.dispose();
    mouseRegionSubUserListingModels.dispose();
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
}
