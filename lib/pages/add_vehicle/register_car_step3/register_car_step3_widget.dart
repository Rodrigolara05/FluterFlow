import '/backend/api_requests/api_calls.dart';
import '/components/loose_progress/loose_progress_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/picture_preview/picture_preview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_car_step3_model.dart';
export 'register_car_step3_model.dart';

class RegisterCarStep3Widget extends StatefulWidget {
  const RegisterCarStep3Widget({
    Key? key,
    this.isDamaged,
    this.isDocsAvailable,
    this.withBack,
  }) : super(key: key);

  final bool? isDamaged;
  final bool? isDocsAvailable;
  final bool? withBack;

  @override
  _RegisterCarStep3WidgetState createState() => _RegisterCarStep3WidgetState();
}

class _RegisterCarStep3WidgetState extends State<RegisterCarStep3Widget> {
  late RegisterCarStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterCarStep3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().isLoading = false;
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
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '2smpm6ev' /* Add Vehicle */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                actions: [
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
                      if (widget.isDocsAvailable != null) {
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
            child: Stack(
              children: [
                Container(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
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
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          width: 200.0,
                                          height: 3.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                .primaryText,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 32.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidCheckCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      '2hav57hn' /* Data */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 32.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidCheckCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      'vcpl82dp' /* Details */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons.kcamera,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      'tk1ws0eq' /* Attachments */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFABABAB),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons
                                                              .kclarityCoinBagSolid,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      '83qpx4jh' /* Auction */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
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
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                  'yewe94cw' /* STEP 3 OF 4 */,
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
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'gilx31zi' /* Pictures & Documents */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: EFDevGroup
                                                                .getVehicleImagesCall
                                                                .call(
                                                              vehicleId:
                                                                  FFAppState()
                                                                      .NewVehicleId,
                                                              language: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final iconButtonGetVehicleImagesResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (functions
                                                                          .getCountList(
                                                                              getJsonField(
                                                                        iconButtonGetVehicleImagesResponse
                                                                            .jsonBody,
                                                                        r'''$.items''',
                                                                      )) <
                                                                      40) {
                                                                    setState(
                                                                        () {
                                                                      _model.isNotLoading =
                                                                          false;
                                                                    });
                                                                    _model.apiResultUploadImages =
                                                                        await actions
                                                                            .uploadImagesToAzure(
                                                                      context,
                                                                      FFAppState()
                                                                          .BlobConnectionString,
                                                                      FFAppState()
                                                                          .NewVehicleId,
                                                                      0,
                                                                      40 -
                                                                          functions
                                                                              .getCountList(getJsonField(
                                                                            iconButtonGetVehicleImagesResponse.jsonBody,
                                                                            r'''$.items''',
                                                                          )),
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'One or more pictures are in portrait mode',
                                                                        deText:
                                                                            'Ein oder mehrere Bilder befinden sich im Hochformat',
                                                                        frText:
                                                                            'Une ou plusieurs photos sont en mode portrait',
                                                                        itText:
                                                                            'Una o più immagini sono in modalità verticale',
                                                                      ),
                                                                    );
                                                                    if ((_model.apiResultUploadImages !=
                                                                            null) &&
                                                                        functions
                                                                            .isNullList(_model.apiResultUploadImages)) {
                                                                      _model.apiResultSaveImages = await EFDevGroup
                                                                          .postVehicleInfoImagesCollectionCall
                                                                          .call(
                                                                        jsonBodyJson:
                                                                            _model.apiResultUploadImages,
                                                                      );
                                                                      setState(() =>
                                                                          _model.apiRequestCompleter1 =
                                                                              null);
                                                                      await _model.waitForApiRequestCompleted1(
                                                                          minWait:
                                                                              2);
                                                                    }
                                                                  }
                                                                  setState(() {
                                                                    _model.isNotLoading =
                                                                        true;
                                                                  });

                                                                  setState(
                                                                      () {});
                                                                },
                                                              );
                                                            },
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
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'm1fd6qa5' /* 4 images */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: Color(
                                                                        0x9A101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'm49yrssy' /*  min are */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: Color(
                                                                        0x9A101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '8i4evp1y' /* required. */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: Color(
                                                                        0x9A101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
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
                                                                  8.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width >=
                                                                500.0
                                                            ? 400.0
                                                            : MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'feteja1s' /* Upload Max */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'vzry0211' /* 40 images */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            3.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'r3e944kk' /* Image size */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '1xkpsfvp' /* 5MB */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                              flex: 1,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            3.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'pymalrv9' /* Orientation */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'c49mprw1' /* Landscape */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                          'nd9nbxu8' /* Please upload photos with thes... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: Color(
                                                                      0x9A101213),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_6.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_7.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_8.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_14.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_13.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_9.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_10.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_11.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_15.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_16.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_17.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 64.0
                                                                            : 32.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/image_18.png',
                                                                          fit: BoxFit
                                                                              .contain,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future: EFDevGroup
                                                                      .getVehicleImagesCall
                                                                      .call(
                                                                    vehicleId:
                                                                        FFAppState()
                                                                            .NewVehicleId,
                                                                    language: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  builder: (context,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final textGetVehicleImagesResponse =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      '${FFLocalizations.of(context).getVariableText(
                                                                        enText:
                                                                            'Images ',
                                                                        deText:
                                                                            'Bilder ',
                                                                        frText:
                                                                            'Images ',
                                                                        itText:
                                                                            'Immagini ',
                                                                      )}${textGetVehicleImagesResponse.succeeded ? functions.getCountList(getJsonField(
                                                                            textGetVehicleImagesResponse.jsonBody,
                                                                            r'''$.items''',
                                                                          )).toString() : '0'}/40',
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
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
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
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              8.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.trashAlt,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().areImagesCheckVisible) {
                                                                                setState(() {
                                                                                  FFAppState().areImagesCheckVisible = false;
                                                                                });
                                                                              } else {
                                                                                setState(() {
                                                                                  FFAppState().areImagesCheckVisible = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'fsd2abv0' /* Multiple Selection */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Colors.white,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: Color(0xFFC5181D),
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                    ],
                                                                  ),
                                                              ],
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
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: (_model
                                                                      .apiRequestCompleter1 ??=
                                                                  Completer<
                                                                      ApiCallResponse>()
                                                                    ..complete(
                                                                        EFDevGroup
                                                                            .getVehicleImagesCall
                                                                            .call(
                                                                      vehicleId:
                                                                          FFAppState()
                                                                              .NewVehicleId,
                                                                      language:
                                                                          FFLocalizations.of(context)
                                                                              .languageCode,
                                                                    )))
                                                              .future,
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
                                                            final gridViewImagesGetVehicleImagesResponse =
                                                                snapshot.data!;
                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final vehicleImages =
                                                                    getJsonField(
                                                                  gridViewImagesGetVehicleImagesResponse
                                                                      .jsonBody,
                                                                  r'''$.items''',
                                                                )
                                                                        .toList()
                                                                        .take(
                                                                            40)
                                                                        .toList();
                                                                if (vehicleImages
                                                                    .isEmpty) {
                                                                  return Center(
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/car.svg',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  );
                                                                }
                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        4,
                                                                    crossAxisSpacing:
                                                                        2.0,
                                                                    mainAxisSpacing:
                                                                        2.0,
                                                                    childAspectRatio:
                                                                        1.5,
                                                                  ),
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      vehicleImages
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          vehicleImagesIndex) {
                                                                    final vehicleImagesItem =
                                                                        vehicleImages[
                                                                            vehicleImagesIndex];
                                                                    return Stack(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: MediaQuery.of(context).size.height * 1.0,
                                                                                      child: PicturePreviewWidget(
                                                                                        imagePath: functions.getFileFullPath(
                                                                                            getJsonField(
                                                                                              vehicleImagesItem,
                                                                                              r'''$.imageBlogName''',
                                                                                            ).toString(),
                                                                                            0,
                                                                                            FFAppState().BaseFilePath,
                                                                                            FFAppState().NewVehicleId),
                                                                                        imageLocation: 0,
                                                                                        imageId: getJsonField(
                                                                                          vehicleImagesItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        imageName: getJsonField(
                                                                                          vehicleImagesItem,
                                                                                          r'''$.imageBlogName''',
                                                                                        ).toString(),
                                                                                        vehicleId: FFAppState().NewVehicleId,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            setState(() =>
                                                                                _model.apiRequestCompleter1 = null);
                                                                            await _model.waitForApiRequestCompleted1();
                                                                          },
                                                                          child:
                                                                              Image.network(
                                                                            functions.getFileFullPath(
                                                                                getJsonField(
                                                                                  vehicleImagesItem,
                                                                                  r'''$.imageBlogName''',
                                                                                ).toString(),
                                                                                0,
                                                                                FFAppState().BaseFilePath,
                                                                                FFAppState().NewVehicleId),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (widget.isDamaged ?? true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 808.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
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
                                                                    16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
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
                                                                    'd214s8a1' /* Vehicle damage */,
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
                                                              ],
                                                            ),
                                                            FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: EFDevGroup
                                                                  .getDamagedVehicleImagesCall
                                                                  .call(
                                                                vehicleId:
                                                                    FFAppState()
                                                                        .NewVehicleId,
                                                                language: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              builder: (context,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final iconButtonGetDamagedVehicleImagesResponse =
                                                                    snapshot
                                                                        .data!;
                                                                return FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if (functions
                                                                            .getCountList(getJsonField(
                                                                          iconButtonGetDamagedVehicleImagesResponse
                                                                              .jsonBody,
                                                                          r'''$.items''',
                                                                        )) <
                                                                        12) {
                                                                      setState(
                                                                          () {
                                                                        _model.isNotLoading =
                                                                            false;
                                                                      });
                                                                      _model.apiResultUploadDamages =
                                                                          await actions
                                                                              .uploadImagesToAzure(
                                                                        context,
                                                                        FFAppState()
                                                                            .BlobConnectionString,
                                                                        FFAppState()
                                                                            .NewVehicleId,
                                                                        1,
                                                                        12 -
                                                                            functions.getCountList(getJsonField(
                                                                              iconButtonGetDamagedVehicleImagesResponse.jsonBody,
                                                                              r'''$.items''',
                                                                            )),
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'One or more pictures are in portrait mode',
                                                                          deText:
                                                                              'Ein oder mehrere Bilder befinden sich im Hochformat',
                                                                          frText:
                                                                              'Une ou plusieurs photos sont en mode portrait',
                                                                          itText:
                                                                              'Una o più immagini sono in modalità verticale',
                                                                        ),
                                                                      );
                                                                      if (_model
                                                                              .apiResultUploadDamages !=
                                                                          null) {
                                                                        _model.apiResultSaveDamages = await EFDevGroup
                                                                            .postVehicleInfoDamagedImagesCollectionCall
                                                                            .call(
                                                                          jsonBodyJson:
                                                                              _model.apiResultUploadDamages,
                                                                        );
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter2 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted2();
                                                                      }
                                                                    }
                                                                    setState(
                                                                        () {
                                                                      _model.isNotLoading =
                                                                          true;
                                                                    });

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      16.0,
                                                                      8.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'i0z5s2yf' /* Upload Max */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'yr1vux30' /* 12 images */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            3.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'cod876c6' /* Image size */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'q2elhh3k' /* 5MB */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            3.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0ulmtpud' /* Orientation */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'wvsl4pxr' /* Landscape */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.bold,
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
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: EFDevGroup
                                                                        .getDamagedVehicleImagesCall
                                                                        .call(
                                                                      vehicleId:
                                                                          FFAppState()
                                                                              .NewVehicleId,
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
                                                                      final textGetDamagedVehicleImagesResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        '${FFLocalizations.of(context).getVariableText(
                                                                          enText:
                                                                              'Images ',
                                                                          deText:
                                                                              'Bilder ',
                                                                          frText:
                                                                              'Images ',
                                                                          itText:
                                                                              'Immagini ',
                                                                        )}${textGetDamagedVehicleImagesResponse.succeeded ? functions.getCountList(getJsonField(
                                                                              textGetDamagedVehicleImagesResponse.jsonBody,
                                                                              r'''$.items''',
                                                                            )).toString() : '0'}/12',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
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
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.trashAlt,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 16.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () {
                                                                                print('ButtonCancel pressed ...');
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'tufz1kc7' /* Multiple Selection */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: Colors.white,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: Color(0xFFC5181D),
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                      ],
                                                                    ),
                                                                ],
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
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: (_model.apiRequestCompleter2 ??= Completer<
                                                                    ApiCallResponse>()
                                                                  ..complete(
                                                                      EFDevGroup
                                                                          .getDamagedVehicleImagesCall
                                                                          .call(
                                                                    vehicleId:
                                                                        FFAppState()
                                                                            .NewVehicleId,
                                                                    language: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )))
                                                                .future,
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final gridViewDamagesGetDamagedVehicleImagesResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return Builder(
                                                                builder:
                                                                    (context) {
                                                                  final damagedImages =
                                                                      getJsonField(
                                                                    gridViewDamagesGetDamagedVehicleImagesResponse
                                                                        .jsonBody,
                                                                    r'''$.items''',
                                                                  ).toList();
                                                                  if (damagedImages
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/car-red.svg',
                                                                      ),
                                                                    );
                                                                  }
                                                                  return GridView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    gridDelegate:
                                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          4,
                                                                      crossAxisSpacing:
                                                                          2.0,
                                                                      mainAxisSpacing:
                                                                          2.0,
                                                                      childAspectRatio:
                                                                          1.5,
                                                                    ),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        damagedImages
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            damagedImagesIndex) {
                                                                      final damagedImagesItem =
                                                                          damagedImages[
                                                                              damagedImagesIndex];
                                                                      return Stack(
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                barrierColor: Color(0x00000000),
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (bottomSheetContext) {
                                                                                  return GestureDetector(
                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 0.4,
                                                                                        child: PicturePreviewWidget(
                                                                                          imagePath: functions.getFileFullPath(
                                                                                              getJsonField(
                                                                                                damagedImagesItem,
                                                                                                r'''$.imageBlogName''',
                                                                                              ).toString(),
                                                                                              1,
                                                                                              FFAppState().BaseFilePath,
                                                                                              FFAppState().NewVehicleId),
                                                                                          imageLocation: 1,
                                                                                          imageId: getJsonField(
                                                                                            damagedImagesItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          imageName: getJsonField(
                                                                                            damagedImagesItem,
                                                                                            r'''$.imageBlogName''',
                                                                                          ).toString(),
                                                                                          vehicleId: FFAppState().NewVehicleId,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));

                                                                              setState(() => _model.apiRequestCompleter2 = null);
                                                                              await _model.waitForApiRequestCompleted2();
                                                                            },
                                                                            child:
                                                                                Image.network(
                                                                              functions.getFileFullPath(
                                                                                  getJsonField(
                                                                                    damagedImagesItem,
                                                                                    r'''$.imageBlogName''',
                                                                                  ).toString(),
                                                                                  1,
                                                                                  FFAppState().BaseFilePath,
                                                                                  FFAppState().NewVehicleId),
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
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
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
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
                                                          'wf01av5p' /* Vehicle Registration Document */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
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
                                                      child:
                                                          FlutterFlowRadioButton(
                                                        options: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ebgpi8jn' /* Available */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '4y91afq9' /* Will be suplied later */,
                                                          )
                                                        ].toList(),
                                                        onChanged: (val) =>
                                                            setState(() {}),
                                                        controller: _model
                                                                .radioButtonController ??=
                                                            FormFieldController<
                                                                String>(widget
                                                                        .isDocsAvailable !=
                                                                    null
                                                                ? widget
                                                                    .isDocsAvailable!
                                                                    .toString()
                                                                : FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                    enText:
                                                                        'Available',
                                                                    deText:
                                                                        'Verfügbar',
                                                                    frText:
                                                                        'Disponible',
                                                                    itText:
                                                                        'Disponibile',
                                                                  )),
                                                        optionHeight: 25.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        buttonPosition:
                                                            RadioButtonPosition
                                                                .left,
                                                        direction:
                                                            Axis.vertical,
                                                        radioButtonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveRadioButtonColor:
                                                            Color(0x8A000000),
                                                        toggleable: false,
                                                        horizontalAlignment:
                                                            WrapAlignment.start,
                                                        verticalAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                    if (_model.radioButtonValue !=
                                                                null &&
                                                            _model.radioButtonValue !=
                                                                ''
                                                        ? valueOrDefault<bool>(
                                                            _model
                                                                    .radioButtonValue ==
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      'Available',
                                                                  deText:
                                                                      'Verfügbar',
                                                                  frText:
                                                                      'Disponible',
                                                                  itText:
                                                                      'Disponibile',
                                                                ),
                                                            true,
                                                          )
                                                        : true)
                                                      Column(
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
                                                                        8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'guufi58b' /* You can upload vehicle documen... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: Color(
                                                                        0x9A101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
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
                                                                '0gv8j1in' /* 1 file required. */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: Color(
                                                                        0x9A101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: (_model
                                                                  .apiRequestCompleter3 ??=
                                                              Completer<
                                                                  ApiCallResponse>()
                                                                ..complete(
                                                                    EFDevGroup
                                                                        .getVehicleFilesCall
                                                                        .call(
                                                                  vehicleId:
                                                                      FFAppState()
                                                                          .NewVehicleId,
                                                                  language: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
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
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final listViewFilesGetVehicleFilesResponse =
                                                            snapshot.data!;
                                                        return ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            if (_model.radioButtonValue !=
                                                                        null &&
                                                                    _model.radioButtonValue !=
                                                                        ''
                                                                ? valueOrDefault<
                                                                    bool>(
                                                                    _model
                                                                            .radioButtonValue ==
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'Available',
                                                                          deText:
                                                                              'Verfügbar',
                                                                          frText:
                                                                              'Disponible',
                                                                          itText:
                                                                              'Disponibile',
                                                                        ),
                                                                    true,
                                                                  )
                                                                : true)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(),
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
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .upload,
                                                                        color: getJsonField(
                                                                                  listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                                ) !=
                                                                                null
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        setState(
                                                                            () {
                                                                          _model.isNotLoading =
                                                                              false;
                                                                        });
                                                                        _model.isFileUploaded00 =
                                                                            await actions.uploadFileToAzure(
                                                                          FFAppState()
                                                                              .BlobConnectionString,
                                                                          FFAppState()
                                                                              .NewVehicleId,
                                                                          '00',
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if (_model.isFileUploaded00 !=
                                                                                null &&
                                                                            _model.isFileUploaded00 !=
                                                                                '') {
                                                                          if (getJsonField(
                                                                                listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                              ) ==
                                                                              null) {
                                                                            await EFDevGroup.postVehicleFilesCall.call(
                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                              positionDescriptor: 0,
                                                                              imageBlobName: _model.isFileUploaded00,
                                                                            );
                                                                          }
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter3 = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted3();
                                                                          setState(
                                                                              () {
                                                                            _model.isNotLoading =
                                                                                true;
                                                                          });
                                                                          await actions
                                                                              .snackbarAction(
                                                                            context,
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'File saved',
                                                                              deText: 'Datei gespeichert',
                                                                              frText: 'Fichier enregistré',
                                                                              itText: 'File salvato',
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            _model.isNotLoading =
                                                                                true;
                                                                          });
                                                                          await actions
                                                                              .snackbarAction(
                                                                            context,
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'Error saving file',
                                                                              deText: 'Fehler beim Speichern der Datei',
                                                                              frText: 'Erreur lors de l\'enregistrement du fichier',
                                                                              itText: 'Errore durante il salvataggio del file',
                                                                            ),
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'cgxprgfx' /* 1. Vehicle Registration Card */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: getJsonField(
                                                                                        listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                                      ) !=
                                                                                      null
                                                                                  ? FlutterFlowTheme.of(context).primary
                                                                                  : FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          listViewFilesGetVehicleFilesResponse
                                                                              .jsonBody,
                                                                          r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                        ) !=
                                                                        null)
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.azureDeleteFile0 = await actions.deleteFileFromAzure(
                                                                                FFAppState().BlobConnectionString,
                                                                                getJsonField(
                                                                                  listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 0)].fileBlogName''',
                                                                                ).toString(),
                                                                                2,
                                                                                FFAppState().NewVehicleId,
                                                                              );
                                                                              if (_model.azureDeleteFile0 == null || _model.azureDeleteFile0 == '') {
                                                                                _model.apiResultDeleteFile = await EFDevGroup.deleteFileCall.call(
                                                                                  imageId: getJsonField(
                                                                                    listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                    r'''$.items[?(@.positionDescriptor == 0)].id''',
                                                                                  ).toString(),
                                                                                );
                                                                                if ((_model.apiResultDeleteFile?.succeeded ?? true)) {
                                                                                  setState(() => _model.apiRequestCompleter3 = null);
                                                                                  await _model.waitForApiRequestCompleted3();
                                                                                  await actions.snackbarAction(
                                                                                    context,
                                                                                    FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'File deleted',
                                                                                      deText: 'Datei gelöscht',
                                                                                      frText: 'Fichier supprimé',
                                                                                      itText: 'File eliminato',
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.close_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (_model.radioButtonValue !=
                                                                        null &&
                                                                    _model.radioButtonValue !=
                                                                        ''
                                                                ? valueOrDefault<
                                                                    bool>(
                                                                    _model
                                                                            .radioButtonValue ==
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'Available',
                                                                          deText:
                                                                              'Verfügbar',
                                                                          frText:
                                                                              'Disponible',
                                                                          itText:
                                                                              'Disponibile',
                                                                        ),
                                                                    true,
                                                                  )
                                                                : true)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(),
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
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .upload,
                                                                        color: getJsonField(
                                                                                  listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                                ) !=
                                                                                null
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        setState(
                                                                            () {
                                                                          _model.isNotLoading =
                                                                              false;
                                                                        });
                                                                        _model.isFileUploaded01 =
                                                                            await actions.uploadFileToAzure(
                                                                          FFAppState()
                                                                              .BlobConnectionString,
                                                                          FFAppState()
                                                                              .NewVehicleId,
                                                                          '01',
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if (_model.isFileUploaded01 !=
                                                                                null &&
                                                                            _model.isFileUploaded01 !=
                                                                                '') {
                                                                          if (getJsonField(
                                                                                listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                              ) ==
                                                                              null) {
                                                                            await EFDevGroup.postVehicleFilesCall.call(
                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                              positionDescriptor: 1,
                                                                              imageBlobName: _model.isFileUploaded01,
                                                                            );
                                                                          }
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter3 = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted3();
                                                                          setState(
                                                                              () {
                                                                            _model.isNotLoading =
                                                                                true;
                                                                          });
                                                                          await actions
                                                                              .snackbarAction(
                                                                            context,
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'File saved',
                                                                              deText: 'Datei gespeichert',
                                                                              frText: 'Fichier enregistré',
                                                                              itText: 'File salvato',
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          await actions
                                                                              .snackbarAction(
                                                                            context,
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'Error saving file',
                                                                              deText: 'Fehler beim Speichern der Datei',
                                                                              frText: 'Erreur lors de l\'enregistrement du fichier',
                                                                              itText: 'Errore durante il salvataggio del file',
                                                                            ),
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            _model.isNotLoading =
                                                                                true;
                                                                          });
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'f2gescgh' /* 2. Service certificate */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: getJsonField(
                                                                                        listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                                      ) !=
                                                                                      null
                                                                                  ? FlutterFlowTheme.of(context).primary
                                                                                  : FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          listViewFilesGetVehicleFilesResponse
                                                                              .jsonBody,
                                                                          r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                        ) !=
                                                                        null)
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.azureDeleteFile1 = await actions.deleteFileFromAzure(
                                                                                FFAppState().BlobConnectionString,
                                                                                getJsonField(
                                                                                  listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 1)].fileBlogName''',
                                                                                ).toString(),
                                                                                2,
                                                                                FFAppState().NewVehicleId,
                                                                              );
                                                                              if (_model.azureDeleteFile1 == null || _model.azureDeleteFile1 == '') {
                                                                                _model.apiResultDeleteFile1 = await EFDevGroup.deleteFileCall.call(
                                                                                  imageId: getJsonField(
                                                                                    listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                    r'''$.items[?(@.positionDescriptor == 1)].id''',
                                                                                  ).toString(),
                                                                                );
                                                                                if ((_model.apiResultDeleteFile1?.succeeded ?? true)) {
                                                                                  setState(() => _model.apiRequestCompleter3 = null);
                                                                                  await _model.waitForApiRequestCompleted3();
                                                                                  await actions.snackbarAction(
                                                                                    context,
                                                                                    FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'File deleted',
                                                                                      deText: 'Datei gelöscht',
                                                                                      frText: 'Fichier supprimé',
                                                                                      itText: 'File eliminato',
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.close_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (_model.radioButtonValue !=
                                                                        null &&
                                                                    _model.radioButtonValue !=
                                                                        ''
                                                                ? valueOrDefault<
                                                                    bool>(
                                                                    _model
                                                                            .radioButtonValue ==
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'Available',
                                                                          deText:
                                                                              'Verfügbar',
                                                                          frText:
                                                                              'Disponible',
                                                                          itText:
                                                                              'Disponibile',
                                                                        ),
                                                                    true,
                                                                  )
                                                                : true)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(),
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
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .upload,
                                                                        color: getJsonField(
                                                                                  listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 2)]''',
                                                                                ) !=
                                                                                null
                                                                            ? FlutterFlowTheme.of(context).secondaryText
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        setState(
                                                                            () {
                                                                          _model.isNotLoading =
                                                                              false;
                                                                        });
                                                                        _model.isFileUploaded02 =
                                                                            await actions.uploadFileToAzure(
                                                                          FFAppState()
                                                                              .BlobConnectionString,
                                                                          FFAppState()
                                                                              .NewVehicleId,
                                                                          '02',
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if (_model.isFileUploaded02 !=
                                                                                null &&
                                                                            _model.isFileUploaded02 !=
                                                                                '') {
                                                                          if (getJsonField(
                                                                                listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                              ) ==
                                                                              null) {
                                                                            await EFDevGroup.postVehicleFilesCall.call(
                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                              positionDescriptor: 2,
                                                                              imageBlobName: _model.isFileUploaded02,
                                                                            );
                                                                          }
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter3 = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted3();
                                                                          setState(
                                                                              () {
                                                                            _model.isNotLoading =
                                                                                true;
                                                                          });
                                                                          await actions
                                                                              .snackbarAction(
                                                                            context,
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'File saved',
                                                                              deText: 'Datei gespeichert',
                                                                              frText: 'Fichier enregistré',
                                                                              itText: 'File salvato',
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          await actions
                                                                              .snackbarAction(
                                                                            context,
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'Error saving file',
                                                                              deText: 'Fehler beim Speichern der Datei',
                                                                              frText: 'Erreur lors de l\'enregistrement du fichier',
                                                                              itText: 'Errore durante il salvataggio del file',
                                                                            ),
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            _model.isNotLoading =
                                                                                true;
                                                                          });
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '15tuhwv1' /* 3. Other documents */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: getJsonField(
                                                                                        listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 2)]''',
                                                                                      ) !=
                                                                                      null
                                                                                  ? FlutterFlowTheme.of(context).primary
                                                                                  : FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          listViewFilesGetVehicleFilesResponse
                                                                              .jsonBody,
                                                                          r'''$.items[?(@.positionDescriptor == 2)]''',
                                                                        ) !=
                                                                        null)
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.azureDeleteFile2 = await actions.deleteFileFromAzure(
                                                                                FFAppState().BlobConnectionString,
                                                                                getJsonField(
                                                                                  listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 2)].fileBlogName''',
                                                                                ).toString(),
                                                                                2,
                                                                                FFAppState().NewVehicleId,
                                                                              );
                                                                              if (_model.azureDeleteFile2 == null || _model.azureDeleteFile2 == '') {
                                                                                _model.apiResultDeleteFile2 = await EFDevGroup.deleteFileCall.call(
                                                                                  imageId: getJsonField(
                                                                                    listViewFilesGetVehicleFilesResponse.jsonBody,
                                                                                    r'''$.items[?(@.positionDescriptor == 2)].id''',
                                                                                  ).toString(),
                                                                                );
                                                                                if ((_model.apiResultDeleteFile2?.succeeded ?? true)) {
                                                                                  setState(() => _model.apiRequestCompleter3 = null);
                                                                                  await _model.waitForApiRequestCompleted3();
                                                                                  await actions.snackbarAction(
                                                                                    context,
                                                                                    FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'File deleted',
                                                                                      deText: 'Datei gelöscht',
                                                                                      frText: 'Fichier supprimé',
                                                                                      itText: 'File eliminato',
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.close_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      },
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'g4n4s01j' /* Back */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Color(
                                                                    0xFFC5181D),
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFC5181D),
                                                        width: 1.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.apiResultImagesNext =
                                                          await EFDevGroup
                                                              .getVehicleImagesCall
                                                              .call(
                                                        vehicleId: FFAppState()
                                                            .NewVehicleId,
                                                        language:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      );
                                                      _shouldSetState = true;
                                                      _model.apiResultDamagedImagesNext =
                                                          await EFDevGroup
                                                              .getDamagedVehicleImagesCall
                                                              .call(
                                                        vehicleId: FFAppState()
                                                            .NewVehicleId,
                                                        language:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      );
                                                      _shouldSetState = true;
                                                      _model.apiResultFiles =
                                                          await EFDevGroup
                                                              .getVehicleFilesCall
                                                              .call(
                                                        vehicleId: FFAppState()
                                                            .NewVehicleId,
                                                        language:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model.apiResultImagesNext
                                                                  ?.succeeded ??
                                                              true) &&
                                                          (functions.getCountList(
                                                                  getJsonField(
                                                                (_model.apiResultImagesNext
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.items''',
                                                              )) >=
                                                              4)) {
                                                        if (widget.isDamaged ==
                                                                true
                                                            ? (functions.getCountList(
                                                                    getJsonField(
                                                                  (_model.apiResultDamagedImagesNext
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.items''',
                                                                )) >
                                                                0)
                                                            : true) {
                                                          if ((_model.radioButtonValue !=
                                                                          null &&
                                                                      _model.radioButtonValue !=
                                                                          '') &&
                                                                  (_model
                                                                          .radioButtonValue ==
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Available',
                                                                        deText:
                                                                            'Verfügbar',
                                                                        frText:
                                                                            'Disponible',
                                                                        itText:
                                                                            'Disponibile',
                                                                      ))
                                                              ? (getJsonField(
                                                                    (_model.apiResultFiles
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.items[0]''',
                                                                  ) !=
                                                                  null)
                                                              : ((_model.radioButtonValue !=
                                                                              null &&
                                                                          _model.radioButtonValue !=
                                                                              '') &&
                                                                      (_model
                                                                              .radioButtonValue !=
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'Available',
                                                                            deText:
                                                                                'Verfügbar',
                                                                            frText:
                                                                                'Disponible',
                                                                            itText:
                                                                                'Disponibile',
                                                                          ))
                                                                  ? true
                                                                  : false)) {
                                                            _model.apiUpdateStep3Result =
                                                                await EFDevGroup
                                                                    .updateVehicleStepThreeCall
                                                                    .call(
                                                              creatorUserId:
                                                                  FFAppState()
                                                                      .UserId,
                                                              vehicleId:
                                                                  FFAppState()
                                                                      .NewVehicleId,
                                                              isCompleteInfo:
                                                                  true,
                                                              lastModifierId:
                                                                  FFAppState()
                                                                      .UserId,
                                                              language: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                              isRegistrationAvailable: _model
                                                                      .radioButtonValue ==
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Available',
                                                                    deText:
                                                                        'Erhältlich',
                                                                    frText:
                                                                        'Disponible',
                                                                    itText:
                                                                        'Disponibile',
                                                                  ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiUpdateStep3Result
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if (FFAppState()
                                                                  .isEditInformation) {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .isEditInformation =
                                                                      false;
                                                                });
                                                                if (Navigator.of(
                                                                        context)
                                                                    .canPop()) {
                                                                  context.pop();
                                                                }
                                                                context.pushNamed(
                                                                    'Preview');
                                                              } else {
                                                                _model.apiResultInfo4 =
                                                                    await EFDevGroup
                                                                        .vehicleInfoStepFourCall
                                                                        .call(
                                                                  vehicleId:
                                                                      FFAppState()
                                                                          .NewVehicleId,
                                                                  language: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model.apiResultInfo4
                                                                            ?.succeeded ??
                                                                        true) &&
                                                                    ((_model.apiResultInfo4?.statusCode ??
                                                                            200) ==
                                                                        200)) {
                                                                  context
                                                                      .pushNamed(
                                                                    'RegisterCar_step4',
                                                                    queryParams:
                                                                        {
                                                                      'withBack':
                                                                          serializeParam(
                                                                        true,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'editRegister':
                                                                          serializeParam(
                                                                        (_model.apiResultInfo4?.jsonBody ??
                                                                            ''),
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  context
                                                                      .pushNamed(
                                                                    'RegisterCar_step4',
                                                                    queryParams:
                                                                        {
                                                                      'withBack':
                                                                          serializeParam(
                                                                        true,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                }
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            } else {
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            await actions
                                                                .snackbarAction(
                                                              context,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    'Minimum 1 file is required',
                                                                deText:
                                                                    'Mindestens 1 Datei ist erforderlich',
                                                                frText:
                                                                    'Minimum 1 fichier est requis',
                                                                itText:
                                                                    'È richiesto minimo 1 file',
                                                              ),
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
                                                                  'Minimum 1 damage image is required',
                                                              deText:
                                                                  'Mindestens 1 Schadensbild ist erforderlich',
                                                              frText:
                                                                  'Minimum 1 image de dommage est requise',
                                                              itText:
                                                                  'È richiesta almeno 1 immagine di danno',
                                                            ),
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
                                                                'Minimum 4 images.',
                                                            deText:
                                                                'Mindestens 4 Bilder.',
                                                            frText:
                                                                'Au moins 4 images.',
                                                            itText:
                                                                'Mindestens 4 Bilder.',
                                                          ),
                                                        );
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'tgdqlndy' /* Next */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFFC5181D),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                if (!_model.isNotLoading!)
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150.0,
                              height: 150.0,
                              child: custom_widgets.CustomLoadingIndicator(
                                width: 150.0,
                                height: 150.0,
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
        ),
      ),
    );
  }
}
