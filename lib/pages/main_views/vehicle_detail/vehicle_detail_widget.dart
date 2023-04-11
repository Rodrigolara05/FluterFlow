import '/backend/api_requests/api_calls.dart';
import '/components/binding_bid/binding_bid_widget.dart';
import '/components/carrousel_panel/carrousel_panel_widget.dart';
import '/components/carrousel_panel_damege/carrousel_panel_damege_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/general_condition/general_condition_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicle_detail_model.dart';
export 'vehicle_detail_model.dart';

class VehicleDetailWidget extends StatefulWidget {
  const VehicleDetailWidget({
    Key? key,
    this.vehicleId,
    this.auctionId,
  }) : super(key: key);

  final String? vehicleId;
  final String? auctionId;

  @override
  _VehicleDetailWidgetState createState() => _VehicleDetailWidgetState();
}

class _VehicleDetailWidgetState extends State<VehicleDetailWidget> {
  late VehicleDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleDetailModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          elevation: 8.0,
          child: Icon(
            Icons.keyboard_arrow_up_rounded,
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 24.0,
          ),
        ),
        appBar: valueOrDefault<bool>(
          MediaQuery.of(context).size.width <= 500.0 ? true : false,
          false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                iconTheme: IconThemeData(
                    color: FlutterFlowTheme.of(context).primaryText),
                automaticallyImplyLeading: false,
                leading: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/EF24_logo.png',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 4.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 40.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      context.goNamed('HomePage');
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'pgd6nvtf' /* Home */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Icon(
                                      Icons.chevron_right_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '2icexz00' /* Vehicle Details */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??= Completer<
                                      ApiCallResponse>()
                                    ..complete(
                                        EFDevGroup.getVehicleDetailsCall.call(
                                      language: FFLocalizations.of(context)
                                          .languageCode,
                                      vehicleId: widget.vehicleId,
                                      userId: FFAppState().UserId != null &&
                                              FFAppState().UserId != ''
                                          ? FFAppState().UserId
                                          : '00000000-0000-0000-0000-000000000000',
                                    )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 35.0,
                                      height: 35.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                final bodyGetVehicleDetailsResponse =
                                    snapshot.data!;
                                return Container(
                                  width: 1050.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: 700.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
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
                                                                      24.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      '${EFDevGroup.getVehicleDetailsCall.brand(
                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                          ).toString()} / ${EFDevGroup.getVehicleDetailsCall.model(
                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                          ).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium,
                                                                    ),
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
                                                                      ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(() =>
                                                                              FFAppState().filterSortFavorite = !FFAppState().filterSortFavorite);
                                                                        },
                                                                        value: FFAppState()
                                                                            .filterSortFavorite,
                                                                        onIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .star_rate_rounded,
                                                                          color:
                                                                              Color(0xFFE9C467),
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                        offIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .star_border_rounded,
                                                                          color:
                                                                              Color(0xFFE9C467),
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                      ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_outline_rounded,
                                                                      color: Color(
                                                                          0xFFE9C467),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    EFDevGroup
                                                                        .getVehicleDetailsCall
                                                                        .type(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          32.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: EFDevGroup.getVehicleDetailsCall.isProfessionalSeller(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        )
                                                                            ? Color(0xFF007D19)
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                FFIcons.kprivate,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              EFDevGroup.getVehicleDetailsCall.isProfessionalSeller(
                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                              )
                                                                                  ? FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'Professional',
                                                                                      deText: 'Fachmann',
                                                                                      frText: 'Professionnel',
                                                                                      itText: 'Professionale',
                                                                                    )
                                                                                  : FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'Private',
                                                                                      deText: 'Privatgelände',
                                                                                      frText: 'Privé',
                                                                                      itText: 'Privato',
                                                                                    ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          32.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.location_on_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              EFDevGroup.getVehicleDetailsCall
                                                                                  .region(
                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                  )
                                                                                  .toString(),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '8rv4tfst' /* Swiss vehicle */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontWeight: FontWeight.w900,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (EFDevGroup
                                                                              .getVehicleDetailsCall
                                                                              .isSwiss(
                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                          ))
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  width: 1.5,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'kn74oqh1' /* Yes */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (!EFDevGroup
                                                                              .getVehicleDetailsCall
                                                                              .isSwiss(
                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                          ))
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  width: 1.5,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'aww0l2im' /* No */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 324.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: EFDevGroup
                                                                .getVehicleImagesCall
                                                                .call(
                                                              vehicleId: widget
                                                                  .vehicleId,
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
                                                              final gridGetVehicleImagesResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            1.0,
                                                                            2.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
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
                                                                                              vehicleId: widget.vehicleId,
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
                                                                                        widget.vehicleId!),
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
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            1.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
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
                                                                                              vehicleId: widget.vehicleId,
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
                                                                                        widget.vehicleId!),
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
                                                                                                vehicleId: widget.vehicleId,
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
                                                                                          widget.vehicleId!),
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
                                                                                              vehicleId: widget.vehicleId,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 106.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Stack(
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 106.0,
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
                                                                                                  widget.vehicleId!),
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 106.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x98242729),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  (int var1, int var2) {
                                                                                                    return (var2 - var1) <= 0 ? " " : "+ " + (var2 - var1).toString() + " pictures ";
                                                                                                  }(
                                                                                                      4,
                                                                                                      getJsonField(
                                                                                                        gridGetVehicleImagesResponse.jsonBody,
                                                                                                        r'''$.items[3].totalImages''',
                                                                                                      )),
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                      ),
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'bm49ligi' /* Vehicle Data */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .text2,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Container(
                                                                  width: 141.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Wrap(
                                                                    spacing:
                                                                        0.0,
                                                                    runSpacing:
                                                                        0.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .vertical,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
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
                                                                                    EFDevGroup.getVehicleDetailsCall
                                                                                        .firstReg(
                                                                                          bodyGetVehicleDetailsResponse.jsonBody,
                                                                                        )
                                                                                        .toString(),
                                                                                    1),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kengine,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .ps(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString()
                                                                                    .maybeHandleOverflow(maxChars: 6),
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
                                                                                  'nndyt1kc' /* PS */,
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
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .kw(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString()
                                                                                    .maybeHandleOverflow(maxChars: 6),
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
                                                                                  'd3457dq6' /* KW */,
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kkm,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${functions.formatNumberThousandInt(EFDevGroup.getVehicleDetailsCall.kilometers(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    ).toDouble())} Km',
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
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Wrap(
                                                                    spacing:
                                                                        0.0,
                                                                    runSpacing:
                                                                        0.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .vertical,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kmechanic,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .gearTx(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString(),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kfuel,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .fuel(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString(),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.ktraction,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .wheelDrive(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString(),
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
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Wrap(
                                                                    spacing:
                                                                        0.0,
                                                                    runSpacing:
                                                                        0.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .vertical,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kdoors,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .doors(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'lu2enlis' /* Doors */,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kkey,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .keys(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'iz52oi4q' /* Key(s) */,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              FFIcons.kseats,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                EFDevGroup.getVehicleDetailsCall
                                                                                    .seats(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    )
                                                                                    .toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '5dnkm85q' /* Seats */,
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
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wivy943w' /* Car Details */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .text2,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Wrap(
                                                                    spacing:
                                                                        0.0,
                                                                    runSpacing:
                                                                        0.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 141.0
                                                                            : 500.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Wrap(
                                                                            spacing:
                                                                                16.0,
                                                                            runSpacing:
                                                                                16.0,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.vertical,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
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
                                                                                            'nu9wnlqz' /* Exterior Design */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        EFDevGroup.getVehicleDetailsCall
                                                                                            .extColor(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString(),
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
                                                                                            '7mb64jry' /* Body Type */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        EFDevGroup.getVehicleDetailsCall
                                                                                            .bodyType(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString(),
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
                                                                                            'cm4otyyx' /* Vehicle Inspection */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        functions.changeDateFormat(
                                                                                            EFDevGroup.getVehicleDetailsCall
                                                                                                .inspectionDate(
                                                                                                  bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                )
                                                                                                .toString(),
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 100.0
                                                                            : 500.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Wrap(
                                                                            spacing:
                                                                                16.0,
                                                                            runSpacing:
                                                                                16.0,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.vertical,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
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
                                                                                            'n49xfboi' /* Model Number */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        EFDevGroup.getVehicleDetailsCall
                                                                                            .modelNumber(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString(),
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
                                                                                            'c768xse3' /* Vehicle Paintwork */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        EFDevGroup.getVehicleDetailsCall
                                                                                            .paintwork(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString(),
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
                                                                                            'vyeho2yw' /* Maintenance Record */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        EFDevGroup.getVehicleDetailsCall
                                                                                            .maintenancRecord(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString(),
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
                                                                        width: MediaQuery.of(context).size.width >=
                                                                                500.0
                                                                            ? 100.0
                                                                            : 500.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Wrap(
                                                                          spacing:
                                                                              16.0,
                                                                          runSpacing:
                                                                              16.0,
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.vertical,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
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
                                                                                          'spx101ly' /* Frame No. */,
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
                                                                                        EFDevGroup.getVehicleDetailsCall
                                                                                            .frame(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString(),
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
                                                                                          '8t3abf5n' /* Interior Color */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Text(
                                                                                      EFDevGroup.getVehicleDetailsCall
                                                                                          .intColor(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          )
                                                                                          .toString(),
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
                                                                              visible: functions.countTrueConditions(
                                                                                      EFDevGroup.getVehicleDetailsCall.condition1(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ),
                                                                                      EFDevGroup.getVehicleDetailsCall.condition2(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ),
                                                                                      EFDevGroup.getVehicleDetailsCall.condition3(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ),
                                                                                      EFDevGroup.getVehicleDetailsCall.condition4(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ),
                                                                                      EFDevGroup.getVehicleDetailsCall.condition5(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ),
                                                                                      EFDevGroup.getVehicleDetailsCall.condition6(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ),
                                                                                      EFDevGroup.getVehicleDetailsCall.condition7(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
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
                                                                                            'm2ogpzk6' /* General Condition */,
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
                                                                                                    jsonPreview: bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    isPreview: false,
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
                                                                                                '${functions.countTrueConditions(EFDevGroup.getVehicleDetailsCall.condition1(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    ), EFDevGroup.getVehicleDetailsCall.condition2(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    ), EFDevGroup.getVehicleDetailsCall.condition3(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    ), EFDevGroup.getVehicleDetailsCall.condition4(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    ), EFDevGroup.getVehicleDetailsCall.condition5(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    ), EFDevGroup.getVehicleDetailsCall.condition6(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                    ), EFDevGroup.getVehicleDetailsCall.condition7(
                                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
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
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                      'spt9yslf' /* Options/Additional Info */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .additionalInfo(
                                                                        bodyGetVehicleDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontWeight:
                                                                            FontWeight.w900,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wkcrxqn4' /* Widgets */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .text2,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                          ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: [
                                                              Wrap(
                                                                spacing: 16.0,
                                                                runSpacing:
                                                                    16.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: EFDevGroup
                                                                          .getWidgetsDescriptionsCall
                                                                          .call(
                                                                        vehicleId:
                                                                            widget.vehicleId,
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
                                                                              primary: false,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: 296.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child: Text(
                                                                  EFDevGroup.getVehicleDetailsCall
                                                                              .soldPrice(
                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                          ) >
                                                                          0
                                                                      ? FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                          enText:
                                                                              'Auction Price',
                                                                          deText:
                                                                              'Auktionspreis',
                                                                          frText:
                                                                              'Prix de l\'enchère',
                                                                          itText:
                                                                              'Prezzo d\'asta',
                                                                        )
                                                                      : FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                          enText:
                                                                              'Minimum Price',
                                                                          deText:
                                                                              'Minimaler Preis',
                                                                          frText:
                                                                              'Prix ​​Minimum',
                                                                          itText:
                                                                              'Prezzo Minimo',
                                                                        ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              if (!FFAppState()
                                                                  .IsLoggedUser)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'y7gm8o85' /* To see auction details you nee... */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'h23e18hb' /*  Register */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                          mouseCursor:
                                                                              SystemMouseCursors.click,
                                                                          recognizer: TapGestureRecognizer()
                                                                            ..onTap = () async {
                                                                              context.pushNamed('Register_Step0');
                                                                            },
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'quaqkj7q' /*  or  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '7tvm1w21' /* Login. */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                          mouseCursor:
                                                                              SystemMouseCursors.click,
                                                                          recognizer: TapGestureRecognizer()
                                                                            ..onTap = () async {
                                                                              context.pushNamed('Login');
                                                                            },
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                  .IsLoggedUser)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
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
                                                                            Icon(
                                                                          FFIcons
                                                                              .kraiseHand,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'CHF ${functions.formatNumberThousand(EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            ) > 0 ? EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            ).toDouble() : EFDevGroup.getVehicleDetailsCall.minPrice(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            ).toDouble())}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              Text(
                                                                '${FFLocalizations.of(context).getVariableText(
                                                                  enText:
                                                                      'Transportation will be provided by ',
                                                                  deText:
                                                                      'Der Transport erfolgt durch ',
                                                                  frText:
                                                                      'Le transport sera assuré par ',
                                                                  itText:
                                                                      'Il trasporto sarà fornito dal ',
                                                                )}${EFDevGroup.getVehicleDetailsCall.hasTransportCost(
                                                                  bodyGetVehicleDetailsResponse
                                                                      .jsonBody,
                                                                ) ? FFLocalizations.of(context).getVariableText(
                                                                    enText:
                                                                        'the buyer',
                                                                    deText:
                                                                        'der Käufer',
                                                                    frText:
                                                                        'l\'acheteur',
                                                                    itText:
                                                                        'acquirente',
                                                                  ) : FFLocalizations.of(context).getVariableText(
                                                                    enText:
                                                                        'the seller',
                                                                    deText:
                                                                        'der Verkäufer',
                                                                    frText:
                                                                        'le vendeur',
                                                                    itText:
                                                                        'venditore',
                                                                  )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            false,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0ufw2kny' /* Extra costs */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(),
                                                                          expanded:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              if (EFDevGroup.getVehicleDetailsCall.hasTransportCost(
                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                              ))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '959eqf6j' /* Transportation */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'CHF ${functions.formatNumberThousand(EFDevGroup.getVehicleDetailsCall.transportCost(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            ).toDouble())}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'dagv40wn' /* EF24 Fee */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      'CHF ${functions.formatNumberThousand(100.0)}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '9tsycs0y' /* Total */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      'CHF ${functions.formatNumberThousand(functions.getTotalIncrement(EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          ) > 0 ? functions.stringToDouble(EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          ).toString()) : functions.stringToDouble(EFDevGroup.getVehicleDetailsCall.minPrice(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          ).toString()), EFDevGroup.getVehicleDetailsCall.transportCost(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          ).toDouble(), 100.0))}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ducenmp6' /* VAT included. */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                          ),
                                                                        ),
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
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .info_outline_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'mze86x8e' /* Any warranty, as far as legall... */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 16.0,
                                                                thickness: 1.5,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .borderColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (!EFDevGroup
                                                            .getVehicleDetailsCall
                                                            .isPurchasedVehicle(
                                                          bodyGetVehicleDetailsResponse
                                                              .jsonBody,
                                                        ))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                          16.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6sbqxd81' /* Remaining Time */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
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
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .clock,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            40.0,
                                                                        child: custom_widgets
                                                                            .CustomStopwatchCountDown(
                                                                          width:
                                                                              150.0,
                                                                          height:
                                                                              40.0,
                                                                          secondsToShow: EFDevGroup
                                                                              .getVehicleDetailsCall
                                                                              .remainingTime(
                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                          ),
                                                                          textColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              20.0,
                                                                          actionOnEnded:
                                                                              () async {
                                                                            setState(() =>
                                                                                _model.apiRequestCompleter = null);
                                                                            await _model.waitForApiRequestCompleted();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (EFDevGroup
                                                                    .getVehicleDetailsCall
                                                                    .isOvertime(
                                                                  bodyGetVehicleDetailsResponse
                                                                      .jsonBody,
                                                                ))
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'rxxydtgx' /* Overtime */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.kovertime,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 150.0,
                                                                                height: 40.0,
                                                                                child: custom_widgets.CustomStopwatchCountDown(
                                                                                  width: 150.0,
                                                                                  height: 40.0,
                                                                                  secondsToShow: EFDevGroup.getVehicleDetailsCall.remainingOverTime(
                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                  ),
                                                                                  textColor: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 20.0,
                                                                                  actionOnEnded: () async {
                                                                                    setState(() => _model.apiRequestCompleter = null);
                                                                                    await _model.waitForApiRequestCompleted();
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .IsLoggedUser &&
                                                                    (EFDevGroup
                                                                            .getVehicleDetailsCall
                                                                            .sellerUserId(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            )
                                                                            .toString() !=
                                                                        FFAppState()
                                                                            .UserId) &&
                                                                    (EFDevGroup
                                                                            .getVehicleDetailsCall
                                                                            .sellerCompanyId(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            )
                                                                            .toString() !=
                                                                        FFAppState()
                                                                            .companyId))
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'wnbajbq2' /* Select Bid Amount */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.dropDownIncrementController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownIncrementValue ??= EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      ) >
                                                                                      0
                                                                                  ? functions
                                                                                      .getNewIncrement(
                                                                                          EFDevGroup.getVehicleDetailsCall
                                                                                              .soldPrice(
                                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                                              )
                                                                                              .toDouble(),
                                                                                          EFDevGroup.getVehicleDetailsCall.minStepBid(
                                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                  ) >
                                                                                                  0
                                                                                              ? EFDevGroup.getVehicleDetailsCall
                                                                                                  .minStepBid(
                                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                  )
                                                                                                  .toDouble()
                                                                                              : 50.0)
                                                                                      .toString()
                                                                                  : EFDevGroup.getVehicleDetailsCall
                                                                                      .minPrice(
                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                      )
                                                                                      .toString(),
                                                                            ),
                                                                            options: functions
                                                                                .generatePriceList(
                                                                                    EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            ) >
                                                                                            0
                                                                                        ? EFDevGroup.getVehicleDetailsCall
                                                                                            .soldPrice(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toDouble()
                                                                                        : EFDevGroup.getVehicleDetailsCall
                                                                                            .minPrice(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toDouble(),
                                                                                    EFDevGroup.getVehicleDetailsCall
                                                                                        .minStepBid(
                                                                                          bodyGetVehicleDetailsResponse.jsonBody,
                                                                                        )
                                                                                        .toDouble(),
                                                                                    5,
                                                                                    EFDevGroup.getVehicleDetailsCall
                                                                                        .buyNow(
                                                                                          bodyGetVehicleDetailsResponse.jsonBody,
                                                                                        )
                                                                                        .toDouble(),
                                                                                    EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                          bodyGetVehicleDetailsResponse.jsonBody,
                                                                                        ) ==
                                                                                        0)
                                                                                .toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.dropDownIncrementValue = val);
                                                                              setState(() {
                                                                                _model.incrementBid = functions.getNewIncrement(
                                                                                    functions.stringToDouble(_model.dropDownIncrementValue!),
                                                                                    EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            ) >
                                                                                            0
                                                                                        ? EFDevGroup.getVehicleDetailsCall
                                                                                            .soldPrice(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toDouble()
                                                                                        : EFDevGroup.getVehicleDetailsCall
                                                                                            .minPrice(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toDouble());
                                                                              });
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'opf9iifh' /* Select a bid value */,
                                                                            ),
                                                                            fillColor:
                                                                                Colors.white,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0x66ABABAB),
                                                                            borderWidth:
                                                                                1.5,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            disabled:
                                                                                FFAppState().IsPrivate,
                                                                            isSearchable:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                        if (_model.dropDownIncrementValue !=
                                                                                null &&
                                                                            _model.dropDownIncrementValue !=
                                                                                '')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'kt9kuz24' /* Increment of CHF */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: Text(
                                                                                  functions.formatNumberThousand(_model.incrementBid),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed: FFAppState().IsPrivate ||
                                                                                    (EFDevGroup.getVehicleDetailsCall
                                                                                            .sellerCompanyId(
                                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                                            )
                                                                                            .toString() ==
                                                                                        FFAppState().companyId)
                                                                                ? null
                                                                                : () async {
                                                                                    if (_model.dropDownIncrementValue != null && _model.dropDownIncrementValue != '') {
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
                                                                                                child: BindingBidWidget(
                                                                                                  price: functions.stringToDouble(_model.dropDownIncrementValue!),
                                                                                                  vehicleId: widget.vehicleId,
                                                                                                  auctionId: widget.auctionId,
                                                                                                  isBuyNow: false,
                                                                                                  transportCost: EFDevGroup.getVehicleDetailsCall
                                                                                                      .transportCost(
                                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                      )
                                                                                                      .toDouble(),
                                                                                                  fee: 100.0,
                                                                                                  hasTransportCost: EFDevGroup.getVehicleDetailsCall.hasTransportCost(
                                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));

                                                                                      setState(() => _model.apiRequestCompleter = null);
                                                                                      await _model.waitForApiRequestCompleted();
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().isLoading = false;
                                                                                      });
                                                                                    } else {
                                                                                      await actions.snackbarAction(
                                                                                        context,
                                                                                        FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'You must select a bid value',
                                                                                          deText: 'Sie müssen einen Gebotswert auswählen',
                                                                                          frText: 'Vous devez sélectionner une valeur d\'enchère',
                                                                                          itText: 'Devi selezionare un valore di offerta',
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              '9ue947n0' /* Bid */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: Colors.white,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                              elevation: 2.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (EFDevGroup.getVehicleDetailsCall.buyNow(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            ) >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: FFAppState().IsPrivate &&
                                                                                      (EFDevGroup.getVehicleDetailsCall
                                                                                              .sellerCompanyId(
                                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                                              )
                                                                                              .toString() ==
                                                                                          FFAppState().companyId)
                                                                                  ? null
                                                                                  : () async {
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
                                                                                                child: BindingBidWidget(
                                                                                                  price: functions.stringToDouble(EFDevGroup.getVehicleDetailsCall
                                                                                                      .buyNow(
                                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                      )
                                                                                                      .toString()),
                                                                                                  vehicleId: widget.vehicleId,
                                                                                                  auctionId: widget.auctionId,
                                                                                                  isBuyNow: true,
                                                                                                  transportCost: EFDevGroup.getVehicleDetailsCall
                                                                                                      .transportCost(
                                                                                                        bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                      )
                                                                                                      .toDouble(),
                                                                                                  fee: 100.0,
                                                                                                  hasTransportCost: EFDevGroup.getVehicleDetailsCall.hasTransportCost(
                                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));

                                                                                      setState(() => _model.apiRequestCompleter = null);
                                                                                      await _model.waitForApiRequestCompleted();
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().isLoading = false;
                                                                                      });
                                                                                    },
                                                                              text: '${FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Buy now CHF ',
                                                                                deText: 'Kaufe jetzt CHF ',
                                                                                frText: 'Acheter  CHF ',
                                                                                itText: 'Acquista ora CHF ',
                                                                              )}${functions.formatNumberThousand(EFDevGroup.getVehicleDetailsCall.buyNow(
                                                                                    bodyGetVehicleDetailsResponse.jsonBody,
                                                                                  ).toDouble())}',
                                                                              icon: Icon(
                                                                                Icons.gavel,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                elevation: 2.0,
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 1.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                disabledColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                disabledTextColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                    .IsPrivate)
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'dinic80q' /* Private users only can sell th... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                .IsLoggedUser &&
                                                            !EFDevGroup
                                                                .getVehicleDetailsCall
                                                                .isPurchasedVehicle(
                                                              bodyGetVehicleDetailsResponse
                                                                  .jsonBody,
                                                            ))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Divider(
                                                                  height: 16.0,
                                                                  thickness:
                                                                      1.5,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderColor,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'w8hph4ze' /* Position */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.user,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                            RichText(
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: EFDevGroup.getVehicleDetailsCall
                                                                                        .totalBidders(
                                                                                          bodyGetVehicleDetailsResponse.jsonBody,
                                                                                        )
                                                                                        .toString(),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'cewld5pd' /*  Bidders */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (getJsonField(
                                                                      bodyGetVehicleDetailsResponse
                                                                          .jsonBody,
                                                                      r'''$.auctionData.isHighestBid''',
                                                                    ) ==
                                                                    true)
                                                                  Container(
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
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.thumb_up_alt_rounded,
                                                                            color:
                                                                                Color(0xFF007D19),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'iixavxwh' /* Right now you are the highest ... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Color(0xFF007D19),
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Divider(
                                                                  height: 16.0,
                                                                  thickness:
                                                                      1.5,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .borderColor,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (EFDevGroup
                                                                .getVehicleDetailsCall
                                                                .isRegAvailable(
                                                              bodyGetVehicleDetailsResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            true)
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: EFDevGroup
                                                                    .getVehicleFilesCall
                                                                    .call(
                                                                  vehicleId: widget
                                                                      .vehicleId,
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
                                                                  final columnDocsGetVehicleFilesResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return Column(
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
                                                                              'k67vtbxb' /* Vehicle Documents */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                      ),
                                                                      if (getJsonField(
                                                                            columnDocsGetVehicleFilesResponse.jsonBody,
                                                                            r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                          ) !=
                                                                          null)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL(functions.getFileFullPathString(
                                                                                getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 0)].fileBlogName''',
                                                                                ).toString(),
                                                                                2,
                                                                                FFAppState().BaseFilePath,
                                                                                widget.vehicleId!));
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                  'g3t0xxh9' /* Vehicle Registration Card */,
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
                                                                      if (getJsonField(
                                                                            columnDocsGetVehicleFilesResponse.jsonBody,
                                                                            r'''$.items[?(@.positionDescriptor == 1)]''',
                                                                          ) !=
                                                                          null)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL(functions.getFileFullPathString(
                                                                                getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 1)].fileBlogName''',
                                                                                ).toString(),
                                                                                2,
                                                                                FFAppState().BaseFilePath,
                                                                                widget.vehicleId!));
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                  'g7n08xqt' /* Service certificate */,
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
                                                                      if (getJsonField(
                                                                            columnDocsGetVehicleFilesResponse.jsonBody,
                                                                            r'''$.items[?(@.positionDescriptor == 2)]''',
                                                                          ) !=
                                                                          null)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL(functions.getFileFullPathString(
                                                                                getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 2)].fileBlogName''',
                                                                                ).toString(),
                                                                                2,
                                                                                FFAppState().BaseFilePath,
                                                                                widget.vehicleId!));
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                  '8xzj1wmw' /* Other documents */,
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
                                                        if (EFDevGroup
                                                                .getVehicleDetailsCall
                                                                .isDamaged(
                                                              bodyGetVehicleDetailsResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            true)
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ozfrm0x7' /* Vehicle Damage */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      1.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
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
                                                                          future: EFDevGroup
                                                                              .getDamagedVehicleImagesCall
                                                                              .call(
                                                                            vehicleId:
                                                                                widget.vehicleId,
                                                                            language:
                                                                                FFLocalizations.of(context).languageCode,
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
                                                                            final gridGetDamagedVehicleImagesResponse =
                                                                                snapshot.data!;
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
                                                                                                            vehicleId: widget.vehicleId,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() {}));
                                                                                              },
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                height: 150.0,
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
                                                                                                                widget.vehicleId!),
                                                                                                            width: 100.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 200.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x98242729),
                                                                                                            ),
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'yq8wa6fx' /* Repairs */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'CHF ${functions.formatNumberThousand(functions.stringToDouble(EFDevGroup.getVehicleDetailsCall.repairs(
                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                              ).toString()))}',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5752i5nq' /* Body */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Text(
                                                                    EFDevGroup
                                                                        .getVehicleDetailsCall
                                                                        .bodyDamages(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3mqwamo5' /* Mechanics */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Text(
                                                                    EFDevGroup
                                                                        .getVehicleDetailsCall
                                                                        .mechanics(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
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
      ),
    );
  }
}
