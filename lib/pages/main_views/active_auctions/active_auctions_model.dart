import '/backend/api_requests/api_calls.dart';
import '/components/car_card/car_card_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActiveAuctionsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isFavorite = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for main widget.
  ScrollController? main;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for Filter component.
  late FilterModel filterModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Profile widget.
  ScrollController? profile;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    main = ScrollController();
    navBarModel = createModel(context, () => NavBarModel());
    listViewController = ScrollController();
    filterModel = createModel(context, () => FilterModel());
    columnController = ScrollController();
    profile = ScrollController();
  }

  void dispose() {
    main?.dispose();
    navBarModel.dispose();
    listViewController?.dispose();
    filterModel.dispose();
    columnController?.dispose();
    profile?.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
