import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Login user)] action in ButtonSignIn widget.
  ApiCallResponse? apiResultLogin;
  // Stores action output result for [Backend Call - API (Get token)] action in ButtonSignIn widget.
  ApiCallResponse? apiResultToken;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    navBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
