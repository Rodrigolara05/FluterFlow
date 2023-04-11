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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Professional1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic selectedCountry;

  bool isLabelUid = false;

  List<String> listData = [];
  void addToListData(String item) => listData.add(item);
  void removeFromListData(String item) => listData.remove(item);
  void removeAtIndexFromListData(int index) => listData.removeAt(index);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextFieldCompany widget.
  TextEditingController? textFieldCompanyController;
  String? Function(BuildContext, String?)? textFieldCompanyControllerValidator;
  String? _textFieldCompanyControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y5w5d704' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '799ovsmy' /* The company name cannot be les... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        '80wrirf2' /* The company name cannot have m... */,
      );
    }

    return null;
  }

  // State field(s) for DropDownCountry widget.
  String? dropDownCountryValue;
  FormFieldController<String>? dropDownCountryController;
  // State field(s) for TextFieldStreet widget.
  TextEditingController? textFieldStreetController;
  String? Function(BuildContext, String?)? textFieldStreetControllerValidator;
  String? _textFieldStreetControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ck2iv6oq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldPostCode widget.
  TextEditingController? textFieldPostCodeController;
  String? Function(BuildContext, String?)? textFieldPostCodeControllerValidator;
  String? _textFieldPostCodeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ziyqmma1' /* Field is required */,
      );
    }

    if (!RegExp('^(?=.*\\d)[A-Za-z\\d.-/]{3,10}[\\s]{0,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'p85b6vas' /* Invalid Postcode */,
      );
    }
    return null;
  }

  // State field(s) for TextFieldTown widget.
  TextEditingController? textFieldTownController;
  String? Function(BuildContext, String?)? textFieldTownControllerValidator;
  String? _textFieldTownControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '91jkjkqm' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '1n6beoqb' /* Town cannot be less than 2 cha... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'oi392zqj' /* Town cannot have more than 50 ... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldUid widget.
  TextEditingController? textFieldUidController;
  final textFieldUidMask = MaskTextInputFormatter(mask: '###.###.###');
  String? Function(BuildContext, String?)? textFieldUidControllerValidator;
  // Stores action output result for [Backend Call - API (Validate UID)] action in ButtonNext widget.
  ApiCallResponse? apiResultValidateUID;
  // Stores action output result for [Backend Call - API (Find country by Id)] action in ButtonNext widget.
  ApiCallResponse? apiResultCountrybyId;
  // Stores action output result for [Backend Call - API (Find country by Id)] action in ButtonNext widget.
  ApiCallResponse? apiResultCountrybyId2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldCompanyControllerValidator = _textFieldCompanyControllerValidator;
    textFieldStreetControllerValidator = _textFieldStreetControllerValidator;
    textFieldPostCodeControllerValidator =
        _textFieldPostCodeControllerValidator;
    textFieldTownControllerValidator = _textFieldTownControllerValidator;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldCompanyController?.dispose();
    textFieldStreetController?.dispose();
    textFieldPostCodeController?.dispose();
    textFieldTownController?.dispose();
    textFieldUidController?.dispose();
  }

  /// Additional helper methods are added here.

}
