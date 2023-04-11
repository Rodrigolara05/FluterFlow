import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_card_model.dart';
export 'car_card_model.dart';

class CarCardWidget extends StatefulWidget {
  const CarCardWidget({
    Key? key,
    this.jsonVehicleData,
    this.netxAction,
  }) : super(key: key);

  final dynamic jsonVehicleData;
  final Future<dynamic> Function()? netxAction;

  @override
  _CarCardWidgetState createState() => _CarCardWidgetState();
}

class _CarCardWidgetState extends State<CarCardWidget> {
  late CarCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarCardModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.spaceBetween,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width >= 500.0
                            ? 262.0
                            : MediaQuery.of(context).size.width,
                        height: 180.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Image.network(
                          functions.getFileFullPath(
                              getJsonField(
                                widget.jsonVehicleData,
                                r'''$.firstVehicleImageName''',
                              ).toString(),
                              0,
                              FFAppState().BaseFilePath,
                              getJsonField(
                                widget.jsonVehicleData,
                                r'''$.vehicleId''',
                              ).toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 762.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: getJsonField(
                                                widget.jsonVehicleData,
                                                r'''$.brand''',
                                              ).toString(),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '7vzc4bzu' /*  /  */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: getJsonField(
                                                widget.jsonVehicleData,
                                                r'''$.model''',
                                              ).toString(),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium,
                                        ),
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        ToggleIcon(
                                          onPressed: () async {
                                            setState(() => _model.isFavorite =
                                                !_model.isFavorite);
                                          },
                                          value: _model.isFavorite,
                                          onIcon: Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFE9C467),
                                            size: 32.0,
                                          ),
                                          offIcon: Icon(
                                            Icons.star_border_rounded,
                                            color: Color(0xFFE9C467),
                                            size: 32.0,
                                          ),
                                        ),
                                      Icon(
                                        Icons.star_outline_rounded,
                                        color: Color(0xFFE9C467),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Wrap(
                                spacing: 16.0,
                                runSpacing: 16.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.center,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 396.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 141.0,
                                                  decoration: BoxDecoration(),
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
                                                        child: Icon(
                                                          FFIcons.kcalendar,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        functions
                                                            .changeDateFormat(
                                                                getJsonField(
                                                                  widget
                                                                      .jsonVehicleData,
                                                                  r'''$.firstReg''',
                                                                ).toString(),
                                                                1),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: 141.0,
                                                    decoration: BoxDecoration(),
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
                                                          child: Icon(
                                                            FFIcons.kkm,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${functions.formatNumberThousandInt(getJsonField(
                                                            widget
                                                                .jsonVehicleData,
                                                            r'''$.kilometers''',
                                                          ))} KM',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 141.0,
                                                  decoration: BoxDecoration(),
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
                                                        child: Icon(
                                                          FFIcons.kmechanic,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          widget
                                                              .jsonVehicleData,
                                                          r'''$.gear''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
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
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 141.0,
                                                  decoration: BoxDecoration(),
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
                                                        child: Icon(
                                                          FFIcons.kfuel,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          widget
                                                              .jsonVehicleData,
                                                          r'''$.fuel''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: 141.0,
                                                    decoration: BoxDecoration(),
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
                                                          child: Icon(
                                                            FFIcons.kengine,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${getJsonField(
                                                            widget
                                                                .jsonVehicleData,
                                                            r'''$.performanceKw''',
                                                          ).toString()} KW (${getJsonField(
                                                            widget
                                                                .jsonVehicleData,
                                                            r'''$.performancePs''',
                                                          ).toString()} PS)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 141.0,
                                                  decoration: BoxDecoration(),
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
                                                        child: Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          widget
                                                              .jsonVehicleData,
                                                          r'''$.region''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
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
                                  Container(
                                    width: MediaQuery.of(context).size.width >=
                                            500.0
                                        ? 350.0
                                        : MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (FFAppState().IsLoggedUser)
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (functions
                                                                  .stringToDouble(
                                                                      getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.buyNowPrice''',
                                                              ).toString()) ==
                                                              0.0)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kraiseHand,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          if (functions
                                                                  .stringToDouble(
                                                                      getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.buyNowPrice''',
                                                              ).toString()) >
                                                              0.0)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kraiseHand,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          Text(
                                                            'CHF ${functions.stringToDouble(getJsonField(
                                                                  widget
                                                                      .jsonVehicleData,
                                                                  r'''$.finalSoldPrice''',
                                                                ).toString()) > 0.0 ? functions.formatNumberThousand(functions.stringToDouble(getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.finalSoldPrice''',
                                                              ).toString())) : functions.formatNumberThousand(functions.stringToDouble(getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.minimumPrice''',
                                                              ).toString()))}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  fontSize: functions
                                                                              .stringToDouble(getJsonField(
                                                                            widget.jsonVehicleData,
                                                                            r'''$.buyNowPrice''',
                                                                          ).toString()) ==
                                                                          0.0
                                                                      ? 22.0
                                                                      : 18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState().IsLoggedUser &&
                                                    (functions.stringToDouble(
                                                            getJsonField(
                                                          widget
                                                              .jsonVehicleData,
                                                          r'''$.buyNowPrice''',
                                                        ).toString()) >
                                                        0.0))
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    2.0,
                                                                    8.0,
                                                                    2.0),
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
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .gavel,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              ' CHF ${functions.formatNumberThousand(functions.stringToDouble(getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.buyNowPrice''',
                                                              ).toString()))}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
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
                                        if (!FFAppState().IsLoggedUser)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .info_outline_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bn25h1dw' /* Sign up to see auction details... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      if (!((functions.stringToInt(
                                                                  getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.remainingTime''',
                                                              ).toString()) <=
                                                              0) &&
                                                          (functions.stringToInt(
                                                                  getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.remainingOverTime''',
                                                              ).toString()) >
                                                              0)))
                                                        Container(
                                                          width: 141.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 80.0,
                                                                height: 40.0,
                                                                child: custom_widgets
                                                                    .CustomStopwatchCountDown(
                                                                  width: 80.0,
                                                                  height: 40.0,
                                                                  secondsToShow:
                                                                      functions
                                                                          .stringToInt(
                                                                              getJsonField(
                                                                    widget
                                                                        .jsonVehicleData,
                                                                    r'''$.remainingTime''',
                                                                  ).toString()),
                                                                  textColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  actionOnEnded:
                                                                      () async {
                                                                    await widget
                                                                        .netxAction
                                                                        ?.call();
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if ((functions.stringToInt(
                                                                  getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.remainingTime''',
                                                              ).toString()) <=
                                                              0) &&
                                                          (functions.stringToInt(
                                                                  getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.remainingOverTime''',
                                                              ).toString()) >
                                                              0))
                                                        Container(
                                                          width: 141.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kovertime,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 80.0,
                                                                height: 40.0,
                                                                child: custom_widgets
                                                                    .CustomStopwatchCountDown(
                                                                  width: 80.0,
                                                                  height: 40.0,
                                                                  secondsToShow:
                                                                      functions
                                                                          .stringToInt(
                                                                              getJsonField(
                                                                    widget
                                                                        .jsonVehicleData,
                                                                    r'''$.remainingOverTime''',
                                                                  ).toString()),
                                                                  textColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      18.0,
                                                                  actionOnEnded:
                                                                      () async {
                                                                    await widget
                                                                        .netxAction
                                                                        ?.call();
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                if (FFAppState().IsLoggedUser &&
                                                    (getJsonField(
                                                          widget
                                                              .jsonVehicleData,
                                                          r'''$.isHighestBid''',
                                                        ) !=
                                                        null))
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 32.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.isHighestBid''',
                                                              ) ==
                                                              false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .thumb_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                                widget
                                                                    .jsonVehicleData,
                                                                r'''$.isHighestBid''',
                                                              ) ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons.thumb_up,
                                                                color: Color(
                                                                    0xFF007D19),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          Text(
                                                            getJsonField(
                                                                      widget
                                                                          .jsonVehicleData,
                                                                      r'''$.isHighestBid''',
                                                                    ) ==
                                                                    true
                                                                ? FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                    enText:
                                                                        'Highest Bid',
                                                                    deText:
                                                                        'Höchstes Gebot',
                                                                    frText:
                                                                        'La plus élevée',
                                                                    itText:
                                                                        'Offerta più alta',
                                                                  )
                                                                : FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                    enText:
                                                                        'Lower Bid',
                                                                    deText:
                                                                        'Niedrigeres Gebot',
                                                                    frText:
                                                                        'Enchère inférieure',
                                                                    itText:
                                                                        'Offerta più bassa',
                                                                  ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: getJsonField(
                                                                            widget.jsonVehicleData,
                                                                            r'''$.isHighestBid''',
                                                                          ) ==
                                                                          true
                                                                      ? Color(0xFF007721)
                                                                      : Color(0xFFCC363A),
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
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
                                      ],
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
