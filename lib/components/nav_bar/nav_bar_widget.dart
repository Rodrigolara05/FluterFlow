import '/backend/api_requests/api_calls.dart';
import '/components/profile_web/profile_web_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with TickerProviderStateMixin {
  late NavBarModel _model;

  final animationsMap = {
    'mouseRegionOnActionTriggerAnimation1': AnimationInfo(
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
    'mouseRegionOnActionTriggerAnimation2': AnimationInfo(
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
    'mouseRegionOnActionTriggerAnimation3': AnimationInfo(
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
    _model = createModel(context, () => NavBarModel());

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

    return Visibility(
      visible: MediaQuery.of(context).size.width >= 500.0 ? true : false,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        context.pushNamed('HomePage');
                      },
                      child: Container(
                        width: 100.0,
                        height: 32.0,
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          'assets/images/EF24_logo.png',
                          height: 32.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 140.0,
                          height: 60.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.9),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: MouseCursor.defer ??
                                              MouseCursor.defer,
                                          child: Visibility(
                                            visible: !_model.hideElement1,
                                            child: Container(
                                              width: double.infinity,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            setState(() => _model
                                                .mouseRegion11Hovered = true);
                                          }),
                                          onExit: ((event) async {
                                            setState(() => _model
                                                .mouseRegion11Hovered = false);
                                          }),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'mouseRegionOnActionTriggerAnimation1']!,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'dvy528ai' /* HOW IT WORKS */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color: _model.hideElement1 ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
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
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegion1Hovered = true);
                        setState(() {
                          _model.hideElement1 = false;
                          _model.hideElement2 = true;
                          _model.hideElement3 = true;
                        });
                        if (animationsMap[
                                'mouseRegionOnActionTriggerAnimation1'] !=
                            null) {
                          await animationsMap[
                                  'mouseRegionOnActionTriggerAnimation1']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegion1Hovered = false);
                        setState(() {
                          _model.hideElement1 = true;
                        });
                      }),
                    ),
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            if (FFAppState().IsLoggedUser) {
                              context.pushNamed('RegisterCar_method');
                            } else {
                              context.pushNamed('Login');
                            }
                          },
                          child: Container(
                            width: 140.0,
                            height: 60.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.9),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Visibility(
                                              visible: !_model.hideElement2,
                                              child: Container(
                                                width: double.infinity,
                                                height: 3.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                            ),
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegion21Hovered = true);
                                            }),
                                            onExit: ((event) async {
                                              setState(() =>
                                                  _model.mouseRegion21Hovered =
                                                      false);
                                            }),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'mouseRegionOnActionTriggerAnimation2']!,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '04jyxanl' /* SELL VEHICLE */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color:
                                                    _model.hideElement2 == false
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.7),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '6dvs0nlt' /* Free! */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 13.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
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
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegion2Hovered = true);
                        setState(() {
                          _model.hideElement1 = true;
                          _model.hideElement2 = false;
                          _model.hideElement3 = true;
                        });
                        if (animationsMap[
                                'mouseRegionOnActionTriggerAnimation2'] !=
                            null) {
                          await animationsMap[
                                  'mouseRegionOnActionTriggerAnimation2']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegion2Hovered = false);
                        setState(() {
                          _model.hideElement2 = true;
                        });
                      }),
                    ),
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 140.0,
                          height: 60.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.9),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: MouseCursor.defer ??
                                              MouseCursor.defer,
                                          child: Visibility(
                                            visible: !_model.hideElement3,
                                            child: Container(
                                              width: double.infinity,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            setState(() => _model
                                                .mouseRegion31Hovered = true);
                                          }),
                                          onExit: ((event) async {
                                            setState(() => _model
                                                .mouseRegion31Hovered = false);
                                          }),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'mouseRegionOnActionTriggerAnimation3']!,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '1a8d4qbe' /* CONTACT US */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color: _model.hideElement3 ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
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
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegion3Hovered = true);
                        setState(() {
                          _model.hideElement1 = true;
                          _model.hideElement2 = true;
                          _model.hideElement3 = false;
                        });
                        if (animationsMap[
                                'mouseRegionOnActionTriggerAnimation3'] !=
                            null) {
                          await animationsMap[
                                  'mouseRegionOnActionTriggerAnimation3']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegion3Hovered = false);
                        setState(() {
                          _model.hideElement3 = true;
                        });
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().IsLoggedUser)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00000000),
                              enableDrag: false,
                              context: context,
                              builder: (bottomSheetContext) {
                                return Padding(
                                  padding: MediaQuery.of(bottomSheetContext)
                                      .viewInsets,
                                  child: Container(
                                    height: double.infinity,
                                    child: ProfileWebWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: FFAppState().IsLoggedUser
                              ? '${FFLocalizations.of(context).getVariableText(
                                  enText: '',
                                  deText: '',
                                  frText: 'Le coin de ',
                                  itText: 'L\'angolo di ',
                                )}${FFAppState().firstName}${FFLocalizations.of(context).getVariableText(
                                  enText: '\'s corner',
                                  deText: 's Ecke',
                                  frText: '',
                                  itText: '',
                                )}'
                              : FFLocalizations.of(context).getVariableText(
                                  enText: 'User\'s corner',
                                  deText: 'Benutzerecke',
                                  frText: 'Le coin des utilisateurs',
                                  itText: 'L\'angolo dell\'utente',
                                ),
                          icon: FaIcon(
                            FontAwesomeIcons.userCircle,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 16.0,
                          ),
                          options: FFButtonOptions(
                            height: 32.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    if (!FFAppState().IsLoggedUser)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('Register_Step0');
                          },
                          text: FFLocalizations.of(context).getText(
                            'kdngcgqr' /* REGISTRATION */,
                          ),
                          options: FFButtonOptions(
                            height: 32.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    if (!FFAppState().IsLoggedUser)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('Login');
                          },
                          text: FFLocalizations.of(context).getText(
                            '3gwrz9ea' /* LOGIN */,
                          ),
                          options: FFButtonOptions(
                            height: 32.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    if (FFAppState().IsLoggedUser)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await EFDevGroup.logoutUserCall.call(
                              email: FFAppState().userEmail,
                            );
                            setState(() {
                              FFAppState().IsLoggedUser = false;
                              FFAppState().IsPrivate = true;
                              FFAppState().AccessToken = '';
                              FFAppState().RefreshToken = '';
                              FFAppState().TokenExpiration =
                                  DateTime.fromMillisecondsSinceEpoch(
                                      1672549200000);
                              FFAppState().isSubUser = false;
                              FFAppState().UserId =
                                  '00000000-0000-0000-0000-000000000000';
                              FFAppState().userEmail = '';
                              FFAppState().companyId = '';
                            });

                            context.goNamed('HomePage');

                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'yprw9j51' /* LOGOUT */,
                          ),
                          options: FFButtonOptions(
                            height: 32.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    FlutterFlowLanguageSelector(
                      width: 100.0,
                      height: 32.0,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                      dropdownIconColor: Color(0xFF14181B),
                      borderRadius: 6.0,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      hideFlags: true,
                      flagSize: 24.0,
                      flagTextGap: 8.0,
                      currentLanguage: FFLocalizations.of(context).languageCode,
                      languages: FFLocalizations.languages(),
                      onChanged: (lang) => setAppLanguage(context, lang),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
