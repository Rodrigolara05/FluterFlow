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
import 'register_car_step2_model.dart';
export 'register_car_step2_model.dart';

class RegisterCarStep2Widget extends StatefulWidget {
  const RegisterCarStep2Widget({
    Key? key,
    this.modelNumber,
    this.firstRegistration,
    this.editRegister,
    this.withBack,
  }) : super(key: key);

  final String? modelNumber;
  final DateTime? firstRegistration;
  final dynamic editRegister;
  final bool? withBack;

  @override
  _RegisterCarStep2WidgetState createState() => _RegisterCarStep2WidgetState();
}

class _RegisterCarStep2WidgetState extends State<RegisterCarStep2Widget> {
  late RegisterCarStep2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterCarStep2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().isRegStep2ShowMore = true;
      });
      if (FFAppState().isEditInformation) {
        _model.apiResultEdit2 = await EFDevGroup.vehicleInfoStepTwoCall.call(
          vehicleId: FFAppState().NewVehicleId,
          language: FFLocalizations.of(context).languageCode,
        );
        if (!(_model.apiResultEdit2?.succeeded ?? true)) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Test'),
                content:
                    Text((_model.apiResultEdit2?.jsonBody ?? '').toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      }
    });

    _model.textFieldFrameController ??= TextEditingController(
        text: widget.editRegister != null
            ? getJsonField(
                widget.editRegister,
                r'''$.frame''',
              ).toString().toString()
            : '');
    _model.textFieldModelNoController ??= TextEditingController(
        text: widget.editRegister != null
            ? getJsonField(
                widget.editRegister,
                r'''$.modelNumber''',
              ).toString().toString()
            : (widget.modelNumber != null && widget.modelNumber != ''
                ? widget.modelNumber
                : 'X'));
    _model.textFieldKmsController ??= TextEditingController(
        text: widget.editRegister != null
            ? functions.convertDoubleToString(
                getJsonField(
                  widget.editRegister,
                  r'''$.kilometers''',
                ),
                0)
            : '');
    _model.textFieldAdditionalController ??= TextEditingController(
        text: widget.editRegister != null
            ? getJsonField(
                widget.editRegister,
                r'''$.additionalInfo''',
              ).toString().toString()
            : '');
    _model.textFieldRepairsController ??= TextEditingController(
        text: widget.editRegister != null
            ? getJsonField(
                widget.editRegister,
                r'''$.repairs''',
              ).toString().toString()
            : '');
    _model.textFieldBodyController ??= TextEditingController(
        text: widget.editRegister != null
            ? getJsonField(
                widget.editRegister,
                r'''$.bodyDamages''',
              ).toString().toString()
            : '');
    _model.textFieldMechanicsController ??= TextEditingController(
        text: widget.editRegister != null
            ? getJsonField(
                widget.editRegister,
                r'''$.mechanics''',
              ).toString().toString()
            : '');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: valueOrDefault<bool>(
          MediaQuery.of(context).size.width <= 500.0 ? true : false,
          false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'wkm4af3k' /* Add Vehicle */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                actions: [
                  Visibility(
                    visible: !FFAppState().isEditInformation,
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.save_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        _model.apiResulSaveStep2 =
                            await EFDevGroup.updateVehicleStepTwoCall.call(
                          vehicleId: FFAppState().NewVehicleId,
                          frame: _model.textFieldFrameController.text,
                          modelNumber: _model.textFieldModelNoController.text,
                          kilometers:
                              int.tryParse(_model.textFieldKmsController.text),
                          exteriorColorId: _model.dropDownExtColorValue,
                          interiorColorId: _model.dropDownIntColorValue,
                          isSwiss: _model.radioButtonIsSwissValue ==
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Yes',
                                deText: 'Ja',
                                frText: 'Oui',
                                itText: 'Si',
                              ),
                          paintworkId: _model.dropDownPaintworkValue,
                          region: _model.dropDownRegionValue,
                          additionalInfo: functions.replaceLineBreaks(
                              _model.textFieldAdditionalController.text),
                          isGoodCondition: _model.checkboxCondition1Value,
                          isVariousTraces: _model.checkboxCondition2Value,
                          isInvolvedAccident: _model.checkboxCondition3Value,
                          isDogowner: _model.checkboxCondition4Value,
                          isSmoker: _model.checkboxCondition5Value,
                          isDamagebyhail: _model.checkboxCondition6Value,
                          keys: _model.dropDowKeysValue,
                          isDamaged: _model.radioButtonDamageValue ==
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Yes',
                                deText: 'Ja',
                                frText: 'Oui',
                                itText: 'Si',
                              ),
                          repairs: _model.textFieldRepairsController.text,
                          bodyDamages: functions.replaceLineBreaks(
                              _model.textFieldBodyController.text),
                          mechanics: _model.textFieldMechanicsController.text,
                          maintenanceRecord: _model.radioButtonMaintenanceValue,
                          creatorUserId: FFAppState().UserId,
                          isCompleteInfo: true,
                          language: FFLocalizations.of(context).languageCode,
                          lastModifierId: FFAppState().UserId,
                          firstReg: functions.convertDateTimeToJson(
                              _model.datePickerFirstRegistrationWeb),
                          inspectionDate: functions.convertDateTimeToJson(
                              _model.datePickerInspectionWeb),
                          isExportedCar: _model.checkboxCondition7Value,
                          mfk: functions
                              .convertDateTimeToJson(_model.datePickerMFKWeb),
                        );
                        if ((_model.apiResulSaveStep2?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Vehicle saved in garage ',
                                  deText: 'Fahrzeug in Garage gespeichert',
                                  frText: 'Véhicule sauvé au garage',
                                  itText: 'Veicolo salvato in garage',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed('VehiclesInGarage');
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Test'),
                                content: Text(
                                    (_model.apiResulSaveStep2?.jsonBody ?? '')
                                        .toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Error saving...',
                                  deText: 'Fehler beim Speichern...',
                                  frText: 'Erreur lors de l\'enregistrement...',
                                  itText: 'Errore durante il salvataggio...',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                        }

                        setState(() {});
                      },
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (widget.editRegister != null) {
                        context.pop();
                      } else {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x00000000),
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (bottomSheetContext) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_unfocusNode),
                              child: Padding(
                                padding: MediaQuery.of(bottomSheetContext)
                                    .viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  child: LooseProgressWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      }
                    },
                  ),
                ],
                centerTitle: true,
                elevation: 4.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 18.0, 32.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 3.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFABABAB),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 18.0, 32.0, 0.0),
                                  child: Container(
                                    width: 98.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 380.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCheckCircle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mdc3xu9m' /* Data */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: Icon(
                                                    FFIcons.kcarSport,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'd3956yuv' /* Details */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFABABAB),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: Icon(
                                                    FFIcons.kcamera,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hmyielet' /* Attachments */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFABABAB),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: Icon(
                                                    FFIcons
                                                        .kclarityCoinBagSolid,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yrmk82xj' /* Auction */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 8.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 864.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 808.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'czn30v1k' /* STEP 2 OF 4 */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '20xgxfsc' /* Car Details */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          if (!FFAppState()
                                                                  .isEditInformation &&
                                                              responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                              ))
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'rislc2nh' /* Save in Garage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                      Wrap(
                                                        spacing: 16.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 244.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '12elvmwd' /* 1st. Reg */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.datePickerFirstRegistrationWeb =
                                                                                await actions.openDatePicker(
                                                                              context,
                                                                              widget.firstRegistration != null
                                                                                  ? widget.firstRegistration!.toString()
                                                                                  : (widget.editRegister != null
                                                                                      ? (getJsonField(
                                                                                                widget.editRegister,
                                                                                                r'''$.firstReg''',
                                                                                              ) !=
                                                                                              '0001-01-01T00:00:00'
                                                                                          ? getJsonField(
                                                                                              widget.editRegister,
                                                                                              r'''$.firstReg''',
                                                                                            ).toString()
                                                                                          : getCurrentTimestamp.toString())
                                                                                      : getCurrentTimestamp.toString()),
                                                                            );
                                                                            if (_model.datePickerFirstRegistrationWeb !=
                                                                                null) {
                                                                              setState(() {
                                                                                _model.isLabel1stReg = false;
                                                                              });
                                                                            } else {
                                                                              setState(() {
                                                                                _model.isLabel1stReg = true;
                                                                              });
                                                                            }

                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              shape: BoxShape.rectangle,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 1.5,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      _model.datePickerFirstRegistrationWeb != null
                                                                                          ? functions.changeDateFormat(_model.datePickerFirstRegistrationWeb!.toString(), 0)
                                                                                          : (widget.firstRegistration != null
                                                                                              ? functions.changeDateFormat(widget.firstRegistration!.toString(), 0)
                                                                                              : (widget.editRegister != null
                                                                                                  ? (getJsonField(
                                                                                                            widget.editRegister,
                                                                                                            r'''$.firstReg''',
                                                                                                          ) !=
                                                                                                          '0001-01-01T00:00:00'
                                                                                                      ? functions.changeDateFormat(
                                                                                                          getJsonField(
                                                                                                            widget.editRegister,
                                                                                                            r'''$.firstReg''',
                                                                                                          ).toString(),
                                                                                                          0)
                                                                                                      : '')
                                                                                                  : '')),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Icon(
                                                                                      FFIcons.kcalendar,
                                                                                      color: Color(0x99ABABAB),
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (_model
                                                                    .isLabel1stReg)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8yrul036' /* Please select a date. */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 244.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '1143tmmq' /* Frame No. */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldFrameController,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .none,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmall,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x66ABABAB),
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    validator: _model
                                                                        .textFieldFrameControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[a-zA-Z0-9]'))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 244.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'plby48gf' /* Model Number */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldModelNoController,
                                                                    readOnly: widget.modelNumber !=
                                                                            null &&
                                                                        widget.modelNumber !=
                                                                            '',
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmall,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x66ABABAB),
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    validator: _model
                                                                        .textFieldModelNoControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[a-zA-Z0-9]'))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 244.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'xmv98w5y' /* Kilometers */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldKmsController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmall,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x66ABABAB),
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    validator: _model
                                                                        .textFieldKmsControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[0-9]'))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 244.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pcmc50tt' /* Exterior Color */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: EFDevGroup
                                                                        .colorListCall
                                                                        .call(
                                                                      language:
                                                                          FFLocalizations.of(context)
                                                                              .languageCode,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final dropDownExtColorColorListResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.dropDownExtColorController ??=
                                                                                FormFieldController<String>(
                                                                          _model
                                                                              .dropDownExtColorValue ??= widget.editRegister !=
                                                                                  null
                                                                              ? getJsonField(
                                                                                  widget.editRegister,
                                                                                  r'''$.exteriorColorId''',
                                                                                ).toString()
                                                                              : '',
                                                                        ),
                                                                        options: (getJsonField(
                                                                          dropDownExtColorColorListResponse
                                                                              .jsonBody,
                                                                          r'''$.items[:].id''',
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()!
                                                                            .toList(),
                                                                        optionLabels: (getJsonField(
                                                                          dropDownExtColorColorListResponse
                                                                              .jsonBody,
                                                                          r'''$.items[:].name''',
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()!
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.dropDownExtColorValue = val);
                                                                          setState(
                                                                              () {
                                                                            _model.isLabelExtColor =
                                                                                false;
                                                                          });
                                                                        },
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            40.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        fillColor:
                                                                            Colors.white,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            Color(0x66ABABAB),
                                                                        borderWidth:
                                                                            1.5,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                if (_model
                                                                    .isLabelExtColor)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '0nyg69jh' /* Please select a color. */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vgg64fru' /* Swiss Vehicle */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                            if (_model
                                                                .isLabelSwissVehicle)
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'yapm57tc' /* Required information. */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FlutterFlowRadioButton(
                                                                        options:
                                                                            [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'uwzu9s7x' /* Yes */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '9l5gms71' /* No */,
                                                                          )
                                                                        ].toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(
                                                                              () {});
                                                                          setState(
                                                                              () {
                                                                            _model.isLabelSwissVehicle =
                                                                                false;
                                                                          });
                                                                        },
                                                                        controller: _model
                                                                            .radioButtonIsSwissController ??= FormFieldController<String>(widget.editRegister !=
                                                                                null
                                                                            ? (getJsonField(
                                                                                      widget.editRegister,
                                                                                      r'''$.isSwiss''',
                                                                                    ) ==
                                                                                    true
                                                                                ? FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Yes',
                                                                                    deText: 'Ja',
                                                                                    frText: 'Oui',
                                                                                    itText: 'Sì',
                                                                                  )
                                                                                : FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'No',
                                                                                    deText: 'Nein',
                                                                                    frText: 'Non',
                                                                                    itText: 'No',
                                                                                  ))
                                                                            : ''),
                                                                        optionHeight:
                                                                            25.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        buttonPosition:
                                                                            RadioButtonPosition.left,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        radioButtonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        inactiveRadioButtonColor:
                                                                            Color(0xFF95A1AC),
                                                                        toggleable:
                                                                            false,
                                                                        horizontalAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalAlignment:
                                                                            WrapCrossAlignment.start,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 244.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '3srklq6e' /* Vehicle Paintwork */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child: FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: EFDevGroup
                                                                            .paintworkListCall
                                                                            .call(
                                                                          language:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                child: CircularProgressIndicator(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          final dropDownPaintworkPaintworkListResponse =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownPaintworkController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownPaintworkValue ??= widget.editRegister != null
                                                                                  ? getJsonField(
                                                                                      widget.editRegister,
                                                                                      r'''$.paintworkId''',
                                                                                    ).toString()
                                                                                  : '',
                                                                            ),
                                                                            options: (getJsonField(
                                                                              dropDownPaintworkPaintworkListResponse.jsonBody,
                                                                              r'''$.items[:].id''',
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList(),
                                                                            optionLabels: (getJsonField(
                                                                              dropDownPaintworkPaintworkListResponse.jsonBody,
                                                                              r'''$.items[:].name''',
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.dropDownPaintworkValue = val);
                                                                              setState(() {
                                                                                _model.isLabelPaintwork = false;
                                                                              });
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            fillColor:
                                                                                Colors.white,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0x66ABABAB),
                                                                            borderWidth:
                                                                                1.5,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .isLabelPaintwork)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '9zmd7t1y' /* Please select a color. */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 244.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm6562l2h' /* Interior Color */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child: FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: EFDevGroup
                                                                            .colorListCall
                                                                            .call(
                                                                          language:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                child: CircularProgressIndicator(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          final dropDownIntColorColorListResponse =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownIntColorController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownIntColorValue ??= widget.editRegister != null
                                                                                  ? getJsonField(
                                                                                      widget.editRegister,
                                                                                      r'''$.interiorColorId''',
                                                                                    ).toString()
                                                                                  : '',
                                                                            ),
                                                                            options: (getJsonField(
                                                                              dropDownIntColorColorListResponse.jsonBody,
                                                                              r'''$.items[:].id''',
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList(),
                                                                            optionLabels: (getJsonField(
                                                                              dropDownIntColorColorListResponse.jsonBody,
                                                                              r'''$.items[:].name''',
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.dropDownIntColorValue = val);
                                                                              setState(() {
                                                                                _model.isLabelIntColor = false;
                                                                              });
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            fillColor:
                                                                                Colors.white,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0x66ABABAB),
                                                                            borderWidth:
                                                                                1.5,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .isLabelIntColor)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '3fup503j' /* Please select a color. */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 244.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm6l5nu6f' /* Vehicle Location */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child: FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: EFDevGroup
                                                                            .regionsListCall
                                                                            .call(),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                child: CircularProgressIndicator(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          final dropDownRegionRegionsListResponse =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownRegionController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownRegionValue ??= widget.editRegister != null
                                                                                  ? getJsonField(
                                                                                      widget.editRegister,
                                                                                      r'''$.region''',
                                                                                    ).toString()
                                                                                  : '',
                                                                            ),
                                                                            options: (getJsonField(
                                                                              dropDownRegionRegionsListResponse.jsonBody,
                                                                              r'''$.items[:].regionCode''',
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList(),
                                                                            optionLabels: (getJsonField(
                                                                              dropDownRegionRegionsListResponse.jsonBody,
                                                                              r'''$.items[:].regionName''',
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.dropDownRegionValue = val);
                                                                              setState(() {
                                                                                _model.isLabelLocation = false;
                                                                              });
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            fillColor:
                                                                                Colors.white,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0x66ABABAB),
                                                                            borderWidth:
                                                                                1.5,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .isLabelLocation)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'xhxkf8ag' /* This field is required. */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'amh96um5' /* Options / Additional Informati... */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'p7rqkaf1' /* (Optional) */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldAdditionalController,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x66ABABAB),
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      maxLines:
                                                                          5,
                                                                      validator: _model
                                                                          .textFieldAdditionalControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Wrap(
                                                          spacing: 16.0,
                                                          runSpacing: 0.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wjpn2c42' /* Maintenance Record */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (_model
                                                                    .isLabelMaintenance)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm5ol73wc' /* Required information. */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      FlutterFlowRadioButton(
                                                                    options: [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'xgd65y9m' /* Available */,
                                                                      ),
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'utl2sj0l' /* Incomplete */,
                                                                      ),
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '7z5kg8gf' /* Missing */,
                                                                      )
                                                                    ].toList(),
                                                                    onChanged: (val) =>
                                                                        setState(
                                                                            () {}),
                                                                    controller: _model
                                                                        .radioButtonMaintenanceController ??= FormFieldController<String>(widget.editRegister !=
                                                                            null
                                                                        ? getJsonField(
                                                                            widget.editRegister,
                                                                            r'''$.maintenanceRecordLabel''',
                                                                          ).toString()
                                                                        : ''),
                                                                    optionHeight:
                                                                        25.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    buttonPosition:
                                                                        RadioButtonPosition
                                                                            .left,
                                                                    direction: Axis
                                                                        .vertical,
                                                                    radioButtonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveRadioButtonColor:
                                                                        Color(
                                                                            0xFF95A1AC),
                                                                    toggleable:
                                                                        false,
                                                                    horizontalAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width >=
                                                                          500.0
                                                                      ? 244.0
                                                                      : 500.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '36xb4bt2' /* Vehicle inspection date */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  _model.datePickerInspectionWeb = await actions.openDatePicker(
                                                                                    context,
                                                                                    widget.editRegister != null
                                                                                        ? (getJsonField(
                                                                                                  widget.editRegister,
                                                                                                  r'''$.inspectionDate''',
                                                                                                ) !=
                                                                                                '0001-01-01T00:00:00'
                                                                                            ? getJsonField(
                                                                                                widget.editRegister,
                                                                                                r'''$.inspectionDate''',
                                                                                              ).toString()
                                                                                            : getCurrentTimestamp.toString())
                                                                                        : getCurrentTimestamp.toString(),
                                                                                  );
                                                                                  if (_model.datePickerInspectionWeb != null) {
                                                                                    setState(() {
                                                                                      _model.isLabelInspection = false;
                                                                                    });
                                                                                  } else {
                                                                                    setState(() {
                                                                                      _model.isLabelInspection = true;
                                                                                    });
                                                                                  }

                                                                                  setState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    shape: BoxShape.rectangle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 1.5,
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          _model.datePickerInspectionWeb != null
                                                                                              ? functions.changeDateFormat(_model.datePickerInspectionWeb!.toString(), 0)
                                                                                              : (widget.editRegister != null
                                                                                                  ? (getJsonField(
                                                                                                            widget.editRegister,
                                                                                                            r'''$.inspectionDate''',
                                                                                                          ) !=
                                                                                                          '0001-01-01T00:00:00'
                                                                                                      ? functions.changeDateFormat(
                                                                                                          getJsonField(
                                                                                                            widget.editRegister,
                                                                                                            r'''$.inspectionDate''',
                                                                                                          ).toString(),
                                                                                                          0)
                                                                                                      : '')
                                                                                                  : ''),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                        child: Icon(
                                                                                          FFIcons.kcalendar,
                                                                                          color: Color(0x99ABABAB),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (_model
                                                                          .isLabelInspection)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'h51bb16v' /* Please select a date. */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'wrkmbhtc' /* General Condition */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'c00rojwp' /* (Optional) */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Wrap(
                                                                  spacing: 0.0,
                                                                  runSpacing:
                                                                      0.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.checkboxCondition1Value ??= widget.editRegister != null
                                                                                      ? getJsonField(
                                                                                          widget.editRegister,
                                                                                          r'''$.isGoodCondition''',
                                                                                        )
                                                                                      : false,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.checkboxCondition1Value = newValue!);
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'gg3rckii' /* Generally good condition */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.checkboxCondition2Value ??= widget.editRegister != null
                                                                                      ? getJsonField(
                                                                                          widget.editRegister,
                                                                                          r'''$.isVariousTraces''',
                                                                                        )
                                                                                      : false,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.checkboxCondition2Value = newValue!);
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '06fn9kzu' /* Various trace of use */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.checkboxCondition3Value ??= widget.editRegister != null
                                                                                      ? getJsonField(
                                                                                          widget.editRegister,
                                                                                          r'''$.isInvolvedAccident''',
                                                                                        )
                                                                                      : false,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.checkboxCondition3Value = newValue!);
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'vopqoyfz' /* Vehicle involved in accident */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.checkboxCondition4Value ??= widget.editRegister != null
                                                                                      ? getJsonField(
                                                                                          widget.editRegister,
                                                                                          r'''$.isDogowner''',
                                                                                        )
                                                                                      : false,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.checkboxCondition4Value = newValue!);
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'tqyt6qbf' /* Dog owner */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Theme(
                                                                              data: ThemeData(
                                                                                checkboxTheme: CheckboxThemeData(
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                              ),
                                                                              child: Checkbox(
                                                                                value: _model.checkboxCondition5Value ??= widget.editRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.editRegister,
                                                                                        r'''$.isSmoker''',
                                                                                      )
                                                                                    : false,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.checkboxCondition5Value = newValue!);
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'y4zhad6u' /* Smoker's Vehicle */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Theme(
                                                                              data: ThemeData(
                                                                                checkboxTheme: CheckboxThemeData(
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                              ),
                                                                              child: Checkbox(
                                                                                value: _model.checkboxCondition6Value ??= widget.editRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.editRegister,
                                                                                        r'''$.isDamagebyhail''',
                                                                                      )
                                                                                    : false,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.checkboxCondition6Value = newValue!);
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'x2mrwf8o' /* Damage by hail */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Theme(
                                                                              data: ThemeData(
                                                                                checkboxTheme: CheckboxThemeData(
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                              ),
                                                                              child: Checkbox(
                                                                                value: _model.checkboxCondition7Value ??= widget.editRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.editRegister,
                                                                                        r'''$.isExportedCar''',
                                                                                      )
                                                                                    : false,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.checkboxCondition7Value = newValue!);
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'uggzkms8' /* Exported car */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Wrap(
                                                          spacing: 0.0,
                                                          runSpacing: 0.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width >=
                                                                      500.0
                                                                  ? 244.0
                                                                  : 500.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4v9i3b4k' /* Number of keys */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .dropDowKeysController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .dropDowKeysValue ??= widget.editRegister !=
                                                                                null
                                                                            ? getJsonField(
                                                                                widget.editRegister,
                                                                                r'''$.keys''',
                                                                              ).toString()
                                                                            : '',
                                                                      ),
                                                                      options: [
                                                                        '1',
                                                                        '2',
                                                                        '3',
                                                                        '4'
                                                                      ],
                                                                      optionLabels: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '19d18ksl' /* 1 */,
                                                                        ),
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'cv2jhbdn' /* 2 */,
                                                                        ),
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '9dd405mz' /* 3 */,
                                                                        ),
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fvu3thwz' /* 4 */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) async {
                                                                        setState(() =>
                                                                            _model.dropDowKeysValue =
                                                                                val);
                                                                        setState(
                                                                            () {
                                                                          _model.isLabelNkeys =
                                                                              false;
                                                                        });
                                                                      },
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          Color(
                                                                              0x66ABABAB),
                                                                      borderWidth:
                                                                          1.5,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isSearchable:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                      .isLabelNkeys)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5kv1qaqo' /* This field is required. */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width >=
                                                                      500.0
                                                                  ? 244.0
                                                                  : 500.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nu9gsmtz' /* MFK */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.datePickerMFKWeb = await actions.openDatePicker(
                                                                                context,
                                                                                widget.editRegister != null
                                                                                    ? (getJsonField(
                                                                                              widget.editRegister,
                                                                                              r'''$.mfk''',
                                                                                            ) !=
                                                                                            '0001-01-01T00:00:00'
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.mfk''',
                                                                                          ).toString()
                                                                                        : getCurrentTimestamp.toString())
                                                                                    : getCurrentTimestamp.toString(),
                                                                              );
                                                                              if (_model.datePickerMFKWeb != null) {
                                                                                setState(() {
                                                                                  _model.isLabelMfk = false;
                                                                                });
                                                                              } else {
                                                                                setState(() {
                                                                                  _model.isLabelMfk = true;
                                                                                });
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                shape: BoxShape.rectangle,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  width: 1.5,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      _model.datePickerMFKWeb != null
                                                                                          ? functions.changeDateFormat(_model.datePickerMFKWeb!.toString(), 0)
                                                                                          : (widget.editRegister != null
                                                                                              ? (getJsonField(
                                                                                                        widget.editRegister,
                                                                                                        r'''$.mfk''',
                                                                                                      ) !=
                                                                                                      '0001-01-01T00:00:00'
                                                                                                  ? functions.changeDateFormat(
                                                                                                      getJsonField(
                                                                                                        widget.editRegister,
                                                                                                        r'''$.mfk''',
                                                                                                      ).toString(),
                                                                                                      0)
                                                                                                  : '')
                                                                                              : ''),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Icon(
                                                                                      FFIcons.kcalendar,
                                                                                      color: Color(0x99ABABAB),
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (_model
                                                                      .isLabelMfk)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'mqv5z4mw' /* Please select a date. */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: EFDevGroup
                                                              .getWidgetsDescriptionsCall
                                                              .call(
                                                            vehicleId:
                                                                FFAppState()
                                                                    .NewVehicleId,
                                                            language:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final widgetsMGetWidgetsDescriptionsResponse =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'WidgetsList');
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'cb1cybhu' /* Selected Widgets */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                          ),
                                                                        ),
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .plusCircle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    height:
                                                                        16.0,
                                                                    thickness:
                                                                        1.0,
                                                                  ),
                                                                  ClipRRect(
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          if (FFAppState()
                                                                              .isRegStep2ShowMore)
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final widgetList = functions
                                                                                    .verifyNullList(getJsonField(
                                                                                      widgetsMGetWidgetsDescriptionsResponse.jsonBody,
                                                                                      r'''$.widgetList''',
                                                                                    ))
                                                                                    .toList()
                                                                                    .take(10)
                                                                                    .toList();
                                                                                if (widgetList.isEmpty) {
                                                                                  return Center(
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/car.svg',
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: widgetList.length,
                                                                                  itemBuilder: (context, widgetListIndex) {
                                                                                    final widgetListItem = widgetList[widgetListIndex];
                                                                                    return Text(
                                                                                      getJsonField(
                                                                                        widgetListItem,
                                                                                        r'''$.value''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          if (!FFAppState()
                                                                              .isRegStep2ShowMore)
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final widgetListLong = functions
                                                                                    .verifyNullList(getJsonField(
                                                                                      widgetsMGetWidgetsDescriptionsResponse.jsonBody,
                                                                                      r'''$.widgetList''',
                                                                                    ))
                                                                                    .toList();
                                                                                if (widgetListLong.isEmpty) {
                                                                                  return Center(
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/car-red.svg',
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: widgetListLong.length,
                                                                                  itemBuilder: (context, widgetListLongIndex) {
                                                                                    final widgetListLongItem = widgetListLong[widgetListLongIndex];
                                                                                    return Text(
                                                                                      getJsonField(
                                                                                        widgetListLongItem,
                                                                                        r'''$.value''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((getJsonField(
                                                                                widgetsMGetWidgetsDescriptionsResponse.jsonBody,
                                                                                r'''$.widgetList''',
                                                                              ) !=
                                                                              null) &&
                                                                          (functions.getCountList(getJsonField(
                                                                                widgetsMGetWidgetsDescriptionsResponse.jsonBody,
                                                                                r'''$.widgetList''',
                                                                              )) >
                                                                              10))
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                if (FFAppState().isRegStep2ShowMore) {
                                                                                  setState(() {
                                                                                    FFAppState().isRegStep2ShowMore = false;
                                                                                  });
                                                                                } else {
                                                                                  setState(() {
                                                                                    FFAppState().isRegStep2ShowMore = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: Text(
                                                                                FFAppState().isRegStep2ShowMore
                                                                                    ? valueOrDefault<String>(
                                                                                        FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'Show More',
                                                                                          deText: 'Zeig mehr',
                                                                                          frText: 'Montre plus',
                                                                                          itText: 'Mostra di più',
                                                                                        ),
                                                                                        'Zeig mehr',
                                                                                      )
                                                                                    : valueOrDefault<String>(
                                                                                        FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'Show Less',
                                                                                          deText: 'Zeige weniger',
                                                                                          frText: 'Montrer moins',
                                                                                          itText: 'Mostra meno',
                                                                                        ),
                                                                                        'Zeige weniger',
                                                                                      ),
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vxxkr7ck' /* Widgets */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'ebln3ks6' /* (Optional) */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  height: 16.0,
                                                                  thickness:
                                                                      1.0,
                                                                ),
                                                                ClipRRect(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            FutureBuilder<ApiCallResponse>(
                                                                              future: EFDevGroup.getWidgetsPropertiesCall.call(
                                                                                vehicleId: FFAppState().NewVehicleId,
                                                                                language: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 35.0,
                                                                                      height: 35.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final rowGetWidgetsPropertiesResponse = snapshot.data!;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                        child: ListView(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox01Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[0].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox01Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '5ykfplhf' /* 360° camera */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox02Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[1].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox02Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'j13cw9i6' /* Active brake assistant */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox03Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[2].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox03Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '5zsu360u' /* Android Auto */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'otptvk2t' /* Trailer hitch */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox05Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[4].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox05Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'wrbh847t' /* Detachable trailer hitch */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox06Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[5].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox06Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'd18df6xq' /* Fixed trailer hitch */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox07Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[6].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox07Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'bpeo84jk' /* Swiveling trailer hitch */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox08Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[7].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox08Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'fvsvklrx' /* Apple CarPlay */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'dq260ggf' /* Tires */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox10Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[9].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox10Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '51yrelwb' /* 4 Winter Tyres */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox11Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[10].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox11Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'xa8m69ev' /* Alloy wheels */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox12Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[11].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox12Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'fsifkv0u' /* Steel rims */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox13Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[12].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox13Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'v2lbp219' /* Summer tires */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox14Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[13].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox14Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'bjbvp2p9' /* Winter tires */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox15Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[14].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox15Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'lynjyvhj' /* Bluetooth interface */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox16Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[15].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox16Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '8fy8bw3u' /* DAB-Radio */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'o65er9h6' /* Roof type */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    child: FlutterFlowRadioButton(
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'c38teyyf' /* Sunroof */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'eplsk03y' /* Panoramic roof */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '1ydt9lwu' /* Panoramic sunroof */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'vkyrnv4b' /* Soft top/hard top */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'o5txar00' /* Folding roof */,
                                                                                                        )
                                                                                                      ].toList(),
                                                                                                      onChanged: (val) => setState(() {}),
                                                                                                      controller: _model.radioButton17Controller ??= FormFieldController<String>(getJsonField(
                                                                                                                rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                r'''$.widgetList''',
                                                                                                              ) !=
                                                                                                              null
                                                                                                          ? getJsonField(
                                                                                                              rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                              r'''$.widgetList[16].value''',
                                                                                                            ).toString()
                                                                                                          : ''),
                                                                                                      optionHeight: 25.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                      buttonPosition: RadioButtonPosition.left,
                                                                                                      direction: Axis.vertical,
                                                                                                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                                      inactiveRadioButtonColor: Color(0xFF95A1AC),
                                                                                                      toggleable: true,
                                                                                                      horizontalAlignment: WrapAlignment.start,
                                                                                                      verticalAlignment: WrapCrossAlignment.start,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox18Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[17].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox18Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '0t10uom7' /* Differential lock */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox19Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[18].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox19Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'pg41smwg' /* Distance controller */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox20Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[19].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox20Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '94i7a10p' /* Electric tailgate */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox21Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[20].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox21Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'vcd7udtv' /* Electrical seat-adjustment */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox22Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[21].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox22Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'xe4i80gi' /* Hands-free device */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox23Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[22].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox23Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'kzcz2edw' /* Head-up-Display */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox24Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[23].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox24Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '6049g2h5' /* Isofix */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '0bh8ptkk' /* Air conditioning */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    child: FlutterFlowRadioButton(
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '4nz5t7h0' /* Automatically */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'zxl5mf7c' /* Manually */,
                                                                                                        )
                                                                                                      ].toList(),
                                                                                                      onChanged: (val) => setState(() {}),
                                                                                                      controller: _model.radioButton25Controller ??= FormFieldController<String>(getJsonField(
                                                                                                                rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                r'''$.widgetList''',
                                                                                                              ) !=
                                                                                                              null
                                                                                                          ? getJsonField(
                                                                                                              rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                              r'''$.widgetList[24].value''',
                                                                                                            ).toString()
                                                                                                          : ''),
                                                                                                      optionHeight: 25.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                      buttonPosition: RadioButtonPosition.left,
                                                                                                      direction: Axis.vertical,
                                                                                                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                                      inactiveRadioButtonColor: Color(0xFF95A1AC),
                                                                                                      toggleable: true,
                                                                                                      horizontalAlignment: WrapAlignment.start,
                                                                                                      verticalAlignment: WrapCrossAlignment.start,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                        child: ListView(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox26Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[25].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox26Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'hj9zy1co' /* Cornering light */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox27Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[26].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox27Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'i3aci6q4' /* Air suspension */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'abhtqsaw' /* Navigation system */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    child: FlutterFlowRadioButton(
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'orzsf7c4' /* Built-in */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'zfg14kq0' /* Portable */,
                                                                                                        )
                                                                                                      ].toList(),
                                                                                                      onChanged: (val) => setState(() {}),
                                                                                                      controller: _model.radioButton28Controller ??= FormFieldController<String>(getJsonField(
                                                                                                                rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                r'''$.widgetList''',
                                                                                                              ) !=
                                                                                                              null
                                                                                                          ? getJsonField(
                                                                                                              rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                              r'''$.widgetList[27].value''',
                                                                                                            ).toString()
                                                                                                          : ''),
                                                                                                      optionHeight: 25.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                      buttonPosition: RadioButtonPosition.left,
                                                                                                      direction: Axis.vertical,
                                                                                                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                                      inactiveRadioButtonColor: Color(0xFF95A1AC),
                                                                                                      toggleable: true,
                                                                                                      horizontalAlignment: WrapAlignment.start,
                                                                                                      verticalAlignment: WrapCrossAlignment.start,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox29Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[28].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox29Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'lz8kbc9w' /* Parking assistance */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox30Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[29].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox30Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '1oy21290' /* Rear parking sensors */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox31Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[30].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox31Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '9mmz4neo' /* Parking sensors in front */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox32Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[31].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox32Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'lu60poqk' /* Backup camera */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'fvgjqqrp' /* Headlight */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox34Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[33].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox34Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '3bhrj2mm' /* LED */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox35Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[34].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox35Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'g9q3lbeq' /* Laser */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkbox36Value ??= getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList''',
                                                                                                                        ) !=
                                                                                                                        null
                                                                                                                    ? (getJsonField(
                                                                                                                          rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                          r'''$.widgetList[35].value''',
                                                                                                                        ) ==
                                                                                                                        'true')
                                                                                                                    : false,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  setState(() => _model.checkbox36Value = newValue!);
                                                                                                                },
                                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '0ae8shiu' /* Xenon */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox37Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[36].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox37Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '8gjltgqj' /* Sliding door */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox38Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[37].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox38Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '4d0xdf8k' /* Keyless Entry/Start */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox39Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[38].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox39Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '987g3i1m' /* Fast charging function */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'g0n5m720' /* Seat covers */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w900,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    child: FlutterFlowRadioButton(
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '1r3epmp9' /* Alcantara */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'a5zepuea' /* Leather */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '52d0m4uz' /* Material */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'cqmumc2k' /* Part leather */,
                                                                                                        )
                                                                                                      ].toList(),
                                                                                                      onChanged: (val) => setState(() {}),
                                                                                                      controller: _model.radioButton40Controller ??= FormFieldController<String>(getJsonField(
                                                                                                                rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                r'''$.widgetList''',
                                                                                                              ) !=
                                                                                                              null
                                                                                                          ? getJsonField(
                                                                                                              rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                              r'''$.widgetList[39].value''',
                                                                                                            ).toString()
                                                                                                          : ''),
                                                                                                      optionHeight: 25.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                      buttonPosition: RadioButtonPosition.left,
                                                                                                      direction: Axis.vertical,
                                                                                                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                                      inactiveRadioButtonColor: Color(0xFF95A1AC),
                                                                                                      toggleable: true,
                                                                                                      horizontalAlignment: WrapAlignment.start,
                                                                                                      verticalAlignment: WrapCrossAlignment.start,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox41Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[40].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox41Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'z8codgwa' /* Seat heating */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox42Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[41].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox42Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        's9tx24pa' /* Sports seats */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox43Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[42].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox43Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'klfrntvu' /* Lane Departure Warning */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox44Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[43].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox44Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'g3qzczt9' /* Stability control */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox45Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[44].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox45Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'nhiemcuk' /* Parking heater */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox46Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[45].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox46Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'i4anbw1q' /* Start/Stop System */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox47Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[46].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox47Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '5b2k4akb' /* Cruise control */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                      child: Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkbox48Value ??= getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? (getJsonField(
                                                                                                                    rowGetWidgetsPropertiesResponse.jsonBody,
                                                                                                                    r'''$.widgetList[47].value''',
                                                                                                                  ) ==
                                                                                                                  'true')
                                                                                                              : false,
                                                                                                          onChanged: (newValue) async {
                                                                                                            setState(() => _model.checkbox48Value = newValue!);
                                                                                                          },
                                                                                                          activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '26cnvudz' /* Blind Spot Assist */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          constraints: BoxConstraints(
                                            maxWidth: 808.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  16.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ss6rop56' /* Vehicle Damage */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                      ),
                                                    ),
                                                    Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment: WrapAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.center,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Container(
                                                            width: 244.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                FlutterFlowRadioButton(
                                                                  options: [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'emom9ivf' /* Yes */,
                                                                    ),
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'od96boad' /* No */,
                                                                    )
                                                                  ].toList(),
                                                                  onChanged: (val) =>
                                                                      setState(
                                                                          () {}),
                                                                  controller: _model
                                                                      .radioButtonDamageController ??= FormFieldController<String>(widget
                                                                              .editRegister !=
                                                                          null
                                                                      ? (getJsonField(
                                                                                widget.editRegister,
                                                                                r'''$.isDamaged''',
                                                                              ) ==
                                                                              true
                                                                          ? FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                              enText: 'Yes',
                                                                              deText: 'Ja',
                                                                              frText: 'Oui',
                                                                              itText: 'Si',
                                                                            )
                                                                          : FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                              enText: 'No',
                                                                              deText: 'Nein',
                                                                              frText: 'Non',
                                                                              itText: 'No',
                                                                            ))
                                                                      : ''),
                                                                  optionHeight:
                                                                      25.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Colors
                                                                            .black,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      Color(
                                                                          0x8A000000),
                                                                  toggleable:
                                                                      false,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: _model.radioButtonDamageValue !=
                                                                      null &&
                                                                  _model.radioButtonDamageValue !=
                                                                      ''
                                                              ? (_model
                                                                      .radioButtonDamageValue ==
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Yes',
                                                                    deText:
                                                                        'Ja',
                                                                    frText:
                                                                        'Oui',
                                                                    itText:
                                                                        'Sì',
                                                                  ))
                                                              : (widget.editRegister !=
                                                                      null
                                                                  ? (getJsonField(
                                                                        widget
                                                                            .editRegister,
                                                                        r'''$.isDamaged''',
                                                                      ) ==
                                                                      true)
                                                                  : false),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 244.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0cp21ymb' /* Repairs */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldRepairsController,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x66ABABAB),
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      keyboardType: const TextInputType
                                                                              .numberWithOptions(
                                                                          signed:
                                                                              true,
                                                                          decimal:
                                                                              true),
                                                                      validator: _model
                                                                          .textFieldRepairsControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter.allow(
                                                                            RegExp('\\d*\\.?\\d*'))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment: WrapAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Visibility(
                                                          visible: _model.radioButtonDamageValue !=
                                                                      null &&
                                                                  _model.radioButtonDamageValue !=
                                                                      ''
                                                              ? (_model
                                                                      .radioButtonDamageValue ==
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Yes',
                                                                    deText:
                                                                        'Ja',
                                                                    frText:
                                                                        'Oui',
                                                                    itText:
                                                                        'Sì',
                                                                  ))
                                                              : (widget.editRegister !=
                                                                      null
                                                                  ? (getJsonField(
                                                                        widget
                                                                            .editRegister,
                                                                        r'''$.isDamaged''',
                                                                      ) ==
                                                                      true)
                                                                  : false),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 378.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'uvijp7zl' /* Body */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldBodyController,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x66ABABAB),
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      maxLines:
                                                                          5,
                                                                      validator: _model
                                                                          .textFieldBodyControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: _model.radioButtonDamageValue !=
                                                                      null &&
                                                                  _model.radioButtonDamageValue !=
                                                                      ''
                                                              ? (_model
                                                                      .radioButtonDamageValue ==
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Yes',
                                                                    deText:
                                                                        'Ja',
                                                                    frText:
                                                                        'Oui',
                                                                    itText:
                                                                        'Sì',
                                                                  ))
                                                              : (widget.editRegister !=
                                                                      null
                                                                  ? (getJsonField(
                                                                        widget
                                                                            .editRegister,
                                                                        r'''$.isDamaged''',
                                                                      ) ==
                                                                      true)
                                                                  : false),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width >=
                                                                    500.0
                                                                ? 378.0
                                                                : 500.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ya9wnor3' /* Mechanics */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldMechanicsController,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x66ABABAB),
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      maxLines:
                                                                          5,
                                                                      validator: _model
                                                                          .textFieldMechanicsControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 808.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 424.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (widget.editRegister != null) {
                                          FFAppState().update(() {
                                            FFAppState().isEditInformation =
                                                false;
                                          });
                                          context.pop();
                                        } else {
                                          _model.apiResultBackStep2 =
                                              await EFDevGroup
                                                  .updateVehicleStepTwoCall
                                                  .call(
                                            vehicleId:
                                                FFAppState().NewVehicleId,
                                            frame: _model
                                                .textFieldFrameController.text,
                                            modelNumber: _model
                                                .textFieldModelNoController
                                                .text,
                                            exteriorColorId:
                                                _model.dropDownExtColorValue,
                                            interiorColorId:
                                                _model.dropDownIntColorValue,
                                            isSwiss: _model
                                                    .radioButtonIsSwissValue ==
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText: 'Yes',
                                                  deText: 'Ja',
                                                  frText: 'Oui',
                                                  itText: 'Si',
                                                ),
                                            paintworkId:
                                                _model.dropDownPaintworkValue,
                                            region: _model.dropDownRegionValue,
                                            additionalInfo: functions
                                                .replaceLineBreaks(_model
                                                    .textFieldAdditionalController
                                                    .text),
                                            isGoodCondition:
                                                _model.checkboxCondition1Value,
                                            isVariousTraces:
                                                _model.checkboxCondition2Value,
                                            isInvolvedAccident:
                                                _model.checkboxCondition3Value,
                                            isDogowner:
                                                _model.checkboxCondition4Value,
                                            isSmoker:
                                                _model.checkboxCondition5Value,
                                            isDamagebyhail:
                                                _model.checkboxCondition6Value,
                                            keys: _model.dropDowKeysValue,
                                            isDamaged:
                                                _model.radioButtonDamageValue ==
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: 'Yes',
                                                      deText: 'Ja',
                                                      frText: 'Oui',
                                                      itText: 'Si',
                                                    ),
                                            repairs: _model
                                                .textFieldRepairsController
                                                .text,
                                            bodyDamages: functions
                                                .replaceLineBreaks(_model
                                                    .textFieldBodyController
                                                    .text),
                                            mechanics: functions
                                                .replaceLineBreaks(_model
                                                    .textFieldMechanicsController
                                                    .text),
                                            maintenanceRecord: _model
                                                .radioButtonMaintenanceValue,
                                            creatorUserId: FFAppState().UserId,
                                            isCompleteInfo: false,
                                            lastModifierId: FFAppState().UserId,
                                            language:
                                                FFLocalizations.of(context)
                                                    .languageCode,
                                            kilometers: int.tryParse(_model
                                                .textFieldKmsController.text),
                                            firstReg: _model
                                                        .datePickerFirstRegistrationWeb !=
                                                    null
                                                ? functions
                                                    .convertDateTimeToJson(_model
                                                        .datePickerFirstRegistrationWeb)
                                                : null,
                                            inspectionDate: _model
                                                        .datePickerInspectionWeb !=
                                                    null
                                                ? functions
                                                    .convertDateTimeToJson(_model
                                                        .datePickerInspectionWeb)
                                                : null,
                                            isExportedCar:
                                                _model.checkboxCondition7Value,
                                            mfk: _model.datePickerMFKWeb != null
                                                ? functions
                                                    .convertDateTimeToJson(
                                                        _model.datePickerMFKWeb)
                                                : null,
                                          );
                                          if ((_model.apiResultBackStep2
                                                  ?.succeeded ??
                                              true)) {
                                            context.pop();
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Test'),
                                                  content: Text(
                                                      (_model.apiResultBackStep2
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Error saving',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'upzmb4d2' /* Back */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Color(0xFFC5181D),
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFFC5181D),
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((_model.textFieldFrameController.text != null &&
                                                _model.textFieldFrameController.text !=
                                                    '') &&
                                            (_model.textFieldModelNoController.text != null &&
                                                _model.textFieldModelNoController.text !=
                                                    '') &&
                                            (_model.textFieldKmsController.text != null &&
                                                _model.textFieldKmsController.text !=
                                                    '') &&
                                            (_model.dropDownExtColorValue != null &&
                                                _model.dropDownExtColorValue !=
                                                    '') &&
                                            (_model.dropDownIntColorValue != null &&
                                                _model.dropDownIntColorValue !=
                                                    '') &&
                                            (_model.dropDownPaintworkValue != null &&
                                                _model.dropDownPaintworkValue !=
                                                    '') &&
                                            (_model.radioButtonIsSwissValue != null &&
                                                _model.radioButtonIsSwissValue !=
                                                    '') &&
                                            (_model.radioButtonDamageValue ==
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: 'Yes',
                                                      deText: 'Ja',
                                                      frText: 'Oui',
                                                      itText: 'Si',
                                                    )
                                                ? ((_model.textFieldRepairsController.text != null && _model.textFieldRepairsController.text != '') &&
                                                    (_model.textFieldBodyController.text != null &&
                                                        _model.textFieldBodyController.text !=
                                                            '') &&
                                                    (_model.textFieldMechanicsController.text != null &&
                                                        _model.textFieldMechanicsController.text !=
                                                            ''))
                                                : (_model.radioButtonDamageValue != null &&
                                                    _model.radioButtonDamageValue !=
                                                        '')) &&
                                            (_model.dropDowKeysValue != null &&
                                                _model.dropDowKeysValue != '') &&
                                            (widget.firstRegistration == null ? (_model.datePickerFirstRegistrationWeb == null ? (widget.editRegister != null) : true) : true) &&
                                            (_model.dropDownRegionValue != null && _model.dropDownRegionValue != '') &&
                                            (_model.datePickerInspectionWeb == null ? (widget.editRegister != null) : true) &&
                                            (_model.datePickerMFKWeb == null ? (widget.editRegister != null) : true)) {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          _model.apiResultNextStep2 =
                                              await EFDevGroup
                                                  .updateVehicleStepTwoCall
                                                  .call(
                                            vehicleId:
                                                FFAppState().NewVehicleId,
                                            frame: _model
                                                .textFieldFrameController.text,
                                            modelNumber: _model
                                                .textFieldModelNoController
                                                .text,
                                            kilometers: int.tryParse(_model
                                                .textFieldKmsController.text),
                                            exteriorColorId:
                                                _model.dropDownExtColorValue,
                                            interiorColorId:
                                                _model.dropDownIntColorValue,
                                            isSwiss: _model
                                                    .radioButtonIsSwissValue ==
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText: 'Yes',
                                                  deText: 'Ja',
                                                  frText: 'Oui',
                                                  itText: 'Si',
                                                ),
                                            paintworkId:
                                                _model.dropDownPaintworkValue,
                                            region: _model.dropDownRegionValue,
                                            additionalInfo: functions
                                                .replaceLineBreaks(_model
                                                    .textFieldAdditionalController
                                                    .text),
                                            isGoodCondition:
                                                _model.checkboxCondition1Value,
                                            isVariousTraces:
                                                _model.checkboxCondition2Value,
                                            isInvolvedAccident:
                                                _model.checkboxCondition3Value,
                                            isDogowner:
                                                _model.checkboxCondition4Value,
                                            isSmoker:
                                                _model.checkboxCondition5Value,
                                            isDamagebyhail:
                                                _model.checkboxCondition6Value,
                                            keys: _model.dropDowKeysValue,
                                            isDamaged:
                                                _model.radioButtonDamageValue ==
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: 'Yes',
                                                      deText: 'Ja',
                                                      frText: 'Oui',
                                                      itText: 'Si',
                                                    ),
                                            repairs: _model
                                                .textFieldRepairsController
                                                .text,
                                            bodyDamages: functions
                                                .replaceLineBreaks(_model
                                                    .textFieldBodyController
                                                    .text),
                                            mechanics: functions
                                                .replaceLineBreaks(_model
                                                    .textFieldMechanicsController
                                                    .text),
                                            maintenanceRecord: _model
                                                .radioButtonMaintenanceValue,
                                            creatorUserId: FFAppState().UserId,
                                            isCompleteInfo: false,
                                            language:
                                                FFLocalizations.of(context)
                                                    .languageCode,
                                            lastModifierId: FFAppState().UserId,
                                            firstReg: _model
                                                        .datePickerFirstRegistrationWeb !=
                                                    null
                                                ? functions
                                                    .convertDateTimeToJson(_model
                                                        .datePickerFirstRegistrationWeb)
                                                : (widget.editRegister != null
                                                    ? getJsonField(
                                                        widget.editRegister,
                                                        r'''$.firstReg''',
                                                      ).toString()
                                                    : (widget.firstRegistration !=
                                                            null
                                                        ? functions
                                                            .convertDateTimeToJson(
                                                                widget
                                                                    .firstRegistration)
                                                        : functions
                                                            .convertDateTimeToJson(
                                                                getCurrentTimestamp))),
                                            inspectionDate: _model
                                                        .datePickerInspectionWeb !=
                                                    null
                                                ? functions
                                                    .convertDateTimeToJson(_model
                                                        .datePickerInspectionWeb)
                                                : (widget.editRegister != null
                                                    ? getJsonField(
                                                        widget.editRegister,
                                                        r'''$.inspectionDate''',
                                                      ).toString()
                                                    : functions
                                                        .convertDateTimeToJson(
                                                            _model
                                                                .datePickerInspectionWeb)),
                                            isExportedCar:
                                                _model.checkboxCondition7Value,
                                            mfk: _model.datePickerMFKWeb != null
                                                ? functions
                                                    .convertDateTimeToJson(
                                                        _model.datePickerMFKWeb)
                                                : (widget.editRegister != null
                                                    ? getJsonField(
                                                        widget.editRegister,
                                                        r'''$.mfk''',
                                                      ).toString()
                                                    : functions
                                                        .convertDateTimeToJson(
                                                            _model
                                                                .datePickerMFKWeb)),
                                          );
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              500.0) {
                                            _model.apiResultNextWidget =
                                                await EFDevGroup.saveWidgetsCall
                                                    .call(
                                              vehicleId:
                                                  FFAppState().NewVehicleId,
                                              language:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                              check01:
                                                  _model.checkbox01Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check02:
                                                  _model.checkbox02Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check03:
                                                  _model.checkbox03Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check04: false.toString(),
                                              check05:
                                                  _model.checkbox05Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check06:
                                                  _model.checkbox06Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check07:
                                                  _model.checkbox07Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check08:
                                                  _model.checkbox08Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check09: false.toString(),
                                              check10:
                                                  _model.checkbox10Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check11:
                                                  _model.checkbox11Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check12:
                                                  _model.checkbox12Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check13:
                                                  _model.checkbox13Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check14:
                                                  _model.checkbox14Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check15:
                                                  _model.checkbox15Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check16:
                                                  _model.checkbox16Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check17:
                                                  _model.radioButton17Value,
                                              check18:
                                                  _model.checkbox18Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check19:
                                                  _model.checkbox19Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check20:
                                                  _model.checkbox20Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check21:
                                                  _model.checkbox21Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check22:
                                                  _model.checkbox22Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check23:
                                                  _model.checkbox23Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check24:
                                                  _model.checkbox24Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check25:
                                                  _model.radioButton25Value,
                                              check26:
                                                  _model.checkbox26Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check27:
                                                  _model.checkbox27Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check28:
                                                  _model.radioButton28Value,
                                              check29:
                                                  _model.checkbox29Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check30:
                                                  _model.checkbox30Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check31:
                                                  _model.checkbox31Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check32:
                                                  _model.checkbox32Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check33: false.toString(),
                                              check34:
                                                  _model.checkbox34Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check35:
                                                  _model.checkbox35Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check36:
                                                  _model.checkbox36Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check37:
                                                  _model.checkbox37Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check38:
                                                  _model.checkbox38Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check39:
                                                  _model.checkbox39Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check40:
                                                  _model.radioButton40Value,
                                              check41:
                                                  _model.checkbox41Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check42:
                                                  _model.checkbox42Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check43:
                                                  _model.checkbox43Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check44:
                                                  _model.checkbox44Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check45:
                                                  _model.checkbox45Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check46:
                                                  _model.checkbox46Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check47:
                                                  _model.checkbox47Value == true
                                                      ? 'true'
                                                      : 'false',
                                              check48:
                                                  _model.checkbox48Value == true
                                                      ? 'true'
                                                      : 'false',
                                            );
                                          }
                                          if ((_model.apiResultNextStep2
                                                      ?.succeeded ??
                                                  true) &&
                                              (_model.apiResultNextWidget
                                                      ?.succeeded ??
                                                  true)) {
                                            if (widget.editRegister != null) {
                                              FFAppState().update(() {
                                                FFAppState().isEditInformation =
                                                    false;
                                              });
                                              if ((widget.withBack != null) &&
                                                  widget.withBack!) {
                                                context.pushNamed(
                                                  'RegisterCar_step3',
                                                  queryParams: {
                                                    'isDamaged': serializeParam(
                                                      _model
                                                              .radioButtonDamageValue ==
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText: 'Yes',
                                                            deText: 'Ja',
                                                            frText: 'Oui',
                                                            itText: 'Si',
                                                          ),
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed('Preview');
                                              }
                                            } else {
                                              context.pushNamed(
                                                'RegisterCar_step3',
                                                queryParams: {
                                                  'isDamaged': serializeParam(
                                                    _model
                                                            .radioButtonDamageValue ==
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText: 'Yes',
                                                          deText: 'Ja',
                                                          frText: 'Oui',
                                                          itText: 'Si',
                                                        ),
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Test'),
                                                  content: Text(
                                                      (_model.apiResultNextStep2
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            await actions.snackbarAction(
                                              context,
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Error saving...',
                                                deText:
                                                    'Fehler beim Speichern...',
                                                frText:
                                                    'Erreur lors de l\'enregistrement...',
                                                itText:
                                                    'Errore durante il salvataggio...',
                                              ),
                                            );
                                          }
                                        } else {
                                          await actions.snackbarAction(
                                            context,
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Please fill all required fields',
                                              deText:
                                                  'Füllen Sie die Pflichtfelder aus',
                                              frText:
                                                  'Veuillez remplir tous les champs obligatoires',
                                              itText:
                                                  'Si prega di compilare tutti i campi obbligatori',
                                            ),
                                          );
                                          if ((_model.datePickerFirstRegistrationWeb ==
                                                  null) &&
                                              (widget.firstRegistration ==
                                                  null) &&
                                              (getJsonField(
                                                    widget.editRegister,
                                                    r'''$.firstReg''',
                                                  ) ==
                                                  null)) {
                                            setState(() {
                                              _model.isLabel1stReg = true;
                                            });
                                          }
                                          if (_model.radioButtonIsSwissValue ==
                                                  null ||
                                              _model.radioButtonIsSwissValue ==
                                                  '') {
                                            setState(() {
                                              _model.isLabelSwissVehicle = true;
                                            });
                                          }
                                          if (_model.dropDownExtColorValue ==
                                                  null ||
                                              _model.dropDownExtColorValue ==
                                                  '') {
                                            setState(() {
                                              _model.isLabelExtColor = true;
                                            });
                                          }
                                          if (_model.dropDownPaintworkValue ==
                                                  null ||
                                              _model.dropDownPaintworkValue ==
                                                  '') {
                                            setState(() {
                                              _model.isLabelPaintwork = true;
                                            });
                                          }
                                          if (_model.dropDownIntColorValue ==
                                                  null ||
                                              _model.dropDownIntColorValue ==
                                                  '') {
                                            setState(() {
                                              _model.isLabelIntColor = true;
                                            });
                                          }
                                          if (_model.dropDownRegionValue ==
                                                  null ||
                                              _model.dropDownRegionValue ==
                                                  '') {
                                            setState(() {
                                              _model.isLabelLocation = true;
                                            });
                                          }
                                          if (_model.radioButtonMaintenanceValue ==
                                                  null ||
                                              _model.radioButtonMaintenanceValue ==
                                                  '') {
                                            setState(() {
                                              _model.isLabelMaintenance = true;
                                            });
                                          } else {
                                            setState(() {
                                              _model.isLabelMaintenance = false;
                                            });
                                          }

                                          if (_model.dropDowKeysValue == null ||
                                              _model.dropDowKeysValue == '') {
                                            setState(() {
                                              _model.isLabelNkeys = true;
                                            });
                                          }
                                          if ((_model.datePickerInspectionWeb ==
                                                  null) &&
                                              (getJsonField(
                                                    widget.editRegister,
                                                    r'''$.inspectionDate''',
                                                  ) ==
                                                  null)) {
                                            setState(() {
                                              _model.isLabelInspection = true;
                                            });
                                          }
                                          if ((_model.datePickerMFKWeb ==
                                                  null) &&
                                              (getJsonField(
                                                    widget.editRegister,
                                                    r'''$.mfk''',
                                                  ) ==
                                                  null)) {
                                            setState(() {
                                              _model.isLabelMfk = true;
                                            });
                                          }
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '917nt9m0' /* Next */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFC5181D),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
