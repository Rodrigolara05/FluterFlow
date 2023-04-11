import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSubUserModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextFieldUsername widget.
  TextEditingController? textFieldUsernameController;
  String? Function(BuildContext, String?)? textFieldUsernameControllerValidator;
  String? _textFieldUsernameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p9z9mpgi' /* Field is required */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'a2fylone' /* Username  must be in 4 and 15 ... */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'l2unxk0r' /* Username  must be in 4 and 15 ... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldFirstName widget.
  TextEditingController? textFieldFirstNameController;
  String? Function(BuildContext, String?)?
      textFieldFirstNameControllerValidator;
  String? _textFieldFirstNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '51r7w2h7' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'x6944tmp' /* First  name must contain more ... */,
      );
    }
    if (val.length > 24) {
      return FFLocalizations.of(context).getText(
        'uh13agbn' /* First  name must not contain m... */,
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
        '25rfm25h' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'bb0vwqmu' /* Last name must contain more th... */,
      );
    }
    if (val.length > 24) {
      return FFLocalizations.of(context).getText(
        'h8dfvxyr' /* Last name must not contain mor... */,
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
        'a1ud8kpz' /* Field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}[\\s]{0,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3olfgkg0' /* Email is invalid */,
      );
    }
    return null;
  }

  // State field(s) for TextFieldTelephone widget.
  TextEditingController? textFieldTelephoneController;
  String? Function(BuildContext, String?)?
      textFieldTelephoneControllerValidator;
  String? _textFieldTelephoneControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c8jqv298' /* Field is required */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        'e7e05ihm' /* Telephone  must be in 9 and 15... */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        '0sbitsjl' /* Telephone  must be in 9 and 15... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldTelephone2 widget.
  TextEditingController? textFieldTelephone2Controller;
  String? Function(BuildContext, String?)?
      textFieldTelephone2ControllerValidator;
  // State field(s) for DropDownLanguage widget.
  int? dropDownLanguageValue;
  FormFieldController<int>? dropDownLanguageController;
  // State field(s) for TextFieldAboutYourself widget.
  TextEditingController? textFieldAboutYourselfController;
  String? Function(BuildContext, String?)?
      textFieldAboutYourselfControllerValidator;
  // Stores action output result for [Backend Call - API (Register subuser)] action in Button widget.
  ApiCallResponse? apiResultRegisterSubuser;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldUsernameControllerValidator =
        _textFieldUsernameControllerValidator;
    textFieldFirstNameControllerValidator =
        _textFieldFirstNameControllerValidator;
    textFieldLastNameControllerValidator =
        _textFieldLastNameControllerValidator;
    textFieldEmailControllerValidator = _textFieldEmailControllerValidator;
    textFieldTelephoneControllerValidator =
        _textFieldTelephoneControllerValidator;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldUsernameController?.dispose();
    textFieldFirstNameController?.dispose();
    textFieldLastNameController?.dispose();
    textFieldEmailController?.dispose();
    textFieldTelephoneController?.dispose();
    textFieldTelephone2Controller?.dispose();
    textFieldAboutYourselfController?.dispose();
  }

  /// Additional helper methods are added here.

}
