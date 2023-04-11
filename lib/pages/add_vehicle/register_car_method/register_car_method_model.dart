import '/backend/api_requests/api_calls.dart';
import '/components/car_method_mobile/car_method_mobile_widget.dart';
import '/components/car_method_web/car_method_web_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterCarMethodModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? dateFirstReg;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - openDatePicker] action in Container widget.
  DateTime? datePickerOut;
  // Stores action output result for [Backend Call - API (Search Vehicle by Model Number)] action in Button widget.
  ApiCallResponse? apiResultSearchList;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    navBarModel.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
