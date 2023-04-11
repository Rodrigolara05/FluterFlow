import '/backend/api_requests/api_calls.dart';
import '/components/bid_mobile/bid_mobile_widget.dart';
import '/components/binding_bid/binding_bid_widget.dart';
import '/components/carrousel_panel/carrousel_panel_widget.dart';
import '/components/carrousel_panel_damege/carrousel_panel_damege_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/general_condition/general_condition_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicle_detail_mobile_model.dart';
export 'vehicle_detail_mobile_model.dart';

class VehicleDetailMobileWidget extends StatefulWidget {
  const VehicleDetailMobileWidget({
    Key? key,
    this.vehicleId,
    this.auctionId,
  }) : super(key: key);

  final String? vehicleId;
  final String? auctionId;

  @override
  _VehicleDetailMobileWidgetState createState() =>
      _VehicleDetailMobileWidgetState();
}

class _VehicleDetailMobileWidgetState extends State<VehicleDetailMobileWidget> {
  late VehicleDetailMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleDetailMobileModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                    'j42yvj8r' /* Vehicle Details */,
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
            child: FutureBuilder<ApiCallResponse>(
              future:
                  (_model.apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                        ..complete(EFDevGroup.getVehicleDetailsCall.call(
                          language: FFLocalizations.of(context).languageCode,
                          vehicleId: widget.vehicleId,
                          userId: FFAppState().UserId,
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
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                final columnGetVehicleDetailsResponse = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            setState(() => _model.apiRequestCompleter2 = null);
                            await _model.waitForApiRequestCompleted2();
                            setState(() => _model.apiRequestCompleter1 = null);
                            await _model.waitForApiRequestCompleted1();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter2 ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(EFDevGroup
                                                  .getVehicleDetailsCall
                                                  .call(
                                                language:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                                vehicleId: widget.vehicleId,
                                                userId: FFAppState().UserId !=
                                                            null &&
                                                        FFAppState().UserId !=
                                                            ''
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                          8.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
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
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleMedium,
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
                                                                              setState(() => _model.isFavorite = !_model.isFavorite);
                                                                            },
                                                                            value:
                                                                                _model.isFavorite,
                                                                            onIcon:
                                                                                Icon(
                                                                              Icons.star_rate_rounded,
                                                                              color: Color(0xFFE9C467),
                                                                              size: 32.0,
                                                                            ),
                                                                            offIcon:
                                                                                Icon(
                                                                              Icons.star_border_rounded,
                                                                              color: Color(0xFFE9C467),
                                                                              size: 32.0,
                                                                            ),
                                                                          ),
                                                                        Icon(
                                                                          Icons
                                                                              .star_outline_rounded,
                                                                          color:
                                                                              Color(0xFFE9C467),
                                                                          size:
                                                                              24.0,
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
                                                                          Text(
                                                                        EFDevGroup
                                                                            .getVehicleDetailsCall
                                                                            .type(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            )
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: EFDevGroup.getVehicleDetailsCall.isProfessionalSeller(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
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
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '7s005069' /* Swiss vehicle */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontWeight: FontWeight.w900,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (EFDevGroup.getVehicleDetailsCall.isSwiss(
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
                                                                                        'jmbrl7o2' /* Yes */,
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
                                                                              if (!EFDevGroup.getVehicleDetailsCall.isSwiss(
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
                                                                                        '9maka3gg' /* No */,
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
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
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 324.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: EFDevGroup
                                                                    .getVehicleImagesCall
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
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                2.0,
                                                                                1.0,
                                                                                2.0),
                                                                            child:
                                                                                Column(
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
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                1.0,
                                                                                2.0,
                                                                                2.0,
                                                                                2.0),
                                                                            child:
                                                                                Column(
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
                                                                                                      textAlign: TextAlign.center,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                                child:
                                                                    Visibility(
                                                                  visible: !EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .isPurchasedVehicle(
                                                                    bodyGetVehicleDetailsResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        if (!(EFDevGroup.getVehicleDetailsCall.isOvertime(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            ) &&
                                                                            (EFDevGroup.getVehicleDetailsCall.remainingTime(
                                                                                  bodyGetVehicleDetailsResponse.jsonBody,
                                                                                ) ==
                                                                                0) &&
                                                                            (EFDevGroup.getVehicleDetailsCall.remainingOverTime(
                                                                                  bodyGetVehicleDetailsResponse.jsonBody,
                                                                                ) >
                                                                                0)))
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.clock,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 100.0,
                                                                                  height: 24.0,
                                                                                  child: custom_widgets.CustomStopwatchCountDown(
                                                                                    width: 100.0,
                                                                                    height: 24.0,
                                                                                    secondsToShow: EFDevGroup.getVehicleDetailsCall.remainingTime(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    textColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    actionOnEnded: () async {
                                                                                      setState(() => _model.apiRequestCompleter2 = null);
                                                                                      await _model.waitForApiRequestCompleted2();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (EFDevGroup.getVehicleDetailsCall.isOvertime(
                                                                              bodyGetVehicleDetailsResponse.jsonBody,
                                                                            ) &&
                                                                            (EFDevGroup.getVehicleDetailsCall.remainingTime(
                                                                                  bodyGetVehicleDetailsResponse.jsonBody,
                                                                                ) ==
                                                                                0) &&
                                                                            (EFDevGroup.getVehicleDetailsCall.remainingOverTime(
                                                                                  bodyGetVehicleDetailsResponse.jsonBody,
                                                                                ) >
                                                                                0))
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.clock,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 100.0,
                                                                                  height: 24.0,
                                                                                  child: custom_widgets.CustomStopwatchCountDown(
                                                                                    width: 100.0,
                                                                                    height: 24.0,
                                                                                    secondsToShow: EFDevGroup.getVehicleDetailsCall.remainingOverTime(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    textColor: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    actionOnEnded: () async {
                                                                                      setState(() => _model.apiRequestCompleter2 = null);
                                                                                      await _model.waitForApiRequestCompleted2();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                                                  size: 22.0,
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
                                                                                        'vf75zfny' /*  Bidders */,
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
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
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
                                                                  if (!FFAppState()
                                                                      .IsLoggedUser)
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              '8kv10nic' /* To see auction details you nee... */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'dzh9o4cf' /*  Register */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.w600,
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
                                                                              '24b3ceg3' /*  or  */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'uuevij54' /* Login. */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                            mouseCursor:
                                                                                SystemMouseCursors.click,
                                                                            recognizer: TapGestureRecognizer()
                                                                              ..onTap = () async {
                                                                                context.pushNamed('Login');
                                                                              },
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
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
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Text(
                                                                EFDevGroup.getVehicleDetailsCall
                                                                            .soldPrice(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .settings_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'CHF ${functions.formatNumberThousand(EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        ) > 0 ? EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        ).toDouble() : EFDevGroup.getVehicleDetailsCall.minPrice(
                                                                          bodyGetVehicleDetailsResponse
                                                                              .jsonBody,
                                                                        ).toDouble())}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall,
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
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
                                                                          Icons
                                                                              .thumb_up_alt_rounded,
                                                                          color:
                                                                              Color(0xFF007D19),
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ra02ekd7' /* Right now you are the highest ... */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
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
                                                                              'd865m4x9' /* Extra costs */,
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
                                                                                          'p2bpvy01' /* Transportation */,
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
                                                                                        'z8vtpiwb' /* EF24 Fee */,
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
                                                                                        '0xgw9sc3' /* Total */,
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
                                                                                          ) > 0 ? EFDevGroup.getVehicleDetailsCall.soldPrice(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          ).toDouble() : EFDevGroup.getVehicleDetailsCall.minPrice(
                                                                                            bodyGetVehicleDetailsResponse.jsonBody,
                                                                                          ).toDouble(), EFDevGroup.getVehicleDetailsCall.transportCost(
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
                                                                                  '8resphxt' /* VAT included. */,
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
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .info_outline_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'nelbsk4k' /* Any warranty, as far as legall... */,
                                                                      ),
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
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
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
                                                                      'ftkamp3k' /* Vehicle Data */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text2,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Wrap(
                                                                  spacing: 0.0,
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
                                                                      width:
                                                                          141.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Wrap(
                                                                        spacing:
                                                                            8.0,
                                                                        runSpacing:
                                                                            8.0,
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
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
                                                                                      'sx14x0l2' /* PS */,
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
                                                                                      'qgjy30ue' /* KW */,
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          141.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Wrap(
                                                                        spacing:
                                                                            8.0,
                                                                        runSpacing:
                                                                            8.0,
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
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
                                                                                    'o4u8mrfr' /* Doors */,
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
                                                                                    'onf4sfjq' /* Key(s) */,
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
                                                                                    'vy9fj1v4' /* Seats */,
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
                                                        decoration:
                                                            BoxDecoration(),
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
                                                                    'jbwceioi' /* Car Details */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text2,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                            ),
                                                            Row(
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
                                                                                            'fcxnl3yj' /* Exterior Design */,
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
                                                                                            '99o9lhrl' /* Body Type */,
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
                                                                                            'mmezjfzw' /* Vehicle Inspection */,
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
                                                                                            '85zdooqj' /* Model Number */,
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
                                                                                            'ysy4v4zm' /* Vehicle Paintwork */,
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
                                                                                            'jl96ah0o' /* Maintenance Record */,
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
                                                                                            'xr6b2kmb' /* Frame No. */,
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
                                                                                          'm71vwh0g' /* Interior Color */,
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
                                                                                            'mq6pk43h' /* General Condition */,
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
                                                                                          'b4gktcr2' /* Options/Additional Info */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Text(
                                                                                      EFDevGroup.getVehicleDetailsCall
                                                                                          .additionalInfo(
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
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
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
                                                                'wqsh6wzw' /* Widgets */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            Divider(
                                                              thickness: 1.0,
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
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
                                                                              child: SizedBox(
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
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: widgets.length,
                                                                                itemBuilder: (context, widgetsIndex) {
                                                                                  final widgetsItem = widgets[widgetsIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      getJsonField(
                                                                                        widgetsItem,
                                                                                        r'''$.value''',
                                                                                      ).toString(),
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 1,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                                    '4hmht9o5' /* Vehicle Documents */,
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
                                                                              thickness: 1.0,
                                                                            ),
                                                                            if (getJsonField(
                                                                                  columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                  r'''$.items[?(@.positionDescriptor == 0)]''',
                                                                                ) !=
                                                                                null)
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  await launchURL(functions.getFileFullPathString(
                                                                                      getJsonField(
                                                                                        columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 0)].fileBlogName''',
                                                                                      ).toString(),
                                                                                      2,
                                                                                      FFAppState().BaseFilePath,
                                                                                      widget.vehicleId!));
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
                                                                                        'lnh63ahi' /* Vehicle Registration Card */,
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
                                                                                onTap: () async {
                                                                                  await launchURL(functions.getFileFullPathString(
                                                                                      getJsonField(
                                                                                        columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 1)].fileBlogName''',
                                                                                      ).toString(),
                                                                                      2,
                                                                                      FFAppState().BaseFilePath,
                                                                                      widget.vehicleId!));
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
                                                                                        'olh61xie' /* Service certificate */,
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
                                                                                onTap: () async {
                                                                                  await launchURL(functions.getFileFullPathString(
                                                                                      getJsonField(
                                                                                        columnDocsGetVehicleFilesResponse.jsonBody,
                                                                                        r'''$.items[?(@.positionDescriptor == 2)].fileBlogName''',
                                                                                      ).toString(),
                                                                                      2,
                                                                                      FFAppState().BaseFilePath,
                                                                                      widget.vehicleId!));
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
                                                                                        '2yaywnnv' /* Other documents */,
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
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ri3jpalo' /* Vehicle Damage */,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.23,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              FutureBuilder<ApiCallResponse>(
                                                                                future: EFDevGroup.getDamagedVehicleImagesCall.call(
                                                                                  vehicleId: widget.vehicleId,
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
                                                                                                                  height: 190.0,
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'kl2hrtgt' /* Repairs */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                'CHF ${functions.formatNumberThousand(functions.stringToDouble(EFDevGroup.getVehicleDetailsCall.repairs(
                                                                                      bodyGetVehicleDetailsResponse.jsonBody,
                                                                                    ).toString()))}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'pme4pm5f' /* Body */,
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
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            Text(
                                                                          EFDevGroup
                                                                              .getVehicleDetailsCall
                                                                              .bodyDamages(
                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                              )
                                                                              .toString(),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
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
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'qutc3nm0' /* Mechanics */,
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
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            Text(
                                                                          EFDevGroup
                                                                              .getVehicleDetailsCall
                                                                              .mechanics(
                                                                                bodyGetVehicleDetailsResponse.jsonBody,
                                                                              )
                                                                              .toString(),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
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
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
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
                    ),
                    if (FFAppState().IsLoggedUser &&
                        (functions.setTextToLowercase(
                                EFDevGroup.getVehicleDetailsCall
                                    .sellerUserId(
                                      columnGetVehicleDetailsResponse.jsonBody,
                                    )
                                    .toString()) !=
                            functions
                                .setTextToLowercase(FFAppState().UserId)) &&
                        (functions.setTextToLowercase(
                                EFDevGroup.getVehicleDetailsCall
                                    .sellerCompanyId(
                                      columnGetVehicleDetailsResponse.jsonBody,
                                    )
                                    .toString()) !=
                            functions
                                .setTextToLowercase(FFAppState().companyId)))
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Visibility(
                            visible: !EFDevGroup.getVehicleDetailsCall
                                .isPurchasedVehicle(
                              columnGetVehicleDetailsResponse.jsonBody,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (FFAppState().IsPrivate)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '127jsxyq' /* Private users only can sell th... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  if (FFAppState().IsLoggedUser &&
                                      !FFAppState().IsPrivate)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (EFDevGroup.getVehicleDetailsCall
                                                .buyNow(
                                              columnGetVehicleDetailsResponse
                                                  .jsonBody,
                                            ) >
                                            0)
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder:
                                                        (bottomSheetContext) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(
                                                                _unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery.of(
                                                                  bottomSheetContext)
                                                              .viewInsets,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                1.0,
                                                            child:
                                                                BindingBidWidget(
                                                              price: functions
                                                                  .stringToDouble(
                                                                      EFDevGroup
                                                                          .getVehicleDetailsCall
                                                                          .buyNow(
                                                                            columnGetVehicleDetailsResponse.jsonBody,
                                                                          )
                                                                          .toString()),
                                                              vehicleId: widget
                                                                  .vehicleId,
                                                              auctionId: widget
                                                                  .auctionId,
                                                              isBuyNow: true,
                                                              transportCost: EFDevGroup
                                                                  .getVehicleDetailsCall
                                                                  .transportCost(
                                                                    columnGetVehicleDetailsResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toDouble(),
                                                              fee: 100.0,
                                                              hasTransportCost:
                                                                  EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .hasTransportCost(
                                                                columnGetVehicleDetailsResponse
                                                                    .jsonBody,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

                                                  setState(() => _model
                                                          .apiRequestCompleter2 =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted2();
                                                },
                                                text:
                                                    '${FFLocalizations.of(context).getVariableText(
                                                  enText: 'Buy now CHF ',
                                                  deText: 'Kaufe jetzt CHF ',
                                                  frText: 'Acheter  CHF ',
                                                  itText: 'Acquista ora CHF ',
                                                )}${functions.formatNumberThousand(EFDevGroup.getVehicleDetailsCall.buyNow(
                                                          columnGetVehicleDetailsResponse
                                                              .jsonBody,
                                                        ).toDouble())}',
                                                icon: Icon(
                                                  Icons.gavel,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: FFAppState()
                                                          .IsPrivate &&
                                                      (EFDevGroup
                                                              .getVehicleDetailsCall
                                                              .sellerCompanyId(
                                                                columnGetVehicleDetailsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString() ==
                                                          FFAppState()
                                                              .companyId)
                                                  ? null
                                                  : () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color(0x98242729),
                                                        barrierColor:
                                                            Color(0x00000000),
                                                        enableDrag: false,
                                                        context: context,
                                                        builder:
                                                            (bottomSheetContext) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(
                                                                    _unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery.of(
                                                                      bottomSheetContext)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.32,
                                                                child:
                                                                    BidMobileWidget(
                                                                  soldPrice: EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .soldPrice(
                                                                        columnGetVehicleDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toDouble(),
                                                                  minPrice: EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .minPrice(
                                                                        columnGetVehicleDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toDouble(),
                                                                  minStepBid: EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .minStepBid(
                                                                        columnGetVehicleDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toDouble(),
                                                                  buyNow: EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .buyNow(
                                                                        columnGetVehicleDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toDouble(),
                                                                  vehicleId: widget
                                                                      .vehicleId,
                                                                  auctionId: widget
                                                                      .auctionId,
                                                                  transportCost: EFDevGroup
                                                                      .getVehicleDetailsCall
                                                                      .transportCost(
                                                                        columnGetVehicleDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toDouble(),
                                                                  fee: 100.0,
                                                                  hasTransportCost:
                                                                      EFDevGroup
                                                                          .getVehicleDetailsCall
                                                                          .hasTransportCost(
                                                                    columnGetVehicleDetailsResponse
                                                                        .jsonBody,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));

                                                      setState(() => _model
                                                              .apiRequestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted2();
                                                    },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'r4f5dq2x' /* Bid */,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
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
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
