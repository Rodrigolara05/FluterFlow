import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mouse_region_model_model.dart';
export 'mouse_region_model_model.dart';

class MouseRegionModelWidget extends StatefulWidget {
  const MouseRegionModelWidget({
    Key? key,
    this.searchData,
    this.modelNumber,
    this.firstRegistration,
  }) : super(key: key);

  final dynamic searchData;
  final String? modelNumber;
  final DateTime? firstRegistration;

  @override
  _MouseRegionModelWidgetState createState() => _MouseRegionModelWidgetState();
}

class _MouseRegionModelWidgetState extends State<MouseRegionModelWidget>
    with TickerProviderStateMixin {
  late MouseRegionModelModel _model;

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
    _model = createModel(context, () => MouseRegionModelModel());

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
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                context.pop();

                context.pushNamed(
                  'RegisterCar_step1',
                  queryParams: {
                    'automaticRegister': serializeParam(
                      getJsonField(
                        widget.searchData,
                        r'''$''',
                      ),
                      ParamType.JSON,
                    ),
                    'modelNumber': serializeParam(
                      widget.modelNumber,
                      ParamType.String,
                    ),
                    'firstRegistration': serializeParam(
                      widget.firstRegistration,
                      ParamType.DateTime,
                    ),
                  }.withoutNulls,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      getJsonField(
                                        widget.searchData,
                                        r'''$.typeName''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      getJsonField(
                                        widget.searchData,
                                        r'''$.fuel''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      getJsonField(
                                        widget.searchData,
                                        r'''$.gearTransmission''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      getJsonField(
                                        widget.searchData,
                                        r'''$.places''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${getJsonField(
                                      widget.searchData,
                                      r'''$.ps''',
                                    ).toString()} PS',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
