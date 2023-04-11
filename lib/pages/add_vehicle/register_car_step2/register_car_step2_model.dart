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
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterCarStep2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLabel1stReg = false;

  bool isLabelSwissVehicle = false;

  bool isLabelExtColor = false;

  bool isLabelPaintwork = false;

  bool isLabelIntColor = false;

  bool isLabelLocation = false;

  bool isLabelMaintenance = false;

  bool isLabelNkeys = false;

  bool isLabelInspection = false;

  bool isLabelMfk = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Vehicle info Step two)] action in RegisterCar_step2 widget.
  ApiCallResponse? apiResultEdit2;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Custom Action - openDatePicker] action in Container widget.
  DateTime? datePickerFirstRegistrationWeb;
  // State field(s) for TextFieldFrame widget.
  TextEditingController? textFieldFrameController;
  String? Function(BuildContext, String?)? textFieldFrameControllerValidator;
  String? _textFieldFrameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x3ffg3mr' /* Field is required */,
      );
    }

    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'xw14lkqe' /* Maximum 20 characters allowed. */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldModelNo widget.
  TextEditingController? textFieldModelNoController;
  String? Function(BuildContext, String?)? textFieldModelNoControllerValidator;
  String? _textFieldModelNoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l412gn3g' /* Field is required */,
      );
    }

    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'k2fjc3y5' /* Maximum 20 characters allowed. */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldKms widget.
  TextEditingController? textFieldKmsController;
  String? Function(BuildContext, String?)? textFieldKmsControllerValidator;
  String? _textFieldKmsControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '97eal9sl' /* Field is required. */,
      );
    }

    if (val.length > 7) {
      return FFLocalizations.of(context).getText(
        'mydwluv2' /* Max amount 9'999'999 allowed. */,
      );
    }

    return null;
  }

  // State field(s) for DropDownExtColor widget.
  String? dropDownExtColorValue;
  FormFieldController<String>? dropDownExtColorController;
  // State field(s) for RadioButtonIsSwiss widget.
  FormFieldController<String>? radioButtonIsSwissController;
  // State field(s) for DropDownPaintwork widget.
  String? dropDownPaintworkValue;
  FormFieldController<String>? dropDownPaintworkController;
  // State field(s) for DropDownIntColor widget.
  String? dropDownIntColorValue;
  FormFieldController<String>? dropDownIntColorController;
  // State field(s) for DropDownRegion widget.
  String? dropDownRegionValue;
  FormFieldController<String>? dropDownRegionController;
  // State field(s) for TextFieldAdditional widget.
  TextEditingController? textFieldAdditionalController;
  String? Function(BuildContext, String?)?
      textFieldAdditionalControllerValidator;
  // State field(s) for RadioButtonMaintenance widget.
  FormFieldController<String>? radioButtonMaintenanceController;
  // Stores action output result for [Custom Action - openDatePicker] action in Container widget.
  DateTime? datePickerInspectionWeb;
  // State field(s) for CheckboxCondition1 widget.
  bool? checkboxCondition1Value;
  // State field(s) for CheckboxCondition2 widget.
  bool? checkboxCondition2Value;
  // State field(s) for CheckboxCondition3 widget.
  bool? checkboxCondition3Value;
  // State field(s) for CheckboxCondition4 widget.
  bool? checkboxCondition4Value;
  // State field(s) for CheckboxCondition5 widget.
  bool? checkboxCondition5Value;
  // State field(s) for CheckboxCondition6 widget.
  bool? checkboxCondition6Value;
  // State field(s) for CheckboxCondition7 widget.
  bool? checkboxCondition7Value;
  // State field(s) for DropDowKeys widget.
  String? dropDowKeysValue;
  FormFieldController<String>? dropDowKeysController;
  // Stores action output result for [Custom Action - openDatePicker] action in Container widget.
  DateTime? datePickerMFKWeb;
  // State field(s) for Checkbox01 widget.
  bool? checkbox01Value;
  // State field(s) for Checkbox02 widget.
  bool? checkbox02Value;
  // State field(s) for Checkbox03 widget.
  bool? checkbox03Value;
  // State field(s) for Checkbox05 widget.
  bool? checkbox05Value;
  // State field(s) for Checkbox06 widget.
  bool? checkbox06Value;
  // State field(s) for Checkbox07 widget.
  bool? checkbox07Value;
  // State field(s) for Checkbox08 widget.
  bool? checkbox08Value;
  // State field(s) for Checkbox10 widget.
  bool? checkbox10Value;
  // State field(s) for Checkbox11 widget.
  bool? checkbox11Value;
  // State field(s) for Checkbox12 widget.
  bool? checkbox12Value;
  // State field(s) for Checkbox13 widget.
  bool? checkbox13Value;
  // State field(s) for Checkbox14 widget.
  bool? checkbox14Value;
  // State field(s) for Checkbox15 widget.
  bool? checkbox15Value;
  // State field(s) for Checkbox16 widget.
  bool? checkbox16Value;
  // State field(s) for RadioButton17 widget.
  FormFieldController<String>? radioButton17Controller;
  // State field(s) for Checkbox18 widget.
  bool? checkbox18Value;
  // State field(s) for Checkbox19 widget.
  bool? checkbox19Value;
  // State field(s) for Checkbox20 widget.
  bool? checkbox20Value;
  // State field(s) for Checkbox21 widget.
  bool? checkbox21Value;
  // State field(s) for Checkbox22 widget.
  bool? checkbox22Value;
  // State field(s) for Checkbox23 widget.
  bool? checkbox23Value;
  // State field(s) for Checkbox24 widget.
  bool? checkbox24Value;
  // State field(s) for RadioButton25 widget.
  FormFieldController<String>? radioButton25Controller;
  // State field(s) for Checkbox26 widget.
  bool? checkbox26Value;
  // State field(s) for Checkbox27 widget.
  bool? checkbox27Value;
  // State field(s) for RadioButton28 widget.
  FormFieldController<String>? radioButton28Controller;
  // State field(s) for Checkbox29 widget.
  bool? checkbox29Value;
  // State field(s) for Checkbox30 widget.
  bool? checkbox30Value;
  // State field(s) for Checkbox31 widget.
  bool? checkbox31Value;
  // State field(s) for Checkbox32 widget.
  bool? checkbox32Value;
  // State field(s) for Checkbox34 widget.
  bool? checkbox34Value;
  // State field(s) for Checkbox35 widget.
  bool? checkbox35Value;
  // State field(s) for Checkbox36 widget.
  bool? checkbox36Value;
  // State field(s) for Checkbox37 widget.
  bool? checkbox37Value;
  // State field(s) for Checkbox38 widget.
  bool? checkbox38Value;
  // State field(s) for Checkbox39 widget.
  bool? checkbox39Value;
  // State field(s) for RadioButton40 widget.
  FormFieldController<String>? radioButton40Controller;
  // State field(s) for Checkbox41 widget.
  bool? checkbox41Value;
  // State field(s) for Checkbox42 widget.
  bool? checkbox42Value;
  // State field(s) for Checkbox43 widget.
  bool? checkbox43Value;
  // State field(s) for Checkbox44 widget.
  bool? checkbox44Value;
  // State field(s) for Checkbox45 widget.
  bool? checkbox45Value;
  // State field(s) for Checkbox46 widget.
  bool? checkbox46Value;
  // State field(s) for Checkbox47 widget.
  bool? checkbox47Value;
  // State field(s) for Checkbox48 widget.
  bool? checkbox48Value;
  // State field(s) for RadioButtonDamage widget.
  FormFieldController<String>? radioButtonDamageController;
  // State field(s) for TextFieldRepairs widget.
  TextEditingController? textFieldRepairsController;
  String? Function(BuildContext, String?)? textFieldRepairsControllerValidator;
  String? _textFieldRepairsControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'syup02w2' /* Required field */,
      );
    }

    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        '5s1jb287' /* Maximum 10 characters allowed. */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldBody widget.
  TextEditingController? textFieldBodyController;
  String? Function(BuildContext, String?)? textFieldBodyControllerValidator;
  String? _textFieldBodyControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wbryqsu7' /* Required field */,
      );
    }

    if (val.length > 255) {
      return FFLocalizations.of(context).getText(
        '3m9pvery' /* Maximum 255 characters allowed... */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldMechanics widget.
  TextEditingController? textFieldMechanicsController;
  String? Function(BuildContext, String?)?
      textFieldMechanicsControllerValidator;
  String? _textFieldMechanicsControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g050fx2q' /* Required field */,
      );
    }

    if (val.length > 255) {
      return FFLocalizations.of(context).getText(
        'kx01ptu8' /* Maximum 255 characters allowed... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Update vehicle StepTwo)] action in ButtonCancel widget.
  ApiCallResponse? apiResultBackStep2;
  // Stores action output result for [Backend Call - API (Update vehicle StepTwo)] action in ButtonNext widget.
  ApiCallResponse? apiResultNextStep2;
  // Stores action output result for [Backend Call - API (Save widgets)] action in ButtonNext widget.
  ApiCallResponse? apiResultNextWidget;
  // Stores action output result for [Backend Call - API (Update vehicle StepTwo)] action in IconButton widget.
  ApiCallResponse? apiResulSaveStep2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    textFieldFrameControllerValidator = _textFieldFrameControllerValidator;
    textFieldModelNoControllerValidator = _textFieldModelNoControllerValidator;
    textFieldKmsControllerValidator = _textFieldKmsControllerValidator;
    textFieldRepairsControllerValidator = _textFieldRepairsControllerValidator;
    textFieldBodyControllerValidator = _textFieldBodyControllerValidator;
    textFieldMechanicsControllerValidator =
        _textFieldMechanicsControllerValidator;
  }

  void dispose() {
    navBarModel.dispose();
    textFieldFrameController?.dispose();
    textFieldModelNoController?.dispose();
    textFieldKmsController?.dispose();
    textFieldAdditionalController?.dispose();
    textFieldRepairsController?.dispose();
    textFieldBodyController?.dispose();
    textFieldMechanicsController?.dispose();
  }

  /// Additional helper methods are added here.

  String? get radioButtonIsSwissValue => radioButtonIsSwissController?.value;
  String? get radioButtonMaintenanceValue =>
      radioButtonMaintenanceController?.value;
  String? get radioButton17Value => radioButton17Controller?.value;
  String? get radioButton25Value => radioButton25Controller?.value;
  String? get radioButton28Value => radioButton28Controller?.value;
  String? get radioButton40Value => radioButton40Controller?.value;
  String? get radioButtonDamageValue => radioButtonDamageController?.value;
}
