import '/flutter_flow/flutter_flow_animations.dart';
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

class SortPurchasedSoldModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isClosed = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButtonPurchased widget.
  FormFieldController<String>? radioButtonPurchasedController;
  // State field(s) for RadioButtonPurchasedPro widget.
  FormFieldController<String>? radioButtonPurchasedProController;
  // State field(s) for RadioButtonSold widget.
  FormFieldController<String>? radioButtonSoldController;
  // State field(s) for RadioButtonSoldPro widget.
  FormFieldController<String>? radioButtonSoldProController;
  // State field(s) for RadioButtonAuction widget.
  FormFieldController<String>? radioButtonAuctionController;
  // State field(s) for RadioButtonAuctionPro widget.
  FormFieldController<String>? radioButtonAuctionProController;
  // State field(s) for RadioButtonGarage widget.
  FormFieldController<String>? radioButtonGarageController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

  String? get radioButtonPurchasedValue =>
      radioButtonPurchasedController?.value;
  String? get radioButtonPurchasedProValue =>
      radioButtonPurchasedProController?.value;
  String? get radioButtonSoldValue => radioButtonSoldController?.value;
  String? get radioButtonSoldProValue => radioButtonSoldProController?.value;
  String? get radioButtonAuctionValue => radioButtonAuctionController?.value;
  String? get radioButtonAuctionProValue =>
      radioButtonAuctionProController?.value;
  String? get radioButtonGarageValue => radioButtonGarageController?.value;
  String? get radioButtonValue => radioButtonController?.value;
}
