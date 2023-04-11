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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterCarStep4Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLabelTransport = false;

  bool isLabelDuration = false;

  bool isLabelIncrease = false;

  bool isLabelTransportCost = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextFieldMinPrice widget.
  TextEditingController? textFieldMinPriceController;
  String? Function(BuildContext, String?)? textFieldMinPriceControllerValidator;
  // State field(s) for DropDownTransportedBy widget.
  String? dropDownTransportedByValue;
  FormFieldController<String>? dropDownTransportedByController;
  // State field(s) for TextFieldTransportCost widget.
  TextEditingController? textFieldTransportCostController;
  String? Function(BuildContext, String?)?
      textFieldTransportCostControllerValidator;
  // State field(s) for DropDownDuration widget.
  int? dropDownDurationValue;
  FormFieldController<int>? dropDownDurationController;
  // State field(s) for DropDownIncrease widget.
  double? dropDownIncreaseValue;
  FormFieldController<double>? dropDownIncreaseController;
  // State field(s) for TextFieldBuyPrice widget.
  TextEditingController? textFieldBuyPriceController;
  String? Function(BuildContext, String?)? textFieldBuyPriceControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (Set Auction preview)] action in Button widget.
  ApiCallResponse? apiResultPreview;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    navBarModel.dispose();
    textFieldMinPriceController?.dispose();
    textFieldTransportCostController?.dispose();
    textFieldBuyPriceController?.dispose();
  }

  /// Additional helper methods are added here.

}
