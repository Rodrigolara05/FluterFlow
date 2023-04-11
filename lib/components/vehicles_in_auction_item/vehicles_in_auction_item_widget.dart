import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicles_in_auction_item_model.dart';
export 'vehicles_in_auction_item_model.dart';

class VehiclesInAuctionItemWidget extends StatefulWidget {
  const VehiclesInAuctionItemWidget({
    Key? key,
    this.jsonVehicles,
  }) : super(key: key);

  final dynamic jsonVehicles;

  @override
  _VehiclesInAuctionItemWidgetState createState() =>
      _VehiclesInAuctionItemWidgetState();
}

class _VehiclesInAuctionItemWidgetState
    extends State<VehiclesInAuctionItemWidget> with TickerProviderStateMixin {
  late VehiclesInAuctionItemModel _model;

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
    _model = createModel(context, () => VehiclesInAuctionItemModel());

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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Container(
              decoration: BoxDecoration(
                color:
                    !_model.isSelected ? Color(0xFFF3F3F3) : Color(0x00000000),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!FFAppState().IsPrivate && !FFAppState().isSubUser)
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(),
                            child: AutoSizeText(
                              getJsonField(
                                widget.jsonVehicles,
                                r'''$.sellerName''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 2.0),
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
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              AutoSizeText(
                                getJsonField(
                                  widget.jsonVehicles,
                                  r'''$.model''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Color(0xFF242729),
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            getJsonField(
                              widget.jsonVehicles,
                              r'''$.type''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            'CHF ${functions.formatNumberThousand(functions.stringToDouble(getJsonField(
                                  widget.jsonVehicles,
                                  r'''$.soldPrice''',
                                ).toString()) > 0.0 ? functions.stringToDouble(getJsonField(
                                widget.jsonVehicles,
                                r'''$.soldPrice''',
                              ).toString()) : functions.stringToDouble(getJsonField(
                                widget.jsonVehicles,
                                r'''$.minPrice''',
                              ).toString()))}',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            width: 150.0,
                            height: 40.0,
                            child: custom_widgets.CustomStopwatchCountDown(
                              width: 150.0,
                              height: 40.0,
                              secondsToShow: getJsonField(
                                widget.jsonVehicles,
                                r'''$.remainingTime''',
                              ),
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              actionOnEnded: () async {},
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            functions.changeDateFormat(
                                getJsonField(
                                  widget.jsonVehicles,
                                  r'''$.created''',
                                ).toString(),
                                0),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 8.0, 0.0),
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
                                    onPressed: () async {
                                      context.pushNamed(
                                        'VehicleDetail',
                                        queryParams: {
                                          'vehicleId': serializeParam(
                                            getJsonField(
                                              widget.jsonVehicles,
                                              r'''$.vehicleId''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'auctionId': serializeParam(
                                            getJsonField(
                                              widget.jsonVehicles,
                                              r'''$.auctionId''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ).animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation']!,
            ),
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
