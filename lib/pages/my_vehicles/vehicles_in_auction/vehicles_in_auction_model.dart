import '/backend/api_requests/api_calls.dart';
import '/components/auction_item/auction_item_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/sort_purchased_sold/sort_purchased_sold_widget.dart';
import '/components/vehicles_in_auction_item/vehicles_in_auction_item_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VehiclesInAuctionModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int countResults = 10;

  int skipResults = 0;

  bool isSortDesc = true;

  String? sortDescription;

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for DropDownSubUserM widget.
  String? dropDownSubUserMValue;
  FormFieldController<String>? dropDownSubUserMController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for SortPurchasedSold component.
  late SortPurchasedSoldModel sortPurchasedSoldModel1;
  // State field(s) for DropDownSubuserW widget.
  String? dropDownSubuserWValue;
  FormFieldController<String>? dropDownSubuserWController;
  // Model for SortPurchasedSold component.
  late SortPurchasedSoldModel sortPurchasedSoldModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    sortPurchasedSoldModel1 =
        createModel(context, () => SortPurchasedSoldModel());
    sortPurchasedSoldModel2 =
        createModel(context, () => SortPurchasedSoldModel());
  }

  void dispose() {
    navBarModel.dispose();
    sortPurchasedSoldModel1.dispose();
    sortPurchasedSoldModel2.dispose();
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
