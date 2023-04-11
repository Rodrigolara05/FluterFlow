import '/backend/api_requests/api_calls.dart';
import '/components/start_auction/start_auction_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mouse_region_vehicles_garage_model.dart';
export 'mouse_region_vehicles_garage_model.dart';

class MouseRegionVehiclesGarageWidget extends StatefulWidget {
  const MouseRegionVehiclesGarageWidget({
    Key? key,
    this.jsonVehicles,
  }) : super(key: key);

  final dynamic jsonVehicles;

  @override
  _MouseRegionVehiclesGarageWidgetState createState() =>
      _MouseRegionVehiclesGarageWidgetState();
}

class _MouseRegionVehiclesGarageWidgetState
    extends State<MouseRegionVehiclesGarageWidget>
    with TickerProviderStateMixin {
  late MouseRegionVehiclesGarageModel _model;

  final animationsMap = {
    'mouseRegionOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -8.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1.0,
          end: 1.05,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MouseRegionVehiclesGarageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: !_model.isSelected ? Color(0xFFF3F3F3) : Color(0x00000000),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (!FFAppState().IsPrivate && !FFAppState().isSubUser)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: AutoSizeText(
                            getJsonField(
                              widget.jsonVehicles,
                              r'''$.userName''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: AutoSizeText(
                          getJsonField(
                            widget.jsonVehicles,
                            r'''$.brand''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Color(0xFF242729),
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          getJsonField(
                            widget.jsonVehicles,
                            r'''$.model''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          getJsonField(
                            widget.jsonVehicles,
                            r'''$.bodyType''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          getJsonField(
                                    widget.jsonVehicles,
                                    r'''$.frame''',
                                  ) !=
                                  null
                              ? getJsonField(
                                  widget.jsonVehicles,
                                  r'''$.frame''',
                                ).toString()
                              : FFLocalizations.of(context).getVariableText(
                                  enText: 'Frame No. not set',
                                  deText: 'Rahmennummer undefiniert',
                                  frText: 'Numéro de cadre indéfini',
                                  itText: 'Telaio n. non definito',
                                ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          functions.changeDateFormat(
                              getJsonField(
                                widget.jsonVehicles,
                                r'''$.creationTime''',
                              ).toString(),
                              0),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: !getJsonField(
                                      widget.jsonVehicles,
                                      r'''$.isReAuctioning''',
                                    )
                                        ? null
                                        : () async {
                                            setState(() {
                                              FFAppState().NewVehicleId =
                                                  getJsonField(
                                                widget.jsonVehicles,
                                                r'''$.vehicleId''',
                                              ).toString();
                                            });

                                            context.pushNamed('Preview');
                                          },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.edit,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: getJsonField(
                                              widget.jsonVehicles,
                                              r'''$.isReAuctioning''',
                                            ) ==
                                            true
                                        ? null
                                        : () async {
                                            setState(() {
                                              FFAppState().NewVehicleId =
                                                  getJsonField(
                                                widget.jsonVehicles,
                                                r'''$.vehicleId''',
                                              ).toString();
                                            });
                                            _model.apiResultVehicleInfo =
                                                await EFDevGroup
                                                    .vehicleInfoStepTwoCall
                                                    .call(
                                              vehicleId: getJsonField(
                                                widget.jsonVehicles,
                                                r'''$.vehicleId''',
                                              ).toString(),
                                              language:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            if ((_model.apiResultVehicleInfo
                                                    ?.succeeded ??
                                                true)) {
                                              context.pushNamed(
                                                'RegisterCar_step2',
                                                queryParams: {
                                                  'editRegister':
                                                      serializeParam(
                                                    (_model.apiResultVehicleInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                    ParamType.JSON,
                                                  ),
                                                  'withBack': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }

                                            setState(() {});
                                          },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.play_arrow_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: !getJsonField(
                                      widget.jsonVehicles,
                                      r'''$.isReAuctioning''',
                                    )
                                        ? null
                                        : () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.white,
                                              enableDrag: false,
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1.0,
                                                    child: StartAuctionWidget(
                                                      vehicleId: getJsonField(
                                                        widget.jsonVehicles,
                                                        r'''$.vehicleId''',
                                                      ).toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.trashAlt,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
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
              ],
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          ),
        ],
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        setState(() {
          _model.isSelected = false;
        });
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        setState(() {
          _model.isSelected = true;
        });
      }),
    ).animateOnActionTrigger(
      animationsMap['mouseRegionOnActionTriggerAnimation']!,
    );
  }
}
