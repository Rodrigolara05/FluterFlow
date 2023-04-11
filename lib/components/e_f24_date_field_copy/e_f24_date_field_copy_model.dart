import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EF24DateFieldCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldDate widget.
  TextEditingController? textFieldDateController;
  String? Function(BuildContext, String?)? textFieldDateControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldDateController?.dispose();
  }

  /// Additional helper methods are added here.

}
