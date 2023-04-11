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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'professional1_model.dart';
export 'professional1_model.dart';

class Professional1Widget extends StatefulWidget {
  const Professional1Widget({Key? key}) : super(key: key);

  @override
  _Professional1WidgetState createState() => _Professional1WidgetState();
}

class _Professional1WidgetState extends State<Professional1Widget> {
  late Professional1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Professional1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    _model.textFieldCompanyController ??= TextEditingController(
        text: FFAppState().RegisterStep1.length > 0
            ? FFAppState().RegisterStep1[0]
            : '');
    _model.textFieldStreetController ??= TextEditingController(
        text: FFAppState().RegisterStep1.length > 0
            ? FFAppState().RegisterStep1[1]
            : '');
    _model.textFieldPostCodeController ??= TextEditingController(
        text: FFAppState().RegisterStep1.length > 0
            ? FFAppState().RegisterStep1[3]
            : '');
    _model.textFieldTownController ??= TextEditingController(
        text: FFAppState().RegisterStep1.length > 0
            ? FFAppState().RegisterStep1[2]
            : '');
    _model.textFieldUidController ??= TextEditingController(
        text: FFAppState().RegisterStep1.length > 0
            ? FFAppState().RegisterStep1[5]
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
                    'j5f512g2' /* Registration */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        fontSize: 16.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
                actions: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
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
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50.0, 18.0, 50.0, 0.0),
                                  child: Container(
                                    width: 260.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFABABAB),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 18.0, 50.0, 0.0),
                                child: Container(
                                  width: 1.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Container(
                                width: 380.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                                        FontAwesomeIcons.home,
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
                                                    't6hr42x6' /* Account */,
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
                                          Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFABABAB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                                            .solidUser,
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
                                                    'nwj9d9wl' /* Administrator */,
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
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFABABAB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                                        Icons.lock,
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
                                                    '8c043x99' /* Login */,
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
                        ],
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 808.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tgw52xsv' /* STEP 1 OF 3 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rtxnzny9' /* Account Data */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Wrap(
                                                  spacing: 16.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
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
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '1exkd4oj' /* Company */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .textFieldCompanyController,
                                                              textCapitalization:
                                                                  TextCapitalization
                                                                      .sentences,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x66ABABAB),
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              validator: _model
                                                                  .textFieldCompanyControllerValidator
                                                                  .asValidator(
                                                                      context),
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
                                                                  8.0),
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
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3wawztc5' /* Country */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: EFDevGroup
                                                                    .listCountriesCall
                                                                    .call(),
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
                                                                  final dropDownCountryListCountriesResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownCountryController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model
                                                                          .dropDownCountryValue ??= FFAppState().RegisterStep1.length >
                                                                              0
                                                                          ? FFAppState()
                                                                              .RegisterStep1[4]
                                                                          : '209',
                                                                    ),
                                                                    options: (getJsonField(
                                                                      dropDownCountryListCountriesResponse
                                                                          .jsonBody,
                                                                      r'''$.items[:].id''',
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()!
                                                                        .toList(),
                                                                    optionLabels: (getJsonField(
                                                                      dropDownCountryListCountriesResponse
                                                                          .jsonBody,
                                                                      r'''$.items[:].name''',
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()!
                                                                        .toList(),
                                                                    onChanged:
                                                                        (val) async {
                                                                      setState(() =>
                                                                          _model.dropDownCountryValue =
                                                                              val);
                                                                      if (_model
                                                                              .dropDownCountryValue !=
                                                                          '209') {
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textFieldUidController
                                                                              ?.clear();
                                                                        });
                                                                      }
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
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ywv9nm4b' /* Switzerland */,
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
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
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
                                                                  8.0),
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
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '8cuvcy1g' /* Street/No. */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .textFieldStreetController,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x66ABABAB),
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              validator: _model
                                                                  .textFieldStreetControllerValidator
                                                                  .asValidator(
                                                                      context),
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
                                                                  8.0),
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
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'zuilowf6' /* Postcode */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .textFieldPostCodeController,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x66ABABAB),
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              validator: _model
                                                                  .textFieldPostCodeControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child:
                                                                  AutoSizeText(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'oowrkpov' /* Min 3 max 10 characters, only ... */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                  8.0),
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
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'isqrd8c1' /* Town */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .textFieldTownController,
                                                              textCapitalization:
                                                                  TextCapitalization
                                                                      .words,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x66ABABAB),
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              validator: _model
                                                                  .textFieldTownControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >=
                                                                  500.0
                                                              ? 244.0
                                                              : 500.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Visibility(
                                                        visible: _model.dropDownCountryValue !=
                                                                    null &&
                                                                _model.dropDownCountryValue !=
                                                                    ''
                                                            ? valueOrDefault<
                                                                bool>(
                                                                _model.dropDownCountryValue ==
                                                                    '209',
                                                                true,
                                                              )
                                                            : (FFAppState()
                                                                        .RegisterStep1
                                                                        .length >
                                                                    0
                                                                ? (FFAppState()
                                                                            .RegisterStep1[
                                                                        4] ==
                                                                    '209')
                                                                : true),
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
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3brui1a1' /* UID */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0x66ABABAB),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'agprrb5x' /* CHE- */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            49.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldUidController,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        setState(
                                                                            () {
                                                                          _model.isLabelUid =
                                                                              false;
                                                                        });
                                                                      },
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
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
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
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
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
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
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
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .phone,
                                                                      validator: _model
                                                                          .textFieldUidControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        _model
                                                                            .textFieldUidMask
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (_model
                                                                .isLabelUid)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'o05qs4fe' /* This field is required. */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 424.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          FFAppState().RegisterStep1 = [];
                                        });
                                        setState(() {
                                          FFAppState().addToRegisterStep1(_model
                                              .textFieldCompanyController.text);
                                        });
                                        setState(() {
                                          FFAppState().addToRegisterStep1(_model
                                              .textFieldStreetController.text);
                                        });
                                        setState(() {
                                          FFAppState().addToRegisterStep1(_model
                                              .textFieldTownController.text);
                                        });
                                        setState(() {
                                          FFAppState().addToRegisterStep1(_model
                                              .textFieldPostCodeController
                                              .text);
                                        });
                                        setState(() {
                                          FFAppState().addToRegisterStep1(
                                              _model.dropDownCountryValue!);
                                        });
                                        setState(() {
                                          FFAppState().addToRegisterStep1(_model
                                              .textFieldUidController.text);
                                        });
                                        context.pop();
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'myde0hgx' /* Cancel */,
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
                                        if ((_model.dropDownCountryValue !=
                                                '209') ||
                                            ((_model.textFieldUidController
                                                            .text !=
                                                        null &&
                                                    _model.textFieldUidController
                                                            .text !=
                                                        '') &&
                                                functions.validateUIDRequirements(
                                                    _model
                                                        .textFieldUidController
                                                        .text))) {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (_model.textFieldUidController
                                                      .text !=
                                                  null &&
                                              _model.textFieldUidController
                                                      .text !=
                                                  '') {
                                            _model.apiResultValidateUID =
                                                await EFDevGroup.validateUIDCall
                                                    .call(
                                              uid: _model
                                                  .textFieldUidController.text,
                                            );
                                            if ((_model.apiResultValidateUID
                                                        ?.succeeded ??
                                                    true) &&
                                                ((_model.apiResultValidateUID
                                                            ?.jsonBody ??
                                                        '') ==
                                                    true)) {
                                              _model.apiResultCountrybyId =
                                                  await EFDevGroup
                                                      .findCountryByIdCall
                                                      .call(
                                                countryId:
                                                    _model.dropDownCountryValue,
                                                language:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );

                                              context.pushNamed(
                                                'Professional2',
                                                queryParams: {
                                                  'country': serializeParam(
                                                    _model.dropDownCountryValue,
                                                    ParamType.String,
                                                  ),
                                                  'town': serializeParam(
                                                    _model
                                                        .textFieldTownController
                                                        .text,
                                                    ParamType.String,
                                                  ),
                                                  'postcode': serializeParam(
                                                    _model
                                                        .textFieldPostCodeController
                                                        .text,
                                                    ParamType.String,
                                                  ),
                                                  'uid': serializeParam(
                                                    _model
                                                        .textFieldUidController
                                                        .text,
                                                    ParamType.String,
                                                  ),
                                                  'company': serializeParam(
                                                    _model
                                                        .textFieldCompanyController
                                                        .text,
                                                    ParamType.String,
                                                  ),
                                                  'street': serializeParam(
                                                    _model
                                                        .textFieldStreetController
                                                        .text,
                                                    ParamType.String,
                                                  ),
                                                  'countryPhoneCode':
                                                      serializeParam(
                                                    (_model.apiResultCountrybyId
                                                                ?.succeeded ??
                                                            true)
                                                        ? EFDevGroup
                                                            .findCountryByIdCall
                                                            .phoneCode(
                                                              (_model.apiResultCountrybyId
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            .toString()
                                                        : '',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await actions.snackbarAction(
                                                context,
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText:
                                                      'UID is already registered',
                                                  deText:
                                                      'UID ist bereits registriert',
                                                  frText:
                                                      'UID est déjà enregistré',
                                                  itText:
                                                      'UID è già registrato',
                                                ),
                                              );
                                            }
                                          } else {
                                            if (_model.textFieldUidController
                                                        .text ==
                                                    null ||
                                                _model.textFieldUidController
                                                        .text ==
                                                    '') {
                                              setState(() {
                                                _model.isLabelUid = true;
                                              });
                                            }
                                            _model.apiResultCountrybyId2 =
                                                await EFDevGroup
                                                    .findCountryByIdCall
                                                    .call(
                                              countryId:
                                                  _model.dropDownCountryValue,
                                              language:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );

                                            context.pushNamed(
                                              'Professional2',
                                              queryParams: {
                                                'country': serializeParam(
                                                  _model.dropDownCountryValue,
                                                  ParamType.String,
                                                ),
                                                'town': serializeParam(
                                                  _model.textFieldTownController
                                                      .text,
                                                  ParamType.String,
                                                ),
                                                'postcode': serializeParam(
                                                  _model
                                                      .textFieldPostCodeController
                                                      .text,
                                                  ParamType.String,
                                                ),
                                                'uid': serializeParam(
                                                  _model.textFieldUidController
                                                      .text,
                                                  ParamType.String,
                                                ),
                                                'company': serializeParam(
                                                  _model
                                                      .textFieldCompanyController
                                                      .text,
                                                  ParamType.String,
                                                ),
                                                'street': serializeParam(
                                                  _model
                                                      .textFieldStreetController
                                                      .text,
                                                  ParamType.String,
                                                ),
                                                'countryPhoneCode':
                                                    serializeParam(
                                                  (_model.apiResultCountrybyId2
                                                              ?.succeeded ??
                                                          true)
                                                      ? EFDevGroup
                                                          .findCountryByIdCall
                                                          .phoneCode(
                                                            (_model.apiResultCountrybyId2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString()
                                                      : '',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        } else {
                                          await actions.snackbarAction(
                                            context,
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: 'Valid UID is required',
                                              deText:
                                                  'Eine gültige UID ist erforderlich',
                                              frText:
                                                  'Un UID valide est requis',
                                              itText:
                                                  'È richiesto un UID valido',
                                            ),
                                          );
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
                                        'xz9bhoh0' /* Next */,
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
