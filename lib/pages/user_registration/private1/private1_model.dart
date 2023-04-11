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
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Private1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

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
        'k4lzup3k' /* Field is required. */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '7w21zd8d' /* First name must contain more t... */,
      );
    }
    if (val.length > 24) {
      return FFLocalizations.of(context).getText(
        '02k2885r' /* First name must not contain mo... */,
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
        'lv30od7q' /* Field is required. */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'wnzlz1n5' /* Last name must contain more th... */,
      );
    }
    if (val.length > 24) {
      return FFLocalizations.of(context).getText(
        'lh1tgl50' /* Last name must not contain mor... */,
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
        '5d2uw69h' /* Field is required. */,
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
        'mqytqqud' /* Field is required. */,
      );
    }

    if (!RegExp('^(?=.*\\d)[A-Za-z\\d.-/]{3,10}[\\s]{0,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'a1hd9yhu' /* Invalid Postcode. */,
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
        'cyxmn219' /* Field is required. */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'p5evfjex' /* Town cannot be less than 2 cha... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'ychnxruj' /* Town cannot have more than 50 ... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Find country by Id)] action in ButtonNext widget.
  ApiCallResponse? apiResultCountrybyId2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldFirstNameControllerValidator =
        _textFieldFirstNameControllerValidator;
    textFieldLastNameControllerValidator =
        _textFieldLastNameControllerValidator;
    textFieldStreetControllerValidator = _textFieldStreetControllerValidator;
    textFieldPostCodeControllerValidator =
        _textFieldPostCodeControllerValidator;
    textFieldTownControllerValidator = _textFieldTownControllerValidator;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldFirstNameController?.dispose();
    textFieldLastNameController?.dispose();
    textFieldStreetController?.dispose();
    textFieldPostCodeController?.dispose();
    textFieldTownController?.dispose();
  }

  /// Additional helper methods are added here.

  String? get radioButtonSalutationValue =>
      radioButtonSalutationController?.value;
}
