import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_animation_rojo_negro_model.dart';
export 'button_animation_rojo_negro_model.dart';

class ButtonAnimationRojoNegroWidget extends StatefulWidget {
  const ButtonAnimationRojoNegroWidget({Key? key}) : super(key: key);

  @override
  _ButtonAnimationRojoNegroWidgetState createState() =>
      _ButtonAnimationRojoNegroWidgetState();
}

class _ButtonAnimationRojoNegroWidgetState
    extends State<ButtonAnimationRojoNegroWidget>
    with TickerProviderStateMixin {
  late ButtonAnimationRojoNegroModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 800.ms,
          begin: 1.0,
          end: 5.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 800.ms,
          begin: Offset(-500.0, 0.0),
          end: Offset(100.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => ButtonAnimationRojoNegroModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 250.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '5b8lyw6r' /* Button */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Container(
                        width: 250.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation1']!,
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '5u48kh5r' /* Button */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                  ],
                ),
              ),
            ),
            onEnter: ((event) async {
              setState(() => _model.mouseRegionHovered = true);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                await animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0);
              }
            }),
            onExit: ((event) async {
              setState(() => _model.mouseRegionHovered = false);
            }),
          ),
        ],
      ),
    );
  }
}
