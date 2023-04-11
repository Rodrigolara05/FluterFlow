import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_step0_model.dart';
export 'register_step0_model.dart';

class RegisterStep0Widget extends StatefulWidget {
  const RegisterStep0Widget({Key? key}) : super(key: key);

  @override
  _RegisterStep0WidgetState createState() => _RegisterStep0WidgetState();
}

class _RegisterStep0WidgetState extends State<RegisterStep0Widget> {
  late RegisterStep0Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterStep0Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().RegisterStep1 = [];
        FFAppState().RegisterStep2 = [];
        FFAppState().RegisterUsername = '';
      });
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
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'z45gjgsu' /* Registration */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        fontSize: 16.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(),
                  ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 562.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              children: [
                                if (MediaQuery.of(context).size.width >= 500.0)
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: BoxConstraints(
                                        maxHeight: 508.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                    ),
                                  ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(22.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 562.0,
                                      maxHeight:
                                          MediaQuery.of(context).size.width >=
                                                  500.0
                                              ? 500.0
                                              : 329.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pu0vmguj' /* REGISTRATION */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rq3c8cdf' /* Choose the user type */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.isPrivate =
                                                            false;
                                                      });
                                                      if (_model
                                                          .isProfessional!) {
                                                        setState(() {
                                                          _model.isProfessional =
                                                              false;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          _model.isProfessional =
                                                              true;
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .isProfessional!
                                                              ? Color(
                                                                  0xFF242729)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderColor,
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
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
                                                                          16.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kprivate,
                                                                color: _model
                                                                        .isProfessional!
                                                                    ? Color(
                                                                        0xFF242729)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
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
                                                                          'q3g6jdco' /* Professional */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              color: _model.isProfessional! ? Color(0xFF242729) : FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'b8m16l5o' /* Buy and sell unlimited vehicle... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color: _model.isProfessional!
                                                                                ? Color(0xFF242729)
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.isProfessional =
                                                          false;
                                                    });
                                                    if (_model.isPrivate!) {
                                                      setState(() {
                                                        _model.isPrivate =
                                                            false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _model.isPrivate = true;
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: _model.isPrivate!
                                                            ? Color(0xFF242729)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .borderColor,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
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
                                                                        16.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Icon(
                                                              FFIcons.kcarSport,
                                                              color: _model
                                                                      .isPrivate!
                                                                  ? Color(
                                                                      0xFF242729)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
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
                                                                            8.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'zs599vi2' /* Private */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleMediumFamily,
                                                                            color: _model.isPrivate!
                                                                                ? Color(0xFF242729)
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'iwqdgt1v' /* Sell cars (Auction up to 5 veh... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color: _model.isPrivate!
                                                                              ? Color(0xFF242729)
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width >=
                                              500.0)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.isProfessional!) {
                                                  if (FFAppState()
                                                      .isPrivateRegister) {
                                                    setState(() {
                                                      FFAppState()
                                                          .RegisterStep1 = [];
                                                      FFAppState()
                                                          .RegisterStep2 = [];
                                                      FFAppState()
                                                          .RegisterUsername = '';
                                                    });
                                                  }
                                                  setState(() {
                                                    FFAppState()
                                                            .isPrivateRegister =
                                                        false;
                                                  });

                                                  context.pushNamed(
                                                      'Professional1');
                                                } else {
                                                  if (_model.isPrivate!) {
                                                    if (FFAppState()
                                                        .isPrivateRegister) {
                                                      setState(() {
                                                        FFAppState()
                                                            .RegisterStep1 = [];
                                                        FFAppState()
                                                            .RegisterStep2 = [];
                                                        FFAppState()
                                                            .RegisterUsername = '';
                                                      });
                                                    }
                                                    setState(() {
                                                      FFAppState()
                                                              .isPrivateRegister =
                                                          true;
                                                    });

                                                    context
                                                        .pushNamed('Private1');
                                                  } else {
                                                    await actions
                                                        .snackbarAction(
                                                      context,
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Choose an option',
                                                        deText:
                                                            'Wählen Sie eine Option',
                                                        frText:
                                                            'Choisis une option',
                                                        itText:
                                                            'Scegliere un\'opzione',
                                                      ),
                                                    );
                                                  }
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'yqj7nawn' /* Next */,
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
                                        ],
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
                ),
                if (MediaQuery.of(context).size.width <= 500.0)
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 4.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().RegisterStep1 = [];
                                    FFAppState().RegisterStep2 = [];
                                    FFAppState().RegisterUsername = '';
                                  });
                                  context.pop();
                                },
                                text: FFLocalizations.of(context).getText(
                                  'c5aorz3y' /* Cancel */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Color(0xFFC5181D),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Color(0xFFC5181D),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 16.0, 0.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.isProfessional!) {
                                    if (FFAppState().isPrivateRegister) {
                                      setState(() {
                                        FFAppState().RegisterStep1 = [];
                                        FFAppState().RegisterStep2 = [];
                                        FFAppState().RegisterUsername = '';
                                      });
                                    }
                                    setState(() {
                                      FFAppState().isPrivateRegister = false;
                                    });

                                    context.pushNamed('Professional1');
                                  } else {
                                    if (_model.isPrivate!) {
                                      if (FFAppState().isPrivateRegister) {
                                        setState(() {
                                          FFAppState().RegisterStep1 = [];
                                          FFAppState().RegisterStep2 = [];
                                          FFAppState().RegisterUsername = '';
                                        });
                                      }
                                      setState(() {
                                        FFAppState().isPrivateRegister = true;
                                      });

                                      context.pushNamed('Private1');
                                    } else {
                                      await actions.snackbarAction(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Choose an option',
                                          deText: 'Wählen Sie eine Option',
                                          frText: 'Choisis une option',
                                          itText: 'Scegliere un\'opzione',
                                        ),
                                      );
                                    }
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'vifokur2' /* Next */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFC5181D),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
        ),
      ),
    );
  }
}
