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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Private2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLabelTlf1 = false;

  bool isLabelLanguage = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextFieldEmail widget.
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  String? _textFieldEmailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f7z1iroo' /* Field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}[\\s]{0,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'nqh46fkw' /* Email is invalid */,
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
  // State field(s) for DropDownFindUs widget.
  int? dropDownFindUsValue;
  FormFieldController<int>? dropDownFindUsController;
  // Stores action output result for [Backend Call - API (Validate Email)] action in ButtonNext widget.
  ApiCallResponse? apiResultValidateEmail;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldEmailControllerValidator = _textFieldEmailControllerValidator;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldEmailController?.dispose();
    textFieldTelephoneController?.dispose();
    textFieldTelephone2Controller?.dispose();
    textFieldPoBoxController?.dispose();
  }

  /// Additional helper methods are added here.

}
