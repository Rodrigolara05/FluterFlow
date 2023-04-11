import '/backend/api_requests/api_calls.dart';
import '/components/carrousel_panel/carrousel_panel_widget.dart';
import '/components/carrousel_panel_damege/carrousel_panel_damege_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/general_condition/general_condition_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preview_model.dart';
export 'preview_model.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({Key? key}) : super(key: key);

  @override
  _PreviewWidgetState createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late PreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviewModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: EFDevGroup.getAuctionPreviewCall.call(
        vehicleId: FFAppState().NewVehicleId,
        language: FFLocalizations.of(context).languageCode,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 35.0,
              height: 35.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final previewGetAuctionPreviewResponse = snapshot.data!;
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
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '1k7bhd1g' /* Overview */,
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
                  )
                : null,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 1000.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (MediaQuery.of(context).size.width >=
                                            500.0)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 0.0, 24.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'loavwv3g' /* Overview */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Wrap(
                                                  spacing: 16.0,
                                                  runSpacing: 16.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width >=
                                                                      500.0
                                                                  ? 603.0
                                                                  : 500.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x1F000000),
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                              r'''$.brand''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleMedium,
                                                                          ),
                                                                        ),
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              8.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.mode_edit,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              FFAppState().isEditInformation = true;
                                                                            });

                                                                            context.pushNamed(
                                                                              'RegisterCar_step3',
                                                                              queryParams: {
                                                                                'isDocsAvailable': serializeParam(
                                                                                  getJsonField(
                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                    r'''$.isRegistrationAvailable''',
                                                                                  ),
                                                                                  ParamType.bool,
                                                                                ),
                                                                                'isDamaged': serializeParam(
                                                                                  getJsonField(
                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                    r'''$.isDamaged''',
                                                                                  ),
                                                                                  ParamType.bool,
                                                                                ),
                                                                                'withBack': serializeParam(
                                                                                  false,
                                                                                  ParamType.bool,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        previewGetAuctionPreviewResponse
                                                                            .jsonBody,
                                                                        r'''$.model''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF007D19),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 4.0),
                                                                                  child: Icon(
                                                                                    FFIcons.kprivate,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'itt152c7' /* Business */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                    child: Icon(
                                                                                      Icons.location_on_outlined,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                      r'''$.vehicleRegion''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontWeight: FontWeight.w900,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'hu9v23g9' /* Swiss vehicle */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontWeight: FontWeight.w900,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if (getJsonField(
                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                      r'''$.isSwiss''',
                                                                                    ) ==
                                                                                    true)
                                                                                  Icon(
                                                                                    Icons.check_circle_rounded,
                                                                                    color: Color(0xFF007D19),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                if (getJsonField(
                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                      r'''$.isSwiss''',
                                                                                    ) ==
                                                                                    false)
                                                                                  Icon(
                                                                                    Icons.close_rounded,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    size: 24.0,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.28,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          FutureBuilder<
                                                                              ApiCallResponse>(
                                                                            future:
                                                                                EFDevGroup.getVehicleImagesCall.call(
                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                              language: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final gridGetVehicleImagesResponse = snapshot.data!;
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 1.0, 2.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                onTap: () async {
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
                                                                                                            child: CarrouselPanelWidget(
                                                                                                              imgNum: 0,
                                                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: double.infinity,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.rectangle,
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    functions.getFileFullPath(
                                                                                                        getJsonField(
                                                                                                          gridGetVehicleImagesResponse.jsonBody,
                                                                                                          r'''$.items[0].imageBlogName''',
                                                                                                        ).toString(),
                                                                                                        0,
                                                                                                        FFAppState().BaseFilePath,
                                                                                                        FFAppState().NewVehicleId),
                                                                                                    width: 100.0,
                                                                                                    height: 100.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(1.0, 2.0, 2.0, 2.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                onTap: () async {
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
                                                                                                            child: CarrouselPanelWidget(
                                                                                                              imgNum: 1,
                                                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: double.infinity,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Image.network(
                                                                                                    functions.getFileFullPath(
                                                                                                        getJsonField(
                                                                                                          gridGetVehicleImagesResponse.jsonBody,
                                                                                                          r'''$.items[1].imageBlogName''',
                                                                                                        ).toString(),
                                                                                                        0,
                                                                                                        FFAppState().BaseFilePath,
                                                                                                        FFAppState().NewVehicleId),
                                                                                                    width: 100.0,
                                                                                                    height: 100.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                child: InkWell(
                                                                                                  onTap: () async {
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
                                                                                                              child: CarrouselPanelWidget(
                                                                                                                imgNum: 2,
                                                                                                                vehicleId: FFAppState().NewVehicleId,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: double.infinity,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Image.network(
                                                                                                      functions.getFileFullPath(
                                                                                                          getJsonField(
                                                                                                            gridGetVehicleImagesResponse.jsonBody,
                                                                                                            r'''$.items[2].imageBlogName''',
                                                                                                          ).toString(),
                                                                                                          0,
                                                                                                          FFAppState().BaseFilePath,
                                                                                                          FFAppState().NewVehicleId),
                                                                                                      width: 100.0,
                                                                                                      height: 100.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                onTap: () async {
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
                                                                                                            child: CarrouselPanelWidget(
                                                                                                              imgNum: 3,
                                                                                                              vehicleId: FFAppState().NewVehicleId,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 75.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Stack(
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 80.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Image.network(
                                                                                                              functions.getFileFullPath(
                                                                                                                  getJsonField(
                                                                                                                    gridGetVehicleImagesResponse.jsonBody,
                                                                                                                    r'''$.items[3].imageBlogName''',
                                                                                                                  ).toString(),
                                                                                                                  0,
                                                                                                                  FFAppState().BaseFilePath,
                                                                                                                  FFAppState().NewVehicleId),
                                                                                                              width: 100.0,
                                                                                                              height: 120.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 80.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  (int var1, int var2) {
                                                                                                                    return (var2 - var1) <= 0 ? " " : "+ " + (var2 - var1).toString() + " pictures ";
                                                                                                                  }(
                                                                                                                      4,
                                                                                                                      getJsonField(
                                                                                                                        gridGetVehicleImagesResponse.jsonBody,
                                                                                                                        r'''$.items[3].totalImages''',
                                                                                                                      )),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
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
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 603.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'pakahrw1' /* Auction Details */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.mode_edit,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                setState(() {
                                                                                  FFAppState().isEditInformation = true;
                                                                                });
                                                                                _model.apiResultEdit4 = await EFDevGroup.vehicleInfoStepFourCall.call(
                                                                                  vehicleId: FFAppState().NewVehicleId,
                                                                                  language: FFLocalizations.of(context).languageCode,
                                                                                );
                                                                                if ((_model.apiResultEdit4?.succeeded ?? true)) {
                                                                                  context.pushNamed(
                                                                                    'RegisterCar_step4',
                                                                                    queryParams: {
                                                                                      'editRegister': serializeParam(
                                                                                        (_model.apiResultEdit4?.jsonBody ?? ''),
                                                                                        ParamType.JSON,
                                                                                      ),
                                                                                      'withBack': serializeParam(
                                                                                        false,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Wrap(
                                                                              spacing: 0.0,
                                                                              runSpacing: 0.0,
                                                                              alignment: WrapAlignment.spaceBetween,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                    child: Wrap(
                                                                                      spacing: 16.0,
                                                                                      runSpacing: 16.0,
                                                                                      alignment: WrapAlignment.spaceBetween,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.vertical,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'fnmz7845' /* Minimum Price */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  'CHF ${functions.formatNumberThousand(getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.minPrice''',
                                                                                                  ))}',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '9tkmpbom' /* Transportation */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 141.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                                      r'''$.transportationDescription''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontWeight: FontWeight.w900,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
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
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                    child: Wrap(
                                                                                      spacing: 16.0,
                                                                                      runSpacing: 16.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.vertical,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Visibility(
                                                                                          visible: functions.stringToDouble(getJsonField(
                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                r'''$.transportCost''',
                                                                                              ).toString()) >
                                                                                              0.0,
                                                                                          child: Container(
                                                                                            width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 141.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '5szc9823' /* Transportation Costs */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    'CHF ${functions.formatNumberThousand(getJsonField(
                                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                                      r'''$.transportCost''',
                                                                                                    ))}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontWeight: FontWeight.w900,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '7070gapr' /* Auction Duration */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  '${functions.convertDoubleToString(functions.stringToInt(getJsonField(
                                                                                                        previewGetAuctionPreviewResponse.jsonBody,
                                                                                                        r'''$.auctionDuration''',
                                                                                                      ).toString()) / 3600, 0)} Hours',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Wrap(
                                                                                    spacing: 16.0,
                                                                                    runSpacing: 16.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.vertical,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Wrap(
                                                                                          spacing: 0.0,
                                                                                          runSpacing: 0.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'lka3b9pr' /* Auction Increment */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                'CHF ${functions.formatNumberThousand(getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.minStepBid''',
                                                                                                ))}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.w900,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Visibility(
                                                                                        visible: functions.stringToDouble(getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.buyNowPrice''',
                                                                                            ).toString()) >
                                                                                            0.0,
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '46ufdvq5' /* Buy Now */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                'CHF ${functions.formatNumberThousand(getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.buyNowPrice''',
                                                                                                ))}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.w900,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
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
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 603.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'x3v2qhqo' /* Car Details */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.mode_edit,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                _model.apiResultEdit2 = await EFDevGroup.vehicleInfoStepTwoCall.call(
                                                                                  vehicleId: FFAppState().NewVehicleId,
                                                                                  language: FFLocalizations.of(context).languageCode,
                                                                                );
                                                                                if ((_model.apiResultEdit2?.succeeded ?? true)) {
                                                                                  setState(() {
                                                                                    FFAppState().isEditInformation = true;
                                                                                  });

                                                                                  context.pushNamed(
                                                                                    'RegisterCar_step2',
                                                                                    queryParams: {
                                                                                      'editRegister': serializeParam(
                                                                                        (_model.apiResultEdit2?.jsonBody ?? ''),
                                                                                        ParamType.JSON,
                                                                                      ),
                                                                                      'withBack': serializeParam(
                                                                                        false,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text(getJsonField(
                                                                                          (_model.apiResultEdit4?.jsonBody ?? ''),
                                                                                          r'''$.error.message''',
                                                                                        ).toString()),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Wrap(
                                                                              spacing: 0.0,
                                                                              runSpacing: 0.0,
                                                                              alignment: WrapAlignment.spaceBetween,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                    child: Wrap(
                                                                                      spacing: 16.0,
                                                                                      runSpacing: 16.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.vertical,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'u48s1fwf' /* Type */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 170.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                                      r'''$.type''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontWeight: FontWeight.w900,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'oby5eun9' /* Body Type */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.bodyType''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'fc1ej2yj' /* Exterior Color */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.exteriorColor''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'hwt9gn70' /* Vehicle Paintwork */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.paintwork''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                    child: Wrap(
                                                                                      spacing: 16.0,
                                                                                      runSpacing: 16.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.vertical,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6sj294q7' /* Frame No. */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 170.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      previewGetAuctionPreviewResponse.jsonBody,
                                                                                                      r'''$.frame''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontWeight: FontWeight.w900,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '44i8giwh' /* Vehicle Inspection */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  functions.changeDateFormat(
                                                                                                      getJsonField(
                                                                                                        previewGetAuctionPreviewResponse.jsonBody,
                                                                                                        r'''$.inspectionDate''',
                                                                                                      ).toString(),
                                                                                                      0),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'had2bvfp' /* Maintenance Record */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.maintenanceRecord''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'e8b11gb6' /* Interior Color */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.interiorColor''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Wrap(
                                                                                    spacing: 16.0,
                                                                                    runSpacing: 16.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.vertical,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Wrap(
                                                                                          spacing: 0.0,
                                                                                          runSpacing: 0.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'yy3c3srg' /* Model Number */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.modelNumber''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontWeight: FontWeight.w900,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Wrap(
                                                                                          spacing: 0.0,
                                                                                          runSpacing: 0.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 141.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    't146cwre' /* Options/Additional Info */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Visibility(
                                                                                              visible: getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.additionalInfo''',
                                                                                                  ) !=
                                                                                                  null,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    previewGetAuctionPreviewResponse.jsonBody,
                                                                                                    r'''$.additionalInfo''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontWeight: FontWeight.w900,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Visibility(
                                                                                        visible: functions.countTrueConditions(
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.generallyGoodCondition''',
                                                                                                ),
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.isVariousTracesOfUse''',
                                                                                                ),
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.isInvolvedAccident''',
                                                                                                ),
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.isDogowner''',
                                                                                                ),
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.isSmoker''',
                                                                                                ),
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.isDamagebyhail''',
                                                                                                ),
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.isExportedCar''',
                                                                                                )) >
                                                                                            0,
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width >= 500.0 ? 141.0 : 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 141.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'zlmqopi2' /* General Condition */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
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
                                                                                                            child: GeneralConditionWidget(
                                                                                                              jsonPreview: previewGetAuctionPreviewResponse.jsonBody,
                                                                                                              isPreview: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                        child: Text(
                                                                                                          '${functions.countTrueConditions(getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.generallyGoodCondition''',
                                                                                                              ), getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.isVariousTracesOfUse''',
                                                                                                              ), getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.isInvolvedAccident''',
                                                                                                              ), getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.isDogowner''',
                                                                                                              ), getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.isSmoker''',
                                                                                                              ), getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.isDamagebyhail''',
                                                                                                              ), getJsonField(
                                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                                r'''$.isExportedCar''',
                                                                                                              )).toString()}${FFLocalizations.of(context).getVariableText(
                                                                                                            enText: ' selected',
                                                                                                            deText: ' ausgewählt',
                                                                                                            frText: ' sélectionnés',
                                                                                                            itText: ' selezionato',
                                                                                                          )}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontWeight: FontWeight.w900,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Icon(
                                                                                                        Icons.info_outline_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                    ],
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
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width >=
                                                                      500.0
                                                                  ? 603.0
                                                                  : 500.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        12.0),
                                                                child: Column(
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
                                                                        'e3tcamfu' /* Widgets */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                    ),
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: EFDevGroup
                                                                          .getWidgetsDescriptionsCall
                                                                          .call(
                                                                        vehicleId:
                                                                            FFAppState().NewVehicleId,
                                                                        language:
                                                                            FFLocalizations.of(context).languageCode,
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
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final listViewGetWidgetsDescriptionsResponse =
                                                                            snapshot.data!;
                                                                        return Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final widgets = EFDevGroup.getWidgetsDescriptionsCall
                                                                                    .widgetList(
                                                                                      listViewGetWidgetsDescriptionsResponse.jsonBody,
                                                                                    )
                                                                                    ?.toList() ??
                                                                                [];
                                                                            if (widgets.isEmpty) {
                                                                              return EmptyStateWidget();
                                                                            }
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: widgets.length,
                                                                              itemBuilder: (context, widgetsIndex) {
                                                                                final widgetsItem = widgets[widgetsIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widgetsItem,
                                                                                      r'''$.value''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
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
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 253.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'p3r4i4k7' /* Vehicle Data */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.mode_edit,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                _model.apiResultEdit1 = await EFDevGroup.vehicleInfoStepOneCall.call(
                                                                                  vehicleId: FFAppState().NewVehicleId,
                                                                                  language: FFLocalizations.of(context).languageCode,
                                                                                );
                                                                                if ((_model.apiResultEdit1?.succeeded ?? true)) {
                                                                                  setState(() {
                                                                                    FFAppState().isEditInformation = true;
                                                                                  });

                                                                                  context.pushNamed(
                                                                                    'RegisterCar_step1',
                                                                                    queryParams: {
                                                                                      'editRegister': serializeParam(
                                                                                        (_model.apiResultEdit1?.jsonBody ?? ''),
                                                                                        ParamType.JSON,
                                                                                      ),
                                                                                      'withBack': serializeParam(
                                                                                        false,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text(getJsonField(
                                                                                          (_model.apiResultEdit1?.jsonBody ?? ''),
                                                                                          r'''$.error.message''',
                                                                                        ).toString()),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Wrap(
                                                                          spacing:
                                                                              0.0,
                                                                          runSpacing:
                                                                              0.0,
                                                                          alignment:
                                                                              WrapAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: [
                                                                            Container(
                                                                              width: 141.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Wrap(
                                                                                spacing: 0.0,
                                                                                runSpacing: 0.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.vertical,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kkm,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${functions.formatNumberThousandInt(getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.kilometers''',
                                                                                            ))} Km',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kcalendar,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            functions.changeDateFormat(
                                                                                                getJsonField(
                                                                                                  previewGetAuctionPreviewResponse.jsonBody,
                                                                                                  r'''$.firstReg''',
                                                                                                ).toString(),
                                                                                                0),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kengine,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.performancePs''',
                                                                                            ).toString().maybeHandleOverflow(maxChars: 6),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'v1rww10b' /* PS */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.performanceKw''',
                                                                                            ).toString().maybeHandleOverflow(maxChars: 6),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'oawjjpku' /* KW */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kmechanic,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.gearTX''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kfuel,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.fuel''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 141.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Wrap(
                                                                                spacing: 0.0,
                                                                                runSpacing: 0.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.vertical,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.ktraction,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 109.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                                r'''$.wheelDrive''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kdoors,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.doors''',
                                                                                            ).toString()}${FFLocalizations.of(context).getVariableText(
                                                                                              enText: ' Doors',
                                                                                              deText: ' Türen',
                                                                                              frText: ' portes',
                                                                                              itText: ' porte',
                                                                                            )}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kkey,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.keys''',
                                                                                            ).toString()}${FFLocalizations.of(context).getVariableText(
                                                                                              enText: ' keys',
                                                                                              deText: ' Schlüssel',
                                                                                              frText: ' clés',
                                                                                              itText: ' chiavi',
                                                                                            )}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kseats,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.seats''',
                                                                                            ).toString()}${FFLocalizations.of(context).getVariableText(
                                                                                              enText: ' seats',
                                                                                              deText: ' Sitze',
                                                                                              frText: ' places',
                                                                                              itText: ' posti',
                                                                                            )}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
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
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (getJsonField(
                                                                previewGetAuctionPreviewResponse
                                                                    .jsonBody,
                                                                r'''$.isRegistrationAvailable''',
                                                              ) ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width >=
                                                                          500.0
                                                                      ? 253.0
                                                                      : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: EFDevGroup
                                                                          .getVehicleFilesCall
                                                                          .call(
                                                                        vehicleId:
                                                                            FFAppState().NewVehicleId,
                                                                        language:
                                                                            FFLocalizations.of(context).languageCode,
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
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final columnDocsGetVehicleFilesResponse =
                                                                            snapshot.data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'n1akveu8' /* Vehicle Documents */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 30.0,
                                                                                    buttonSize: 40.0,
                                                                                    icon: Icon(
                                                                                      Icons.mode_edit,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        FFAppState().isEditInformation = true;
                                                                                      });

                                                                                      context.pushNamed(
                                                                                        'RegisterCar_step3',
                                                                                        queryParams: {
                                                                                          'isDocsAvailable': serializeParam(
                                                                                            getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.isRegistrationAvailable''',
                                                                                            ),
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'isDamaged': serializeParam(
                                                                                            getJsonField(
                                                                                              previewGetAuctionPreviewResponse.jsonBody,
                                                                                              r'''$.isDamaged''',
                                                                                            ),
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Divider(
                                                                              thickness: 1.0,
                                                                            ),
                                                                            if (getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                                ) !=
                                                                                null)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    await launchURL(functions.getFileFullPathString(
                                                                                        getJsonField(
                                                                                          columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                          r'''$.items[?(@.positionDescriptor == 0)].fileBlogName''',
                                                                                        ).toString(),
                                                                                        2,
                                                                                        FFAppState().BaseFilePath,
                                                                                        FFAppState().NewVehicleId));
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.filePdf,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'b09zdrpq' /* Vehicle Registration Card */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                                ) !=
                                                                                null)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    await launchURL(functions.getFileFullPathString(
                                                                                        getJsonField(
                                                                                          columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                          r'''$.items[?(@.positionDescriptor == 1)].fileBlogName''',
                                                                                        ).toString(),
                                                                                        2,
                                                                                        FFAppState().BaseFilePath,
                                                                                        FFAppState().NewVehicleId));
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.filePdf,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '7bunqr9o' /* Service certificate */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 2)]''',
                                                                                ) !=
                                                                                null)
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  await launchURL(functions.getFileFullPathString(
                                                                                      getJsonField(
                                                                                        columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 2)].fileBlogName''',
                                                                                      ).toString(),
                                                                                      2,
                                                                                      FFAppState().BaseFilePath,
                                                                                      FFAppState().NewVehicleId));
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.filePdf,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'cfdwgi8g' /* Other documents */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                                previewGetAuctionPreviewResponse
                                                                    .jsonBody,
                                                                r'''$.isDamaged''',
                                                              ) ==
                                                              true)
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        500.0
                                                                    ? 253.0
                                                                    : 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '6cdfkvwb' /* Vehicle Damage */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.mode_edit,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _model.apiResultEdit2Two = await EFDevGroup.vehicleInfoStepTwoCall.call(
                                                                                      vehicleId: FFAppState().NewVehicleId,
                                                                                      language: FFLocalizations.of(context).languageCode,
                                                                                    );
                                                                                    if ((_model.apiResultEdit2Two?.succeeded ?? true)) {
                                                                                      setState(() {
                                                                                        FFAppState().isEditInformation = true;
                                                                                      });

                                                                                      context.pushNamed(
                                                                                        'RegisterCar_step2',
                                                                                        queryParams: {
                                                                                          'editRegister': serializeParam(
                                                                                            (_model.apiResultEdit2Two?.jsonBody ?? ''),
                                                                                            ParamType.JSON,
                                                                                          ),
                                                                                          'withBack': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text(getJsonField(
                                                                                              (_model.apiResultEdit4?.jsonBody ?? ''),
                                                                                              r'''$.error.message''',
                                                                                            ).toString()),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }

                                                                                    setState(() {});
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                              height: MediaQuery.of(context).size.height * 0.28,
                                                                              decoration: BoxDecoration(),
                                                                              child: Stack(
                                                                                children: [
                                                                                  FutureBuilder<ApiCallResponse>(
                                                                                    future: EFDevGroup.getDamagedVehicleImagesCall.call(
                                                                                      vehicleId: FFAppState().NewVehicleId,
                                                                                      language: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 35.0,
                                                                                            height: 35.0,
                                                                                            child: CircularProgressIndicator(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      final gridGetDamagedVehicleImagesResponse = snapshot.data!;
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(1.0, 2.0, 2.0, 2.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: InkWell(
                                                                                                        onTap: () async {
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
                                                                                                                    child: CarrouselPanelDamegeWidget(
                                                                                                                      imgNum: 0,
                                                                                                                      vehicleId: FFAppState().NewVehicleId,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => setState(() {}));
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 215.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Stack(
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    child: Image.network(
                                                                                                                      functions.getFileFullPath(
                                                                                                                          getJsonField(
                                                                                                                            gridGetDamagedVehicleImagesResponse.jsonBody,
                                                                                                                            r'''$.items[0].imageBlogName''',
                                                                                                                          ).toString(),
                                                                                                                          1,
                                                                                                                          FFAppState().BaseFilePath,
                                                                                                                          FFAppState().NewVehicleId),
                                                                                                                      width: 100.0,
                                                                                                                      height: 215.0,
                                                                                                                      fit: BoxFit.cover,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: double.infinity,
                                                                                                                    height: 215.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Align(
                                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        (int var1, int var2) {
                                                                                                                          return (var2 - var1) <= 0 ? " " : "+ " + (var2 - var1).toString() + " pictures ";
                                                                                                                        }(
                                                                                                                            1,
                                                                                                                            getJsonField(
                                                                                                                              gridGetDamagedVehicleImagesResponse.jsonBody,
                                                                                                                              r'''$.items[0].totalImages''',
                                                                                                                            )),
                                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
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
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ubp7xqhl' /* Repairs */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                16.0),
                                                                            child:
                                                                                Text(
                                                                              'CHF ${functions.formatNumberThousand(functions.stringToDouble(getJsonField(
                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                r'''$.repairs''',
                                                                              ).toString()))}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ny3kakba' /* Body */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                r'''$.bodyDamages''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '8dj2bufh' /* Mechanics */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                previewGetAuctionPreviewResponse.jsonBody,
                                                                                r'''$.mechanics''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 800.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pop();
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'tnet2tbm' /* Back */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          _model.apiResultActivate =
                                              await EFDevGroup
                                                  .activateAuctionCall
                                                  .call(
                                            vehicleId:
                                                FFAppState().NewVehicleId,
                                            language:
                                                FFLocalizations.of(context)
                                                    .languageCode,
                                          );
                                          if ((_model.apiResultActivate
                                                  ?.succeeded ??
                                              true)) {
                                            setState(() {
                                              FFAppState().NewVehicleId = '';
                                            });

                                            context
                                                .goNamed('VehiclesInAuction');
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(getJsonField(
                                                    (_model.apiResultActivate
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'zky6o3eb' /* Start Auction */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFC5181D),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
        );
      },
    );
  }
}
