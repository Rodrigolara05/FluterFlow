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
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_car_step1_model.dart';
export 'register_car_step1_model.dart';

class RegisterCarStep1Widget extends StatefulWidget {
  const RegisterCarStep1Widget({
    Key? key,
    this.automaticRegister,
    this.modelNumber,
    this.firstRegistration,
    this.editRegister,
    this.withBack,
  }) : super(key: key);

  final dynamic automaticRegister;
  final String? modelNumber;
  final DateTime? firstRegistration;
  final dynamic editRegister;
  final bool? withBack;

  @override
  _RegisterCarStep1WidgetState createState() => _RegisterCarStep1WidgetState();
}

class _RegisterCarStep1WidgetState extends State<RegisterCarStep1Widget> {
  late RegisterCarStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterCarStep1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.editRegister != null) {
        _model.apiResultEditInfo = await EFDevGroup.vehicleDataByTypeCall.call(
          typeId: getJsonField(
            widget.editRegister,
            r'''$.typeId''',
          ).toString().toString(),
          language: FFLocalizations.of(context).languageCode,
        );
      } else {
        setState(() {
          FFAppState().NewVehicleId = '';
        });
        if (widget.automaticRegister != null) {
          setState(() {
            FFAppState().IsRegVehStep1Completed = true;
          });
        } else {
          setState(() {
            FFAppState().IsRegVehStep1Completed = false;
          });
        }
      }

      setState(() => _model.apiRequestCompleter4 = null);
      await _model.waitForApiRequestCompleted4();
      setState(() => _model.apiRequestCompleter3 = null);
      await _model.waitForApiRequestCompleted3();
      setState(() => _model.apiRequestCompleter2 = null);
      await _model.waitForApiRequestCompleted2();
      setState(() => _model.apiRequestCompleter1 = null);
      await _model.waitForApiRequestCompleted1();
    });

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
                      '4k63582a' /* Add Vehicle */,
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
                        var _shouldSetState = false;
                        if ((FFAppState().IsRegVehStep1Completed == true) &&
                            (_model.dropDownFuelValue != null)) {
                          if (FFAppState().NewVehicleId == null ||
                              FFAppState().NewVehicleId == '') {
                            _model.apiResultSaveRegister =
                                await EFDevGroup.registerVehicleCall.call(
                              brandId: _model.dropDownBrandValue,
                              typeId: _model.dropDownTypeValue,
                              modelId: _model.dropDownModelValue,
                              wheelDrive: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].wheelDrive''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].wheelDriveId''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.wheelDrive''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.wheelDrive''',
                                            ).toString()
                                          : '')),
                              gearTX: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].gearTransmission''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].gearTransmissionId''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.gearTransmission''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.gearTX''',
                                            ).toString()
                                          : '')),
                              bodyType: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].bodyType''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].bodyTypeId''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.bodytype''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.bodyType''',
                                            ).toString()
                                          : '')),
                              doors: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].doors''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].doors''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.doors''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.doors''',
                                            ).toString()
                                          : '')),
                              seats: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].places''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].places''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.places''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.seats''',
                                            ).toString()
                                          : '')),
                              performancePs: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].ps''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].ps''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.ps''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.performancePs''',
                                            ).toString()
                                          : '')),
                              performanceKw: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].kw''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].kw''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.kw''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.performanceKw''',
                                            ).toString()
                                          : '')),
                              creatorUserId: FFAppState().UserId,
                              isCompleteInfo: true,
                              fuel: functions.convertIntToString(
                                  _model.dropDownFuelValue!),
                              language:
                                  FFLocalizations.of(context).languageCode,
                            );
                            _shouldSetState = true;
                            if ((_model.apiResultSaveRegister?.succeeded ??
                                true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Vehicle saved in garage',
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
                                    content: Text((_model.apiResultSaveRegister
                                                ?.jsonBody ??
                                            '')
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
                                      enText: 'Failed to create',
                                      deText: 'Konnte nicht erstellt werden',
                                      frText: 'Échec de la création',
                                      itText: 'Impossibile creare',
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
                          } else {
                            _model.apiResultSaveUpdate =
                                await EFDevGroup.updateVehicleStepOneCall.call(
                              fuel: functions.convertIntToString(
                                  _model.dropDownFuelValue!),
                              wheelDrive: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].wheelDrive''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].wheelDriveId''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.wheelDrive''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.wheelDrive''',
                                            ).toString()
                                          : '')),
                              gearTX: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].gearTransmission''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].gearTransmissionId''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.gearTransmission''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.gearTX''',
                                            ).toString()
                                          : '')),
                              bodyType: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].bodyType''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].bodyTypeId''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.bodytype''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.bodyType''',
                                            ).toString()
                                          : '')),
                              doors: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].doors''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].doors''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.doors''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.doors''',
                                            ).toString()
                                          : '')),
                              seats: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].places''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].places''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.places''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.seats''',
                                            ).toString()
                                          : '')),
                              performancePs: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].ps''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].ps''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.ps''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.performancePs''',
                                            ).toString()
                                          : '')),
                              performanceKw: getJsonField(
                                        (_model.apiResultType?.jsonBody ?? ''),
                                        r'''$.items[0].kw''',
                                      ) !=
                                      null
                                  ? getJsonField(
                                      (_model.apiResultType?.jsonBody ?? ''),
                                      r'''$.items[0].kw''',
                                    ).toString()
                                  : (widget.automaticRegister != null
                                      ? getJsonField(
                                          widget.automaticRegister,
                                          r'''$.kw''',
                                        ).toString()
                                      : (widget.editRegister != null
                                          ? getJsonField(
                                              widget.editRegister,
                                              r'''$.performanceKw''',
                                            ).toString()
                                          : '')),
                              brandId: _model.dropDownBrandValue,
                              modelId: _model.dropDownModelValue,
                              typeId: _model.dropDownTypeValue,
                              vehicleId: FFAppState().NewVehicleId,
                              creatorUserId: FFAppState().UserId,
                              lastModifierId: FFAppState().UserId,
                              isCompleteInfo: false,
                              language:
                                  FFLocalizations.of(context).languageCode,
                            );
                            _shouldSetState = true;
                            if ((_model.apiResultSaveUpdate?.succeeded ??
                                true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Vehicle saved in garage',
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
                                        (_model.apiResultSaveUpdate?.jsonBody ??
                                                '')
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
                                      enText: 'Failed to update',
                                      deText: 'Fehler beim Aktualisieren',
                                      frText: 'Échec de mise à jour',
                                      itText: 'Impossibile aggiornare',
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
                          }

                          if (_shouldSetState) setState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Fill the required fields',
                                  deText:
                                      'Füllen Sie die erforderlichen Felder aus',
                                  frText: 'Remplissez les champs obligatoires',
                                  itText: 'Compila i campi richiesti',
                                ),
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
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
                              padding:
                                  MediaQuery.of(bottomSheetContext).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: LooseProgressWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                  ),
                ],
                centerTitle: true,
                elevation: 4.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
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
                                    width: 1.0,
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
                                                    FFIcons.kserver,
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
                                                'pmfg6ee9' /* Data */,
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
                                                '0g9xbc9m' /* Details */,
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
                                                'sjbnnbym' /* Attachments */,
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
                                                'kuntus39' /* Auction */,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 16.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 808.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Form(
                                                    key: _model.formKey,
                                                    autovalidateMode:
                                                        AutovalidateMode.always,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  16.0,
                                                                  16.0,
                                                                  16.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                        'aiso5t0b' /* STEP 1 OF 4 */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'sx84j4rr' /* Vehicle Data */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (!FFAppState()
                                                                        .isEditInformation &&
                                                                    responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if ((FFAppState().IsRegVehStep1Completed ==
                                                                              true) &&
                                                                          (_model.dropDownFuelValue !=
                                                                              null)) {
                                                                        if (FFAppState().NewVehicleId ==
                                                                                null ||
                                                                            FFAppState().NewVehicleId ==
                                                                                '') {
                                                                          _model.apiResultSaveRegisterWeb = await EFDevGroup
                                                                              .registerVehicleCall
                                                                              .call(
                                                                            brandId:
                                                                                _model.dropDownBrandValue,
                                                                            typeId:
                                                                                _model.dropDownTypeValue,
                                                                            modelId:
                                                                                _model.dropDownModelValue,
                                                                            wheelDrive: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].wheelDrive''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].wheelDrive''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.wheelDrive''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.wheelDrive''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            gearTX: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].gearTransmission''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].gearTransmission''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.gearTransmission''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.gearTX''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            bodyType: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].bodyType''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].bodyType''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.bodytype''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.bodyType''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            doors: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].doors''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].doors''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.doors''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.doors''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            seats: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].places''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].places''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.places''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.seats''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            performancePs: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].ps''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].ps''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.ps''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.performancePs''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            performanceKw: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].kw''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].kw''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.kw''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.performanceKw''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            creatorUserId:
                                                                                FFAppState().UserId,
                                                                            isCompleteInfo:
                                                                                true,
                                                                            fuel:
                                                                                functions.convertIntToString(_model.dropDownFuelValue!),
                                                                            language:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.apiResultSaveRegisterWeb?.succeeded ??
                                                                              true)) {
                                                                            await actions.snackbarAction(
                                                                              context,
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Vehicle saved in garage',
                                                                                deText: 'Fahrzeug in Garage gespeichert',
                                                                                frText: 'Véhicule sauvé au garage',
                                                                                itText: 'Veicolo salvato in garage',
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
                                                                                  content: Text((_model.apiResultSaveRegisterWeb?.jsonBody ?? '').toString()),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            await actions.snackbarAction(
                                                                              context,
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Failed to create',
                                                                                deText: 'Konnte nicht erstellt werden',
                                                                                frText: 'Échec de la création',
                                                                                itText: 'Impossibile creare',
                                                                              ),
                                                                            );
                                                                          }
                                                                        } else {
                                                                          _model.apiResultSaveUpdateWeb = await EFDevGroup
                                                                              .updateVehicleStepOneCall
                                                                              .call(
                                                                            fuel:
                                                                                functions.convertIntToString(_model.dropDownFuelValue!),
                                                                            wheelDrive: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].wheelDrive''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].wheelDrive''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.wheelDrive''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.wheelDrive''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            gearTX: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].gearTransmission''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].gearTransmission''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.gearTransmission''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.gearTX''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            bodyType: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].bodyType''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].bodyType''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.bodytype''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.bodyType''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            doors: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].doors''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].doors''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.doors''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.doors''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            seats: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].places''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].places''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.places''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.seats''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            performancePs: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].ps''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].ps''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.ps''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.performancePs''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            performanceKw: getJsonField(
                                                                                      (_model.apiResultType?.jsonBody ?? ''),
                                                                                      r'''$.items[0].kw''',
                                                                                    ) !=
                                                                                    null
                                                                                ? getJsonField(
                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                    r'''$.items[0].kw''',
                                                                                  ).toString()
                                                                                : (widget.automaticRegister != null
                                                                                    ? getJsonField(
                                                                                        widget.automaticRegister,
                                                                                        r'''$.kw''',
                                                                                      ).toString()
                                                                                    : (widget.editRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.performanceKw''',
                                                                                          ).toString()
                                                                                        : '')),
                                                                            brandId:
                                                                                _model.dropDownBrandValue,
                                                                            modelId:
                                                                                _model.dropDownModelValue,
                                                                            typeId:
                                                                                _model.dropDownTypeValue,
                                                                            vehicleId:
                                                                                FFAppState().NewVehicleId,
                                                                            creatorUserId:
                                                                                FFAppState().UserId,
                                                                            lastModifierId:
                                                                                FFAppState().UserId,
                                                                            isCompleteInfo:
                                                                                true,
                                                                            language:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.apiResultSaveUpdateWeb?.succeeded ??
                                                                              true)) {
                                                                            await actions.snackbarAction(
                                                                              context,
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Vehicle saved in garage',
                                                                                deText: 'Fahrzeug in Garage gespeichert',
                                                                                frText: 'Véhicule sauvé au garage',
                                                                                itText: 'Veicolo salvato in garage',
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
                                                                                  content: Text((_model.apiResultSaveUpdateWeb?.jsonBody ?? '').toString()),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            await actions.snackbarAction(
                                                                              context,
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Failed to update',
                                                                                deText: 'Fehler beim Aktualisieren',
                                                                                frText: 'Échec de mise à jour',
                                                                                itText: 'Impossibile aggiornare',
                                                                              ),
                                                                            );
                                                                          }
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        await actions
                                                                            .snackbarAction(
                                                                          context,
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'Fill the required fields',
                                                                            deText:
                                                                                'Füllen Sie die erforderlichen Felder aus',
                                                                            frText:
                                                                                'Remplissez les champs obligatoires',
                                                                            itText:
                                                                                'Compila i campi richiesti',
                                                                          ),
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '5535p78l' /* Save in Garage */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Wrap(
                                                                spacing: 16.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .spaceBetween,
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context).size.width >=
                                                                              500.0
                                                                          ? 244.0
                                                                          : 500.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '9oxhqgwe' /* Brand */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: (_model.apiRequestCompleter4 ??= Completer<ApiCallResponse>()
                                                                                    ..complete(EFDevGroup.vehicleBrandsCall.call(
                                                                                      language: FFLocalizations.of(context).languageCode,
                                                                                    )))
                                                                                  .future,
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
                                                                                final dropDownBrandVehicleBrandsResponse = snapshot.data!;
                                                                                return FlutterFlowDropDown<String>(
                                                                                  controller: _model.dropDownBrandController ??= FormFieldController<String>(
                                                                                    _model.dropDownBrandValue ??= widget.automaticRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.automaticRegister,
                                                                                            r'''$.brandId''',
                                                                                          ).toString()
                                                                                        : (widget.editRegister != null
                                                                                            ? getJsonField(
                                                                                                widget.editRegister,
                                                                                                r'''$.brandId''',
                                                                                              ).toString()
                                                                                            : ''),
                                                                                  ),
                                                                                  options: dropDownBrandVehicleBrandsResponse.succeeded
                                                                                      ? (getJsonField(
                                                                                          dropDownBrandVehicleBrandsResponse.jsonBody,
                                                                                          r'''$.items[:].id''',
                                                                                        ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList()!
                                                                                      : (widget.editRegister != null
                                                                                              ? (getJsonField(
                                                                                                  widget.editRegister,
                                                                                                  r'''$.brandId''',
                                                                                                ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()!
                                                                                              : ['0'])
                                                                                          .toList(),
                                                                                  optionLabels: dropDownBrandVehicleBrandsResponse.succeeded
                                                                                      ? (getJsonField(
                                                                                          dropDownBrandVehicleBrandsResponse.jsonBody,
                                                                                          r'''$.items[:].brandName''',
                                                                                        ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList()!
                                                                                      : [''].toList(),
                                                                                  onChanged: (val) async {
                                                                                    setState(() => _model.dropDownBrandValue = val);
                                                                                    setState(() {
                                                                                      _model.isLabelBrandVisible = false;
                                                                                    });
                                                                                    setState(() {
                                                                                      FFAppState().IsRegVehStep1Completed = false;
                                                                                    });
                                                                                    setState(() {
                                                                                      FFAppState().isLoading = true;
                                                                                    });
                                                                                    setState(() => _model.apiRequestCompleter3 = null);
                                                                                    await _model.waitForApiRequestCompleted3(minWait: 1000);
                                                                                    setState(() {
                                                                                      FFAppState().isLoading = false;
                                                                                    });
                                                                                  },
                                                                                  width: double.infinity,
                                                                                  height: 40.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  fillColor: Colors.white,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Color(0x66ABABAB),
                                                                                  borderWidth: 1.5,
                                                                                  borderRadius: 8.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                  hidesUnderline: true,
                                                                                  disabled: (widget.automaticRegister != null) || FFAppState().isLoading,
                                                                                  isSearchable: false,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          if (_model
                                                                              .isLabelBrandVisible)
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '9f678t3e' /* This field is required. */,
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width >=
                                                                            500.0
                                                                        ? 244.0
                                                                        : 500.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth: isWeb
                                                                          ? 244.0
                                                                          : 500.0,
                                                                    ),
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'u6ewp0py' /* Model */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              FutureBuilder<ApiCallResponse>(
                                                                            future: (_model.apiRequestCompleter3 ??= Completer<ApiCallResponse>()
                                                                                  ..complete(EFDevGroup.vehicleModelsByBrandIdCall.call(
                                                                                    brandId: widget.automaticRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.automaticRegister,
                                                                                            r'''$.brandId''',
                                                                                          ).toString()
                                                                                        : (widget.editRegister != null
                                                                                            ? getJsonField(
                                                                                                widget.editRegister,
                                                                                                r'''$.brandId''',
                                                                                              ).toString()
                                                                                            : _model.dropDownBrandValue),
                                                                                    language: FFLocalizations.of(context).languageCode,
                                                                                  )))
                                                                                .future,
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              final dropDownModelVehicleModelsByBrandIdResponse = snapshot.data!;
                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownModelController ??= FormFieldController<String>(
                                                                                  _model.dropDownModelValue ??= widget.automaticRegister != null
                                                                                      ? getJsonField(
                                                                                          widget.automaticRegister,
                                                                                          r'''$.modelId''',
                                                                                        ).toString()
                                                                                      : (widget.editRegister != null
                                                                                          ? getJsonField(
                                                                                              widget.editRegister,
                                                                                              r'''$.modelId''',
                                                                                            ).toString()
                                                                                          : ''),
                                                                                ),
                                                                                options: dropDownModelVehicleModelsByBrandIdResponse.succeeded
                                                                                    ? (EFDevGroup.vehicleModelsByBrandIdCall.brandIds(
                                                                                        dropDownModelVehicleModelsByBrandIdResponse.jsonBody,
                                                                                      ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()!
                                                                                        .map((e) => e.toString())
                                                                                        .toList()
                                                                                    : ['0'].toList(),
                                                                                optionLabels: dropDownModelVehicleModelsByBrandIdResponse.succeeded
                                                                                    ? (EFDevGroup.vehicleModelsByBrandIdCall.modelNames(
                                                                                        dropDownModelVehicleModelsByBrandIdResponse.jsonBody,
                                                                                      ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()!
                                                                                    : [''].toList(),
                                                                                onChanged: (val) async {
                                                                                  setState(() => _model.dropDownModelValue = val);
                                                                                  setState(() {
                                                                                    _model.isLabelModelVisible = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().IsRegVehStep1Completed = false;
                                                                                  });
                                                                                  setState(() {
                                                                                    FFAppState().isLoading = true;
                                                                                  });
                                                                                  setState(() => _model.apiRequestCompleter2 = null);
                                                                                  await _model.waitForApiRequestCompleted2(minWait: 1000);
                                                                                  setState(() {
                                                                                    FFAppState().isLoading = false;
                                                                                  });
                                                                                },
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                fillColor: Colors.white,
                                                                                elevation: 2.0,
                                                                                borderColor: Color(0x66ABABAB),
                                                                                borderWidth: 1.5,
                                                                                borderRadius: 8.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                disabled: (widget.automaticRegister != null) || FFAppState().isLoading || (_model.dropDownBrandValue == null || _model.dropDownBrandValue == ''),
                                                                                isSearchable: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        if (_model
                                                                            .isLabelModelVisible)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '4d6p4hhw' /* This field is required. */,
                                                                              ),
                                                                              textAlign: TextAlign.start,
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
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width >=
                                                                            500.0
                                                                        ? 244.0
                                                                        : 500.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth: isWeb
                                                                          ? 244.0
                                                                          : 500.0,
                                                                    ),
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'mnlp7wxa' /* Type */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              FutureBuilder<ApiCallResponse>(
                                                                            future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
                                                                                  ..complete(EFDevGroup.vehicleTypesByModelIdCall.call(
                                                                                    modelId: widget.automaticRegister != null
                                                                                        ? getJsonField(
                                                                                            widget.automaticRegister,
                                                                                            r'''$.modelId''',
                                                                                          ).toString()
                                                                                        : (widget.editRegister != null
                                                                                            ? getJsonField(
                                                                                                widget.editRegister,
                                                                                                r'''$.modelId''',
                                                                                              ).toString()
                                                                                            : _model.dropDownModelValue),
                                                                                    language: FFLocalizations.of(context).languageCode,
                                                                                  )))
                                                                                .future,
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              final dropDownTypeVehicleTypesByModelIdResponse = snapshot.data!;
                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownTypeController ??= FormFieldController<String>(
                                                                                  _model.dropDownTypeValue ??= widget.automaticRegister != null
                                                                                      ? getJsonField(
                                                                                          widget.automaticRegister,
                                                                                          r'''$.typeId''',
                                                                                        ).toString()
                                                                                      : (widget.editRegister != null
                                                                                          ? getJsonField(
                                                                                              widget.editRegister,
                                                                                              r'''$.typeId''',
                                                                                            ).toString()
                                                                                          : ''),
                                                                                ),
                                                                                options: dropDownTypeVehicleTypesByModelIdResponse.succeeded
                                                                                    ? (EFDevGroup.vehicleTypesByModelIdCall.typeIds(
                                                                                        dropDownTypeVehicleTypesByModelIdResponse.jsonBody,
                                                                                      ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()!
                                                                                    : ['0'].toList(),
                                                                                optionLabels: dropDownTypeVehicleTypesByModelIdResponse.succeeded
                                                                                    ? (EFDevGroup.vehicleTypesByModelIdCall.typeNames(
                                                                                        dropDownTypeVehicleTypesByModelIdResponse.jsonBody,
                                                                                      ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()!
                                                                                    : [''].toList(),
                                                                                onChanged: (val) async {
                                                                                  setState(() => _model.dropDownTypeValue = val);
                                                                                  setState(() {
                                                                                    _model.isLabelTypeVisible = false;
                                                                                  });
                                                                                  _model.apiResultType = await EFDevGroup.vehicleDataByTypeCall.call(
                                                                                    typeId: _model.dropDownTypeValue,
                                                                                    language: FFLocalizations.of(context).languageCode,
                                                                                  );
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().IsRegVehStep1Completed = true;
                                                                                  });
                                                                                  setState(() {
                                                                                    FFAppState().isLoading = true;
                                                                                  });
                                                                                  setState(() => _model.apiRequestCompleter1 = null);
                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                  setState(() {
                                                                                    FFAppState().isLoading = false;
                                                                                  });

                                                                                  setState(() {});
                                                                                },
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                fillColor: Colors.white,
                                                                                elevation: 2.0,
                                                                                borderColor: Color(0x66ABABAB),
                                                                                borderWidth: 1.5,
                                                                                borderRadius: 8.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                disabled: (widget.automaticRegister != null) || FFAppState().isLoading || (_model.dropDownModelValue == null || _model.dropDownModelValue == '') || (_model.dropDownBrandValue == null || _model.dropDownBrandValue == ''),
                                                                                isSearchable: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        if (_model
                                                                            .isLabelTypeVisible)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '20y9p1s2' /* This field is required. */,
                                                                              ),
                                                                              textAlign: TextAlign.start,
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
                                                                      'b9n9n29c' /* Fuel */,
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
                                                                            4.0),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: (_model
                                                                              .apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                                                                            ..complete(EFDevGroup.fuelListCall.call(
                                                                              language: FFLocalizations.of(context).languageCode,
                                                                            )))
                                                                          .future,
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final dropDownFuelFuelListResponse =
                                                                            snapshot.data!;
                                                                        return FlutterFlowDropDown<
                                                                            int>(
                                                                          controller: _model.dropDownFuelController ??=
                                                                              FormFieldController<int>(
                                                                            _model.dropDownFuelValue ??= widget.automaticRegister != null
                                                                                ? functions.stringToInt(getJsonField(
                                                                                    widget.automaticRegister,
                                                                                    r'''$.fuelId''',
                                                                                  ).toString())
                                                                                : ((_model.apiResultType != null) && (_model.apiResultType?.succeeded ?? true)
                                                                                    ? functions.stringToInt(getJsonField(
                                                                                        (_model.apiResultType?.jsonBody ?? ''),
                                                                                        r'''$.items[0].fuelId''',
                                                                                      ).toString())
                                                                                    : (widget.editRegister != null
                                                                                        ? functions.stringToInt(getJsonField(
                                                                                            widget.editRegister,
                                                                                            r'''$.fuel''',
                                                                                          ).toString())
                                                                                        : 0)),
                                                                          ),
                                                                          options: functions
                                                                              .dynamicListToListInt(EFDevGroup.fuelListCall
                                                                                  .fuelCodes(
                                                                                    dropDownFuelFuelListResponse.jsonBody,
                                                                                  )!
                                                                                  .toList())!
                                                                              .toList(),
                                                                          optionLabels: (EFDevGroup.fuelListCall.fuelTexts(
                                                                            dropDownFuelFuelListResponse.jsonBody,
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()!
                                                                              .map((e) => e.toString())
                                                                              .toList()
                                                                              .toList(),
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.dropDownFuelValue = val);
                                                                            setState(() {
                                                                              _model.isLabelFuelVisible = false;
                                                                            });
                                                                          },
                                                                          width:
                                                                              double.infinity,
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
                                                                      .isLabelFuelVisible)
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '0rmx87hz' /* This field is required. */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
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
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
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
                                                                          '5ssdcewa' /* Extra Data */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8647ey1s' /* READ ONLY */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Stack(
                                                                  children: [
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            200.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                            ))
                                                                              Container(
                                                                                width: 16.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(),
                                                                              ),
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'sp04l0m4' /* Wheel Drive */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                          (_model.apiResultType?.jsonBody ?? ''),
                                                                                                          r'''$.items[0].wheelDrive''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        (_model.apiResultType?.jsonBody ?? ''),
                                                                                                        r'''$.items[0].wheelDrive''',
                                                                                                      ).toString()
                                                                                                    : (widget.automaticRegister != null
                                                                                                        ? getJsonField(
                                                                                                            widget.automaticRegister,
                                                                                                            r'''$.wheelDrive''',
                                                                                                          ).toString()
                                                                                                        : (widget.editRegister != null
                                                                                                            ? getJsonField(
                                                                                                                widget.editRegister,
                                                                                                                r'''$.wheelDrive''',
                                                                                                              ).toString()
                                                                                                            : '')),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'hgn4723n' /* Gear Transmission */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                          (_model.apiResultType?.jsonBody ?? ''),
                                                                                                          r'''$.items[0].gearTransmission''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        (_model.apiResultType?.jsonBody ?? ''),
                                                                                                        r'''$.items[0].gearTransmission''',
                                                                                                      ).toString()
                                                                                                    : (widget.automaticRegister != null
                                                                                                        ? getJsonField(
                                                                                                            widget.automaticRegister,
                                                                                                            r'''$.gearTransmission''',
                                                                                                          ).toString()
                                                                                                        : (widget.editRegister != null
                                                                                                            ? getJsonField(
                                                                                                                widget.editRegister,
                                                                                                                r'''$.gearTX''',
                                                                                                              ).toString()
                                                                                                            : '')),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '7epca4u8' /* Body Type */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                          (_model.apiResultType?.jsonBody ?? ''),
                                                                                                          r'''$.items[0].bodyType''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        (_model.apiResultType?.jsonBody ?? ''),
                                                                                                        r'''$.items[0].bodyType''',
                                                                                                      ).toString()
                                                                                                    : (widget.automaticRegister != null
                                                                                                        ? getJsonField(
                                                                                                            widget.automaticRegister,
                                                                                                            r'''$.bodyType''',
                                                                                                          ).toString()
                                                                                                        : (widget.editRegister != null
                                                                                                            ? getJsonField(
                                                                                                                widget.editRegister,
                                                                                                                r'''$.bodyType''',
                                                                                                              ).toString()
                                                                                                            : '')),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '74b7rzuz' /* Doors */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                          (_model.apiResultType?.jsonBody ?? ''),
                                                                                                          r'''$.items[0].doors''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        (_model.apiResultType?.jsonBody ?? ''),
                                                                                                        r'''$.items[0].doors''',
                                                                                                      ).toString()
                                                                                                    : (widget.automaticRegister != null
                                                                                                        ? getJsonField(
                                                                                                            widget.automaticRegister,
                                                                                                            r'''$.doors''',
                                                                                                          ).toString()
                                                                                                        : (widget.editRegister != null
                                                                                                            ? getJsonField(
                                                                                                                widget.editRegister,
                                                                                                                r'''$.doors''',
                                                                                                              ).toString()
                                                                                                            : '')),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  't68mese6' /* Number of Seats */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                          (_model.apiResultType?.jsonBody ?? ''),
                                                                                                          r'''$.items[0].places''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        (_model.apiResultType?.jsonBody ?? ''),
                                                                                                        r'''$.items[0].places''',
                                                                                                      ).toString()
                                                                                                    : (widget.automaticRegister != null
                                                                                                        ? getJsonField(
                                                                                                            widget.automaticRegister,
                                                                                                            r'''$.places''',
                                                                                                          ).toString()
                                                                                                        : (widget.editRegister != null
                                                                                                            ? getJsonField(
                                                                                                                widget.editRegister,
                                                                                                                r'''$.seats''',
                                                                                                              ).toString()
                                                                                                            : '')),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 141.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'js7x72yy' /* Performance */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleSmall,
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 141.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'uiakrbwr' /* HP */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                                    (_model.apiResultType?.jsonBody ?? ''),
                                                                                                                    r'''$.items[0].ps''',
                                                                                                                  ) !=
                                                                                                                  null
                                                                                                              ? getJsonField(
                                                                                                                  (_model.apiResultType?.jsonBody ?? ''),
                                                                                                                  r'''$.items[0].ps''',
                                                                                                                ).toString()
                                                                                                              : (widget.automaticRegister != null
                                                                                                                  ? getJsonField(
                                                                                                                      widget.automaticRegister,
                                                                                                                      r'''$.ps''',
                                                                                                                    ).toString()
                                                                                                                  : (widget.editRegister != null
                                                                                                                      ? getJsonField(
                                                                                                                          widget.editRegister,
                                                                                                                          r'''$.performancePs''',
                                                                                                                        ).toString()
                                                                                                                      : '')),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'j17nncn4' /* KW */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        getJsonField(
                                                                                                                  (_model.apiResultType?.jsonBody ?? ''),
                                                                                                                  r'''$.items[0].kw''',
                                                                                                                ) !=
                                                                                                                null
                                                                                                            ? getJsonField(
                                                                                                                (_model.apiResultType?.jsonBody ?? ''),
                                                                                                                r'''$.items[0].kw''',
                                                                                                              ).toString()
                                                                                                            : (widget.automaticRegister != null
                                                                                                                ? getJsonField(
                                                                                                                    widget.automaticRegister,
                                                                                                                    r'''$.kw''',
                                                                                                                  ).toString()
                                                                                                                : (widget.editRegister != null
                                                                                                                    ? getJsonField(
                                                                                                                        widget.editRegister,
                                                                                                                        r'''$.performanceKw''',
                                                                                                                      ).toString()
                                                                                                                    : '')),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .isEditInformation =
                                                      false;
                                                });
                                                context.pop();
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qrqu79gs' /* Cancel */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color:
                                                              Color(0xFFC5181D),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if ((_model.dropDownBrandValue != null && _model.dropDownBrandValue != '') &&
                                                    (_model.dropDownModelValue !=
                                                            null &&
                                                        _model.dropDownModelValue !=
                                                            '') &&
                                                    (_model.dropDownTypeValue !=
                                                            null &&
                                                        _model.dropDownTypeValue !=
                                                            '') &&
                                                    (_model.dropDownFuelValue !=
                                                        0)) {
                                                  if (widget.editRegister !=
                                                      null) {
                                                    if (_model.apiResultType !=
                                                        null) {
                                                      _model.apiResultEditUpdate =
                                                          await EFDevGroup
                                                              .updateVehicleStepOneCall
                                                              .call(
                                                        fuel: functions
                                                            .convertIntToString(
                                                                _model
                                                                    .dropDownFuelValue!),
                                                        wheelDrive:
                                                            getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].wheelDriveId''',
                                                        ).toString(),
                                                        gearTX: getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].gearTransmissionId''',
                                                        ).toString(),
                                                        bodyType: getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].bodyTypeId''',
                                                        ).toString(),
                                                        doors: getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].doors''',
                                                        ).toString(),
                                                        seats: getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].places''',
                                                        ).toString(),
                                                        performancePs:
                                                            getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].ps''',
                                                        ).toString(),
                                                        performanceKw:
                                                            getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].kw''',
                                                        ).toString(),
                                                        brandId: _model
                                                            .dropDownBrandValue,
                                                        modelId: _model
                                                            .dropDownModelValue,
                                                        typeId: _model
                                                            .dropDownTypeValue,
                                                        vehicleId: FFAppState()
                                                            .NewVehicleId,
                                                        creatorUserId:
                                                            FFAppState().UserId,
                                                        lastModifierId:
                                                            FFAppState().UserId,
                                                        isCompleteInfo: false,
                                                        language:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                        bodySort: getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].bodySort''',
                                                        ).toString(),
                                                      );
                                                      _shouldSetState = true;
                                                    } else {
                                                      _model.apiResultEditUpdate2 =
                                                          await EFDevGroup
                                                              .updateVehicleStepOneCall
                                                              .call(
                                                        fuel: functions
                                                            .convertIntToString(
                                                                _model
                                                                    .dropDownFuelValue!),
                                                        wheelDrive:
                                                            getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].wheelDriveId''',
                                                        ).toString(),
                                                        gearTX: getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].gearTransmissionId''',
                                                        ).toString(),
                                                        bodyType: getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].bodyTypeId''',
                                                        ).toString(),
                                                        doors: getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].doors''',
                                                        ).toString(),
                                                        seats: getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].places''',
                                                        ).toString(),
                                                        performancePs:
                                                            getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].ps''',
                                                        ).toString(),
                                                        performanceKw:
                                                            getJsonField(
                                                          (_model.apiResultEditInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].kw''',
                                                        ).toString(),
                                                        brandId: _model
                                                            .dropDownBrandValue,
                                                        modelId: _model
                                                            .dropDownModelValue,
                                                        typeId: _model
                                                            .dropDownTypeValue,
                                                        vehicleId: FFAppState()
                                                            .NewVehicleId,
                                                        creatorUserId:
                                                            FFAppState().UserId,
                                                        lastModifierId:
                                                            FFAppState().UserId,
                                                        isCompleteInfo: false,
                                                        language:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                        bodySort: getJsonField(
                                                          (_model.apiResultType
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.items[0].bodySort''',
                                                        ).toString(),
                                                      );
                                                      _shouldSetState = true;
                                                    }

                                                    if ((_model.apiResultEditUpdate
                                                                ?.succeeded ??
                                                            true) ||
                                                        (_model.apiResultEditUpdate2
                                                                ?.succeeded ??
                                                            true)) {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .isEditInformation =
                                                            false;
                                                      });
                                                      if ((widget.withBack ==
                                                              null) ||
                                                          (widget.withBack ==
                                                              true)) {
                                                        _model.apiResultInfo2 =
                                                            await EFDevGroup
                                                                .vehicleInfoStepTwoCall
                                                                .call(
                                                          vehicleId:
                                                              FFAppState()
                                                                  .NewVehicleId,
                                                          language:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .apiResultInfo2
                                                                ?.succeeded ??
                                                            true)) {
                                                          context.pushNamed(
                                                            'RegisterCar_step2',
                                                            queryParams: {
                                                              'editRegister':
                                                                  serializeParam(
                                                                (_model.apiResultInfo2
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                ParamType.JSON,
                                                              ),
                                                              'withBack':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      } else {
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                            'Preview');
                                                      }
                                                    } else {
                                                      await actions
                                                          .snackbarAction(
                                                        context,
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Error saving...',
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
                                                    if ((FFAppState()
                                                                .IsRegVehStep1Completed ==
                                                            true) &&
                                                        (_model.dropDownFuelValue !=
                                                            null)) {
                                                      if (FFAppState()
                                                                  .NewVehicleId ==
                                                              null ||
                                                          FFAppState()
                                                                  .NewVehicleId ==
                                                              '') {
                                                        if (widget
                                                                .automaticRegister !=
                                                            null) {
                                                          _model.apiResultNextAutoRegister =
                                                              await EFDevGroup
                                                                  .registerVehicleCall
                                                                  .call(
                                                            brandId: _model
                                                                .dropDownBrandValue,
                                                            typeId: _model
                                                                .dropDownTypeValue,
                                                            modelId: _model
                                                                .dropDownModelValue,
                                                            wheelDrive:
                                                                getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.wheelDriveId''',
                                                            ).toString(),
                                                            gearTX:
                                                                getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.gearTransmissionId''',
                                                            ).toString(),
                                                            bodyType:
                                                                getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.bodyTypeId''',
                                                            ).toString(),
                                                            doors: getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.doors''',
                                                            ).toString(),
                                                            seats: getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.places''',
                                                            ).toString(),
                                                            performancePs:
                                                                getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.ps''',
                                                            ).toString(),
                                                            performanceKw:
                                                                getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.kw''',
                                                            ).toString(),
                                                            creatorUserId:
                                                                FFAppState()
                                                                    .UserId,
                                                            isCompleteInfo:
                                                                false,
                                                            fuel: functions
                                                                .convertIntToString(
                                                                    _model
                                                                        .dropDownFuelValue!),
                                                            language:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                            bodySort:
                                                                getJsonField(
                                                              widget
                                                                  .automaticRegister,
                                                              r'''$.bodySort''',
                                                            ).toString(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResultNextAutoRegister
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .NewVehicleId =
                                                                  getJsonField(
                                                                (_model.apiResultNextAutoRegister
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.id''',
                                                              ).toString();
                                                            });

                                                            context.pushNamed(
                                                              'RegisterCar_step2',
                                                              queryParams: {
                                                                'modelNumber':
                                                                    serializeParam(
                                                                  widget
                                                                      .modelNumber,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'firstRegistration':
                                                                    serializeParam(
                                                                  widget
                                                                      .firstRegistration,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'withBack':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            await actions
                                                                .snackbarAction(
                                                              context,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    'Error saving...',
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
                                                          _model.apiResultNextRegister =
                                                              await EFDevGroup
                                                                  .registerVehicleCall
                                                                  .call(
                                                            brandId: _model
                                                                .dropDownBrandValue,
                                                            typeId: _model
                                                                .dropDownTypeValue,
                                                            modelId: _model
                                                                .dropDownModelValue,
                                                            wheelDrive:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                (_model.apiResultType
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.items[0].wheelDriveId''',
                                                              ).toString(),
                                                              '\$.items[0].wheelDriveId',
                                                            ),
                                                            gearTX:
                                                                getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].gearTransmissionId''',
                                                            ).toString(),
                                                            bodyType:
                                                                getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].bodyTypeId''',
                                                            ).toString(),
                                                            doors: getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].doors''',
                                                            ).toString(),
                                                            seats: getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].places''',
                                                            ).toString(),
                                                            performancePs:
                                                                getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].ps''',
                                                            ).toString(),
                                                            performanceKw:
                                                                getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].kw''',
                                                            ).toString(),
                                                            creatorUserId:
                                                                FFAppState()
                                                                    .UserId,
                                                            isCompleteInfo:
                                                                false,
                                                            fuel: functions
                                                                .convertIntToString(
                                                                    _model
                                                                        .dropDownFuelValue!),
                                                            language:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                            bodySort:
                                                                getJsonField(
                                                              (_model.apiResultType
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].bodySort''',
                                                            ).toString(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResultNextRegister
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .NewVehicleId =
                                                                  getJsonField(
                                                                (_model.apiResultNextRegister
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.id''',
                                                              ).toString();
                                                            });

                                                            context.pushNamed(
                                                              'RegisterCar_step2',
                                                              queryParams: {
                                                                'modelNumber':
                                                                    serializeParam(
                                                                  '',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            await actions
                                                                .snackbarAction(
                                                              context,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    'Error saving...',
                                                                deText:
                                                                    'Fehler beim Speichern...',
                                                                frText:
                                                                    'Erreur lors de l\'enregistrement...',
                                                                itText:
                                                                    'Errore durante il salvataggio...',
                                                              ),
                                                            );
                                                          }
                                                        }
                                                      } else {
                                                        _model.apiResultNextUpdate =
                                                            await EFDevGroup
                                                                .updateVehicleStepOneCall
                                                                .call(
                                                          fuel: functions
                                                              .convertIntToString(
                                                                  _model
                                                                      .dropDownFuelValue!),
                                                          wheelDrive:
                                                              getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].wheelDriveId''',
                                                          ).toString(),
                                                          gearTX: getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].gearTransmissionId''',
                                                          ).toString(),
                                                          bodyType:
                                                              getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].bodyTypeId''',
                                                          ).toString(),
                                                          doors: getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].doors''',
                                                          ).toString(),
                                                          seats: getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].places''',
                                                          ).toString(),
                                                          performancePs:
                                                              getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].ps''',
                                                          ).toString(),
                                                          performanceKw:
                                                              getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].kw''',
                                                          ).toString(),
                                                          brandId: _model
                                                              .dropDownBrandValue,
                                                          modelId: _model
                                                              .dropDownModelValue,
                                                          typeId: _model
                                                              .dropDownTypeValue,
                                                          vehicleId:
                                                              FFAppState()
                                                                  .NewVehicleId,
                                                          creatorUserId:
                                                              FFAppState()
                                                                  .UserId,
                                                          lastModifierId:
                                                              FFAppState()
                                                                  .UserId,
                                                          isCompleteInfo: false,
                                                          language:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                          bodySort:
                                                              getJsonField(
                                                            (_model.apiResultType
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.items[0].bodySort''',
                                                          ).toString(),
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .apiResultNextUpdate
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.apiResultInfo2Back =
                                                              await EFDevGroup
                                                                  .vehicleInfoStepTwoCall
                                                                  .call(
                                                            vehicleId:
                                                                FFAppState()
                                                                    .NewVehicleId,
                                                            language:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResultInfo2Back
                                                                  ?.succeeded ??
                                                              true)) {
                                                            context.pushNamed(
                                                              'RegisterCar_step2',
                                                              queryParams: {
                                                                'editRegister':
                                                                    serializeParam(
                                                                  (_model.apiResultInfo2Back
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  ParamType
                                                                      .JSON,
                                                                ),
                                                                'withBack':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        } else {
                                                          await actions
                                                              .snackbarAction(
                                                            context,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Error saving...',
                                                              deText:
                                                                  'Fehler beim Speichern...',
                                                              frText:
                                                                  'Erreur lors de l\'enregistrement...',
                                                              itText:
                                                                  'Errore durante il salvataggio...',
                                                            ),
                                                          );
                                                        }
                                                      }
                                                    } else {
                                                      await actions
                                                          .snackbarAction(
                                                        context,
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Please fill all required fields',
                                                          deText:
                                                              'Bitte füllen Sie die Pflichtfelder aus',
                                                          frText:
                                                              'Veuillez remplir les champs requis',
                                                          itText:
                                                              'Si prega di compilare i campi richiesti',
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                  }
                                                } else {
                                                  if (_model.dropDownBrandValue ==
                                                          null ||
                                                      _model.dropDownBrandValue ==
                                                          '') {
                                                    setState(() {
                                                      _model.isLabelBrandVisible =
                                                          true;
                                                    });
                                                  }
                                                  if (_model.dropDownModelValue ==
                                                          null ||
                                                      _model.dropDownModelValue ==
                                                          '') {
                                                    setState(() {
                                                      _model.isLabelModelVisible =
                                                          true;
                                                    });
                                                  }
                                                  if (_model.dropDownTypeValue ==
                                                          null ||
                                                      _model.dropDownTypeValue ==
                                                          '') {
                                                    setState(() {
                                                      _model.isLabelTypeVisible =
                                                          true;
                                                    });
                                                  }
                                                  if (_model
                                                          .dropDownFuelValue ==
                                                      0) {
                                                    setState(() {
                                                      _model.isLabelFuelVisible =
                                                          true;
                                                    });
                                                  }
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'refgjo44' /* Next */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFC5181D),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
