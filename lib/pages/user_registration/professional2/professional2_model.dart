import '/backend/api_requests/api_calls.dart';
import '/components/loose_progress/loose_progress_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Professional2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLabelTlf1 = false;

  bool isLabelTlf2 = false;

  bool isLabelLanguage = false;

  bool isLabelSalutation = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for RadioButtonSalutation widget.
  FormFieldController<String>? radioButtonSalutationController;
  // State field(s) for TextFieldFirstName widget.
  TextEditingController? textFieldFirstNameController;
  String? Function(BuildContext, String?)?
      textFieldFirstNameControllerValidator;
  String? _textFieldFirstNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hpk61nf3' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'yh7ojcsr' /* First name must contain more t... */,
      );
    }
    if (val.length > 24) {
      return FFLocalizations.of(context).getText(
        'tiiiqnwq' /* First name must not contain mo... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldLastName widget.
  TextEditingController? textFieldLastNameController;
  String? Function(BuildContext, String?)? textFieldLastNameControllerValidator;
  String? _textFieldLastNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'naco93fl' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'yjgt76ib' /* Last name must contain more th... */,
      );
    }
    if (val.length > 24) {
      return FFLocalizations.of(context).getText(
        'josv7clo' /* Last name must not contain mor... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldRole widget.
  TextEditingController? textFieldRoleController;
  String? Function(BuildContext, String?)? textFieldRoleControllerValidator;
  String? _textFieldRoleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fcvsp73y' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'otdfsrvy' /* Last name must contain more th... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'riyb5qz6' /* Last name must not contain mor... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldEmail widget.
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  String? _textFieldEmailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pwnqx5l9' /* Field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}[\\s]{0,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ugxxwgk0' /* Email is invalid */,
      );
    }
    return null;
  }

  // State field(s) for TextFieldTelephone widget.
  TextEditingController? textFieldTelephoneController;
  String? Function(BuildContext, String?)?
      textFieldTelephoneControllerValidator;
  // State field(s) for TextFieldTelephone2 widget.
  TextEditingController? textFieldTelephone2Controller;
  String? Function(BuildContext, String?)?
      textFieldTelephone2ControllerValidator;
  // State field(s) for DropDownLanguage widget.
  int? dropDownLanguageValue;
  FormFieldController<int>? dropDownLanguageController;
  // State field(s) for TextFieldPoBox widget.
  TextEditingController? textFieldPoBoxController;
  String? Function(BuildContext, String?)? textFieldPoBoxControllerValidator;
  // State field(s) for DropDownAboutUs widget.
  int? dropDownAboutUsValue;
  FormFieldController<int>? dropDownAboutUsController;
  // Stores action output result for [Backend Call - API (Validate Email)] action in ButtonNext widget.
  ApiCallResponse? apiResultValidateEmail;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldFirstNameControllerValidator =
        _textFieldFirstNameControllerValidator;
    textFieldLastNameControllerValidator =
        _textFieldLastNameControllerValidator;
    textFieldRoleControllerValidator = _textFieldRoleControllerValidator;
    textFieldEmailControllerValidator = _textFieldEmailControllerValidator;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldFirstNameController?.dispose();
    textFieldLastNameController?.dispose();
    textFieldRoleController?.dispose();
    textFieldEmailController?.dispose();
    textFieldTelephoneController?.dispose();
    textFieldTelephone2Controller?.dispose();
    textFieldPoBoxController?.dispose();
  }

  /// Additional helper methods are added here.

  String? get radioButtonSalutationValue =>
      radioButtonSalutationController?.value;
}
