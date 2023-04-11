import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_animation_blanco_rojo_model.dart';
export 'button_animation_blanco_rojo_model.dart';

class ButtonAnimationBlancoRojoWidget extends StatefulWidget {
  const ButtonAnimationBlancoRojoWidget({
    Key? key,
    this.btnText,
  }) : super(key: key);

  final String? btnText;

  @override
  _ButtonAnimationBlancoRojoWidgetState createState() =>
      _ButtonAnimationBlancoRojoWidgetState();
}

class _ButtonAnimationBlancoRojoWidgetState
    extends State<ButtonAnimationBlancoRojoWidget>
    with TickerProviderStateMixin {
  late ButtonAnimationBlancoRojoModel _model;

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
    _model = createModel(context, () => ButtonAnimationBlancoRojoModel());

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
      height: 50.0,
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
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
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
                              widget.btnText!,
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
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation1']!,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
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
                                'grnt4ogh' /* Button */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .stop();
              }
            }),
          ),
        ],
      ),
    );
  }
}
