import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widgets_list_model.dart';
export 'widgets_list_model.dart';

class WidgetsListWidget extends StatefulWidget {
  const WidgetsListWidget({Key? key}) : super(key: key);

  @override
  _WidgetsListWidgetState createState() => _WidgetsListWidgetState();
}

class _WidgetsListWidgetState extends State<WidgetsListWidget> {
  late WidgetsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetsListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultGetwidgets =
          await EFDevGroup.getWidgetsPropertiesCall.call(
        vehicleId: FFAppState().NewVehicleId,
        language: FFLocalizations.of(context).languageCode,
      );
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '692hig2h' /* Add widgets */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: EFDevGroup.getWidgetsPropertiesCall.call(
                              vehicleId: FFAppState().NewVehicleId,
                              language:
                                  FFLocalizations.of(context).languageCode,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 35.0,
                                    height: 35.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final listViewGetWidgetsPropertiesResponse =
                                  snapshot.data!;
                              return ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox01Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[0].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox01Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'pvcnm5hq' /* 360° camera */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox02Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[1].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox02Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '2q4ts26j' /* Active brake assistant */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox03Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[2].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox03Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '7deoyl17' /* Android Auto */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wtocn48h' /* Trailer hitch */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox05Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[4].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox05Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    't8lfnhn0' /* Detachable trailer hitch */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox06Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[5].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox06Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '94xj86sr' /* Fixed trailer hitch */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox07Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[6].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox07Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0343icny' /* Swiveling trailer hitch */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox08Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[7].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox08Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5nzz5euq' /* Apple CarPlay */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'svldym8q' /* Tires */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox10Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[9].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox10Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5z8gce1v' /* 4 Winter Tyres */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox11Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[10].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox11Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wtduywlz' /* Alloy wheels */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox12Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[11].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox12Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g27i28dq' /* Steel rims */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox13Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[12].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox13Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '28iaxyhx' /* Summer tyres */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox14Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[13].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox14Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ljaimfee' /* Winter tyres */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox15Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[14].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox15Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'be0sdxfm' /* Bluetooth interface */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox16Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[15].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox16Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vw265k0w' /* DAB-Radio */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '25m7fbvj' /* Roof type */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowRadioButton(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nzzqt28w' /* Sunroof */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lgvi2nba' /* Panoramic roof */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '07euyyzu' /* Panoramic sunroof */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ldeooe6f' /* Soft top/hard top */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pv5oudnn' /* Folding roof */,
                                              )
                                            ].toList(),
                                            onChanged: (val) => setState(() {}),
                                            controller: _model
                                                    .radioButton17Controller ??=
                                                FormFieldController<String>(
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                                  listViewGetWidgetsPropertiesResponse
                                                                      .jsonBody,
                                                                  r'''$.widgetList[16].value''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                listViewGetWidgetsPropertiesResponse
                                                                    .jsonBody,
                                                                r'''$.widgetList[16].value''',
                                                              ).toString()
                                                            : '')
                                                        : ''),
                                            optionHeight: 25.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                Color(0xFF95A1AC),
                                            toggleable: true,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox18Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[17].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox18Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '9uy1537j' /* Differential lock */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox19Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[18].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox19Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'boj234j2' /* Distance controller */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox20Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[19].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox20Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'iu30syuh' /* Electric tailgate */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox21Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[20].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox21Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'tuhs9j3b' /* Electrical seat-adjustment */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox22Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[21].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox22Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'tqnmpila' /* Hands-free device */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox23Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[22].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox23Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'wy64k9gl' /* Head-up-Display */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox24Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[23].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox24Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '2jg8f0nu' /* Isofix */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'k0uq2vif' /* Air conditioning */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowRadioButton(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kxq2s4mi' /* Automatically */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7400885e' /* Manually */,
                                              )
                                            ].toList(),
                                            onChanged: (val) => setState(() {}),
                                            controller: _model
                                                    .radioButton25Controller ??=
                                                FormFieldController<String>(
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                                  listViewGetWidgetsPropertiesResponse
                                                                      .jsonBody,
                                                                  r'''$.widgetList[24].value''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                listViewGetWidgetsPropertiesResponse
                                                                    .jsonBody,
                                                                r'''$.widgetList[24].value''',
                                                              ).toString()
                                                            : '')
                                                        : ''),
                                            optionHeight: 25.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                Color(0xFF95A1AC),
                                            toggleable: true,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox26Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[25].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox26Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'mic72maj' /* Cornering light */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox27Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[26].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox27Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              's24n8g6o' /* Air suspension */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'i59m46eg' /* Navigation system */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowRadioButton(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mijebawn' /* Built-in */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sb6f1jv9' /* Portable */,
                                              )
                                            ].toList(),
                                            onChanged: (val) => setState(() {}),
                                            controller: _model
                                                    .radioButton28Controller ??=
                                                FormFieldController<String>(
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                                  listViewGetWidgetsPropertiesResponse
                                                                      .jsonBody,
                                                                  r'''$.widgetList[27].value''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                listViewGetWidgetsPropertiesResponse
                                                                    .jsonBody,
                                                                r'''$.widgetList[27].value''',
                                                              ).toString()
                                                            : '')
                                                        : ''),
                                            optionHeight: 25.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color: Colors.black,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            selectedTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                Color(0xFF95A1AC),
                                            toggleable: true,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox29Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[28].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox29Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'w7z3dbbb' /* Parking assistance */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox30Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[29].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox30Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '518rydbb' /* Rear parking sensors */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox31Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[30].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox31Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '62yd0zfc' /* Parking sensors in front */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox32Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[31].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox32Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ionelexw' /* backup camera */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'is96pw7a' /* Headlight */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox34Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[33].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox34Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'aox4jl8v' /* LED */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox35Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[34].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox35Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0ldutdva' /* Laser */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox36Value ??=
                                                          listViewGetWidgetsPropertiesResponse
                                                                  .succeeded
                                                              ? (getJsonField(
                                                                    listViewGetWidgetsPropertiesResponse
                                                                        .jsonBody,
                                                                    r'''$.widgetList[35].value''',
                                                                  ) ==
                                                                  'true')
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkbox36Value =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'suobr5dr' /* Xenon */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox37Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[36].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox37Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '3ko7lsvj' /* Sliding door */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox38Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[37].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox38Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5zjpo2mh' /* Keyless Entry/Start */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox39Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[38].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox39Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'w2e4ms36' /* Fast charging function */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'o3emh29s' /* Seat covers */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowRadioButton(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4q2fohmw' /* Alcantara */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6ph0g45t' /* Leather */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hkw0kv2g' /* Material */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rjemey9q' /* Part leather */,
                                              )
                                            ].toList(),
                                            onChanged: (val) => setState(() {}),
                                            controller: _model
                                                    .radioButton40Controller ??=
                                                FormFieldController<String>(
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                                  listViewGetWidgetsPropertiesResponse
                                                                      .jsonBody,
                                                                  r'''$.widgetList[39].value''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                listViewGetWidgetsPropertiesResponse
                                                                    .jsonBody,
                                                                r'''$.widgetList[39].value''',
                                                              ).toString()
                                                            : '')
                                                        : ''),
                                            optionHeight: 25.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                Color(0xFF95A1AC),
                                            toggleable: true,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox41Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[40].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox41Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '1vkbgp3c' /* Seat heating */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox42Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[41].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox42Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'z0z9fk54' /* Sports seats */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox43Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[42].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox43Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '34u5v90i' /* Lane Departure Warning */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox44Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[43].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox44Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'spepms8e' /* Stability control */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox45Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[44].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox45Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'gp1bca34' /* Parking heater */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox46Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[45].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox46Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '0sgube1a' /* Start/Stop System */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox47Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[46].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox47Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'puenrsqw' /* Cruise control */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF95A1AC),
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkbox48Value ??=
                                                    listViewGetWidgetsPropertiesResponse
                                                            .succeeded
                                                        ? (getJsonField(
                                                              listViewGetWidgetsPropertiesResponse
                                                                  .jsonBody,
                                                              r'''$.widgetList[47].value''',
                                                            ) ==
                                                            'true')
                                                        : false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkbox48Value =
                                                          newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '0njqwd20' /* Blind Spot Assist */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (false)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'v60i854b' /* Clear All */,
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
                              4.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.apiResultSaveWidgets =
                                  await EFDevGroup.saveWidgetsCall.call(
                                check01:
                                    _model.checkbox01Value! ? 'true' : 'false',
                                check02:
                                    _model.checkbox02Value! ? 'true' : 'false',
                                check03:
                                    _model.checkbox03Value! ? 'true' : 'false',
                                check04: false.toString(),
                                check05:
                                    _model.checkbox05Value! ? 'true' : 'false',
                                check06:
                                    _model.checkbox06Value! ? 'true' : 'false',
                                check07:
                                    _model.checkbox07Value! ? 'true' : 'false',
                                check08:
                                    _model.checkbox08Value! ? 'true' : 'false',
                                check09: false.toString(),
                                check10:
                                    _model.checkbox10Value! ? 'true' : 'false',
                                check11:
                                    _model.checkbox11Value! ? 'true' : 'false',
                                check12:
                                    _model.checkbox12Value! ? 'true' : 'false',
                                check13:
                                    _model.checkbox13Value! ? 'true' : 'false',
                                check14:
                                    _model.checkbox14Value! ? 'true' : 'false',
                                check15:
                                    _model.checkbox15Value! ? 'true' : 'false',
                                check16:
                                    _model.checkbox16Value! ? 'true' : 'false',
                                check17: _model.radioButton17Value != null &&
                                        _model.radioButton17Value != ''
                                    ? _model.radioButton17Value
                                    : ((_model.apiResultGetwidgets?.succeeded ??
                                            true)
                                        ? (getJsonField(
                                                  (_model.apiResultGetwidgets
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.widgetList[16].value''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                (_model.apiResultGetwidgets
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.widgetList[16].value''',
                                              ).toString()
                                            : _model.radioButton17Value)
                                        : _model.radioButton17Value),
                                check18:
                                    _model.checkbox18Value! ? 'true' : 'false',
                                check19:
                                    _model.checkbox19Value! ? 'true' : 'false',
                                check20:
                                    _model.checkbox20Value! ? 'true' : 'false',
                                check21:
                                    _model.checkbox21Value! ? 'true' : 'false',
                                check22:
                                    _model.checkbox22Value! ? 'true' : 'false',
                                check23:
                                    _model.checkbox23Value! ? 'true' : 'false',
                                check24:
                                    _model.checkbox24Value! ? 'true' : 'false',
                                check25: _model.radioButton25Value != null &&
                                        _model.radioButton25Value != ''
                                    ? _model.radioButton25Value
                                    : ((_model.apiResultGetwidgets?.succeeded ??
                                            true)
                                        ? (getJsonField(
                                                  (_model.apiResultGetwidgets
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.widgetList[24].value''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                (_model.apiResultGetwidgets
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.widgetList[24].value''',
                                              ).toString()
                                            : null)
                                        : null),
                                check26:
                                    _model.checkbox26Value! ? 'true' : 'false',
                                check27:
                                    _model.checkbox27Value! ? 'true' : 'false',
                                check28: _model.radioButton28Value != null &&
                                        _model.radioButton28Value != ''
                                    ? _model.radioButton28Value
                                    : ((_model.apiResultGetwidgets?.succeeded ??
                                            true)
                                        ? (getJsonField(
                                                  (_model.apiResultGetwidgets
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.widgetList[27].value''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                (_model.apiResultGetwidgets
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.widgetList[27].value''',
                                              ).toString()
                                            : null)
                                        : null),
                                check29:
                                    _model.checkbox29Value! ? 'true' : 'false',
                                check30:
                                    _model.checkbox30Value! ? 'true' : 'false',
                                check31:
                                    _model.checkbox31Value! ? 'true' : 'false',
                                check32:
                                    _model.checkbox32Value! ? 'true' : 'false',
                                check33: false.toString(),
                                check34:
                                    _model.checkbox35Value! ? 'true' : 'false',
                                check35:
                                    _model.checkbox35Value! ? 'true' : 'false',
                                check36:
                                    _model.checkbox36Value! ? 'true' : 'false',
                                check37:
                                    _model.checkbox37Value! ? 'true' : 'false',
                                check38:
                                    _model.checkbox38Value! ? 'true' : 'false',
                                check39:
                                    _model.checkbox39Value! ? 'true' : 'false',
                                check40: _model.radioButton40Value != null &&
                                        _model.radioButton40Value != ''
                                    ? _model.radioButton40Value
                                    : ((_model.apiResultGetwidgets?.succeeded ??
                                            true)
                                        ? (getJsonField(
                                                  (_model.apiResultGetwidgets
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.widgetList[39].value''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                (_model.apiResultGetwidgets
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.widgetList[39].value''',
                                              ).toString()
                                            : null)
                                        : null),
                                check41:
                                    _model.checkbox41Value! ? 'true' : 'false',
                                check42:
                                    _model.checkbox42Value! ? 'true' : 'false',
                                check43:
                                    _model.checkbox43Value! ? 'true' : 'false',
                                check44:
                                    _model.checkbox44Value! ? 'true' : 'false',
                                check45:
                                    _model.checkbox45Value! ? 'true' : 'false',
                                check46:
                                    _model.checkbox46Value! ? 'true' : 'false',
                                check47:
                                    _model.checkbox47Value! ? 'true' : 'false',
                                check48:
                                    _model.checkbox48Value! ? 'true' : 'false',
                                vehicleId: FFAppState().NewVehicleId,
                                language:
                                    FFLocalizations.of(context).languageCode,
                              );
                              if ((_model.apiResultSaveWidgets?.succeeded ??
                                  true)) {
                                context.pop();
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(getJsonField(
                                        (_model.apiResultSaveWidgets
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ).toString()),
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
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'ccktxznd' /* Save */,
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
    );
  }
}
