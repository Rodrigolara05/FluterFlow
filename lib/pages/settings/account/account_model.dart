import '/backend/api_requests/api_calls.dart';
import '/components/delete_account/delete_account_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextFieldCurrentPasswd widget.
  TextEditingController? textFieldCurrentPasswdController;
  late bool textFieldCurrentPasswdVisibility;
  String? Function(BuildContext, String?)?
      textFieldCurrentPasswdControllerValidator;
  String? _textFieldCurrentPasswdControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'evdjvhww' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldNewPasswd widget.
  TextEditingController? textFieldNewPasswdController;
  late bool textFieldNewPasswdVisibility;
  String? Function(BuildContext, String?)?
      textFieldNewPasswdControllerValidator;
  // State field(s) for TextFieldConfirmPasswd widget.
  TextEditingController? textFieldConfirmPasswdController;
  late bool textFieldConfirmPasswdVisibility;
  String? Function(BuildContext, String?)?
      textFieldConfirmPasswdControllerValidator;
  // Stores action output result for [Backend Call - API (Change Password)] action in Button widget.
  ApiCallResponse? apiResultChangePasswd;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldCurrentPasswdVisibility = false;
    textFieldCurrentPasswdControllerValidator =
        _textFieldCurrentPasswdControllerValidator;
    textFieldNewPasswdVisibility = false;
    textFieldConfirmPasswdVisibility = false;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldCurrentPasswdController?.dispose();
    textFieldNewPasswdController?.dispose();
    textFieldConfirmPasswdController?.dispose();
  }

  /// Additional helper methods are added here.

}
