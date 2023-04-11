import '/backend/api_requests/api_calls.dart';
import '/components/loose_progress/loose_progress_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterStep3Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextFieldUsername widget.
  TextEditingController? textFieldUsernameController;
  String? Function(BuildContext, String?)? textFieldUsernameControllerValidator;
  // State field(s) for TextFieldPassword widget.
  TextEditingController? textFieldPasswordController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)? textFieldPasswordControllerValidator;
  // State field(s) for TextFieldPassword2 widget.
  TextEditingController? textFieldPassword2Controller;
  late bool textFieldPassword2Visibility;
  String? Function(BuildContext, String?)?
      textFieldPassword2ControllerValidator;
  // State field(s) for CheckboxTerms widget.
  bool? checkboxTermsValue;
  // State field(s) for CheckboxPrivacy widget.
  bool? checkboxPrivacyValue;
  // Stores action output result for [Backend Call - API (Register user)] action in ButtonNext widget.
  ApiCallResponse? apiResultUserRegister;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldPasswordVisibility = false;
    textFieldPassword2Visibility = false;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldUsernameController?.dispose();
    textFieldPasswordController?.dispose();
    textFieldPassword2Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
