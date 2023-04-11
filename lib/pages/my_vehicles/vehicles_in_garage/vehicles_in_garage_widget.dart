import '/backend/api_requests/api_calls.dart';
import '/components/actions_b_s/actions_b_s_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/mouse_region_vehicles_garage/mouse_region_vehicles_garage_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/sort_purchased_sold/sort_purchased_sold_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicles_in_garage_model.dart';
export 'vehicles_in_garage_model.dart';

class VehiclesInGarageWidget extends StatefulWidget {
  const VehiclesInGarageWidget({Key? key}) : super(key: key);

  @override
  _VehiclesInGarageWidgetState createState() => _VehiclesInGarageWidgetState();
}

class _VehiclesInGarageWidgetState extends State<VehiclesInGarageWidget> {
  late VehiclesInGarageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehiclesInGarageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().filterDescriptionLists =
            FFLocalizations.of(context).getVariableText(
          enText: 'Created',
          deText: 'Erstellt',
          frText: 'Créé',
          itText: 'Creato',
        );
        FFAppState().filterSortDescLists = true;
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
        endDrawer: Drawer(
          elevation: 16.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.userCircle,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                FFAppState().IsLoggedUser
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
                                    : FFLocalizations.of(context)
                                        .getVariableText(
                                        enText: 'User\'s corner',
                                        deText: 'Benutzerecke',
                                        frText: 'Le coin des utilisateurs',
                                        itText: 'L\'angolo dell\'utente',
                                      ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 32.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: FlutterFlowLanguageSelector(
                          width: double.infinity,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                          borderColor: Color(0xFF262D34),
                          dropdownIconColor: Color(0xFF14181B),
                          borderRadius: 8.0,
                          textStyle: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 13.0,
                          ),
                          hideFlags: false,
                          flagSize: 24.0,
                          flagTextGap: 8.0,
                          currentLanguage:
                              FFLocalizations.of(context).languageCode,
                          languages: FFLocalizations.languages(),
                          onChanged: (lang) => setAppLanguage(context, lang),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('HomePage');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '1dn1torx' /* HOME */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  FFAppState().NewVehicleId =
                                      'B3853585-CAD8-4A8E-4EDB-3A09489DBBA7';
                                });

                                context.pushNamed('RegisterCar_step3');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'glbf3bdy' /* HOW IT WORKS */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            if (FFAppState().IsLoggedUser) {
                              context.pushNamed('RegisterCar_method');
                            } else {
                              context.pushNamed('Login');
                            }

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'twl7mhcx' /* ADD VEHICLE */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  FFAppState().NewVehicleId =
                                      '3598FFB5-CD39-1AE3-426F-3A0945E82CF6';
                                });

                                context.pushNamed('Preview');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gdknnxlz' /* CONTACT US */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().IsLoggedUser == true)
                  Divider(
                    thickness: 1.0,
                    color: Color(0x6757636C),
                  ),
                if (FFAppState().IsLoggedUser == true)
                  ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'upa8m018' /* Vehicles */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Icon(
                              FFIcons.kcarSport,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('VehiclesSold');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gi7ok9b1' /* Vehicles Sold */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('VehiclesPurchased');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'w3fqxwv7' /* Vehicles Purchased */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('VehiclesInAuction');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ru0ls0tv' /* Vehicles in Auction */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('VehiclesInGarage');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'y28vftx2' /* Vehicles in Garage */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('VehiclesFavourites');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '19c91bir' /* My Favourite Vehicles */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'xti6cwss' /* Saved searches */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Icon(
                              Icons.search_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'd889rrkf' /* My saved search */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      if (!FFAppState().IsPrivate &&
                          !FFAppState().isSubUser &&
                          FFAppState().IsLoggedUser)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'yv8nzi3e' /* Sub Users */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.userCircle,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed('AddSub-User');

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '1ppnsa44' /* Add Sub User */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed('Sub-userListing');

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3qhvizbl' /* Sub User Listing */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'vceg7qdt' /* Settings */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Icon(
                              FFIcons.ksettings,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('Account');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zum8v6h2' /* Account */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '100e3cfh' /* My invoices */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('TermsConditions');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'oeyic6ro' /* Terms and Conditions */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('PrivacyPolicy');

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2obaxcbr' /* Privacy Policy */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                ),
                if (!FFAppState().IsLoggedUser)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('Login');

                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'pbijikf9' /* Login / Registration */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Icon(
                            Icons.login_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().IsLoggedUser)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: InkWell(
                      onTap: () async {
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
                          FFAppState().firstName = '';
                          FFAppState().lastName = '';
                        });
                        Navigator.pop(context);

                        context.goNamed('HomePage');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '1wkmhiq7' /* Logout */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Icon(
                            FFIcons.kpower,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 40.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Text(
                        '${FFLocalizations.of(context).getVariableText(
                          enText: 'Version ',
                          deText: 'Version ',
                          frText: 'Version ',
                          itText: 'Versione ',
                        )}${FFAppState().Version}',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                  width: MediaQuery.of(context).size.width * 1.0,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??= Completer<
                            ApiCallResponse>()
                          ..complete(EFDevGroup.vehiclesInGarageCall.call(
                            userId: FFAppState().UserId,
                            language: FFLocalizations.of(context).languageCode,
                            skipCount: _model.skipResults,
                            maxResultCount: _model.countResults,
                            sortDesc: FFAppState().filterSortDescLists,
                            sortSortDescription:
                                FFAppState().filterDescriptionLists != null &&
                                        FFAppState().filterDescriptionLists !=
                                            ''
                                    ? FFAppState().filterDescriptionLists
                                    : '',
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
                      final rowVehiclesInGarageResponse = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      width: 212.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fhtt3z3b' /* Vehicles */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                    ),
                                                    Icon(
                                                      FFIcons.kcarSport,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
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
                                                  Container(
                                                    width: double.infinity,
                                                    height: 24.0,
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'VehiclesSold');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ea39dzq1' /* Sold Vehicles */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 24.0,
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'VehiclesPurchased');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4i1zirmk' /* Purchased Vehicles */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 24.0,
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'VehiclesInAuction');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'aeek7usz' /* Vehicles in Auction */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'VehiclesInGarage');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9bajms57' /* Vehicles in Garage */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 24.0,
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'VehiclesFavourites');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '3dyttclm' /* Favourite Vehicles */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ofpe0qa8' /* Reminder */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                    ),
                                                    Icon(
                                                      Icons.search_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (!FFAppState().IsPrivate &&
                                                !FFAppState().isSubUser)
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
                                                                  16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'b12a33em' /* Users management */,
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
                                                                        .primaryText,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                            ),
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .user,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 22.0,
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
                                                            width:
                                                                double.infinity,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'AddSub-User');
                                                              },
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0z74z0ji' /* Add Sub User */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'Sub-userListing');
                                                              },
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '14wohy7f' /* Sub User Listing */,
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
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rxv8a9vp' /* Settings */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                    ),
                                                    Icon(
                                                      FFIcons.ksettings,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
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
                                                  InkWell(
                                                    onTap: () async {
                                                      context
                                                          .pushNamed('Account');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'Account');
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'v0b3xrqt' /* Account */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 24.0,
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jkjnw7x2' /* My Invoices */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'TermsConditions');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'TermsConditions');
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zmvd8kti' /* Terms and Conditions */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'PrivacyPolicy');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 24.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'PrivacyPolicy');
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'niix3bx2' /* Privacy Policy */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await EFDevGroup
                                                        .logoutUserCall
                                                        .call(
                                                      email: FFAppState()
                                                          .userEmail,
                                                    );
                                                    setState(() {
                                                      FFAppState()
                                                          .IsLoggedUser = false;
                                                      FFAppState().IsPrivate =
                                                          true;
                                                      FFAppState().AccessToken =
                                                          '';
                                                      FFAppState()
                                                          .RefreshToken = '';
                                                      FFAppState()
                                                              .TokenExpiration =
                                                          DateTime
                                                              .fromMillisecondsSinceEpoch(
                                                                  1672549200000);
                                                      FFAppState().isSubUser =
                                                          false;
                                                      FFAppState().UserId =
                                                          '00000000-0000-0000-0000-000000000000';
                                                      FFAppState().userEmail =
                                                          '';
                                                      FFAppState().companyId =
                                                          '';
                                                    });

                                                    context.goNamed('HomePage');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'w5magr8x' /* Log out */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                      ),
                                                      Icon(
                                                        FFIcons.kpower,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Text(
                                                    '${FFLocalizations.of(context).languageCode}${FFAppState().Version}',
                                                    textAlign: TextAlign.end,
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
                                                          fontSize: 13.0,
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.78,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6.0,
                                              color: Color(0x51242729),
                                              offset: Offset(1.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Column(
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            80.0,
                                                                            0.0),
                                                                child: Row(
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
                                                                        'hz5eqwjr' /* Vehicles in Garage */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).displaySmallFamily,
                                                                            fontSize:
                                                                                40.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.6,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1024.0,
                                                          maxHeight:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.7,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if ((!FFAppState().IsPrivate &&
                                                                            !FFAppState().isSubUser) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                        ))
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '35opehr8' /* Seller */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
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
                                                                            'ux6diklp' /* Brand */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                        ),
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
                                                                            'ytsadb54' /* Model */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '822akpzf' /* Body type */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
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
                                                                            'j754y7lx' /* Frame No. */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                        ),
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
                                                                            '33anfjir' /* Created */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final vehiclesGarageListW =
                                                                      getJsonField(
                                                                    rowVehiclesInGarageResponse
                                                                        .jsonBody,
                                                                    r'''$.items''',
                                                                  ).toList();
                                                                  if (vehiclesGarageListW
                                                                      .isEmpty) {
                                                                    return EmptyStateWidget();
                                                                  }
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        vehiclesGarageListW
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            vehiclesGarageListWIndex) {
                                                                      final vehiclesGarageListWItem =
                                                                          vehiclesGarageListW[
                                                                              vehiclesGarageListWIndex];
                                                                      return MouseRegionVehiclesGarageWidget(
                                                                        key: Key(
                                                                            'Keyr53_${vehiclesGarageListWIndex}_of_${vehiclesGarageListW.length}'),
                                                                        jsonVehicles:
                                                                            vehiclesGarageListWItem,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .sortPurchasedSoldModel1,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            SortPurchasedSoldWidget(
                                                          filterType: 'garage',
                                                          filterAction:
                                                              () async {
                                                            setState(() => _model
                                                                    .apiRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (functions
                                                      .stringToInt(getJsonField(
                                                    rowVehiclesInGarageResponse
                                                        .jsonBody,
                                                    r'''$.totalCount''',
                                                  ).toString()) >
                                                  0)
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '${functions.convertIntToString(_model.skipResults + 1)} - ${functions.convertIntToString((int skip, int count, int total) {
                                                                return skip +
                                                                            count >=
                                                                        total
                                                                    ? total
                                                                    : skip +
                                                                        count;
                                                              }(_model.skipResults, _model.countResults, functions.stringToInt(getJsonField(
                                                                    rowVehiclesInGarageResponse
                                                                        .jsonBody,
                                                                    r'''$.totalCount''',
                                                                  ).toString())))}',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '2drxym4g' /*  of  */,
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '${getJsonField(
                                                                rowVehiclesInGarageResponse
                                                                    .jsonBody,
                                                                r'''$.totalCount''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .first_page_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                _model.skipResults <=
                                                                        0
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.skipResults =
                                                                              0;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .chevron_left_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                _model.skipResults <=
                                                                        0
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.skipResults =
                                                                              _model.skipResults - _model.countResults;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: _model
                                                                            .skipResults +
                                                                        _model
                                                                            .countResults >=
                                                                    functions
                                                                        .stringToInt(
                                                                            getJsonField(
                                                                      rowVehiclesInGarageResponse
                                                                          .jsonBody,
                                                                      r'''$.totalCount''',
                                                                    ).toString())
                                                                ? null
                                                                : () async {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .skipResults = _model
                                                                              .skipResults +
                                                                          _model
                                                                              .countResults;
                                                                    });
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                  },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .last_page_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: _model
                                                                        .skipResults >=
                                                                    functions
                                                                        .stringToInt(
                                                                            getJsonField(
                                                                      rowVehiclesInGarageResponse
                                                                          .jsonBody,
                                                                      r'''$.totalCount''',
                                                                    ).toString())
                                                                ? null
                                                                : () async {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .skipResults = functions
                                                                              .stringToInt(getJsonField(
                                                                            rowVehiclesInGarageResponse.jsonBody,
                                                                            r'''$.totalCount''',
                                                                          ).toString()) -
                                                                          functions.stringToInt(getJsonField(
                                                                                rowVehiclesInGarageResponse.jsonBody,
                                                                                r'''$.totalCount''',
                                                                              ).toString()) %
                                                                              _model.countResults;
                                                                    });
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                  },
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
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    Expanded(
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
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
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jtn3c69k' /* Vehicles in Garage */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
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
                                                                height: 40.0,
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
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'lp15xbws' /* Brand/Model */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleSmall,
                                                                        ),
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
                                                                            'csey8yhl' /* Frame No./Created */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleSmall,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.68,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    RefreshIndicator(
                                                                  onRefresh:
                                                                      () async {
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                  },
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    physics:
                                                                        const AlwaysScrollableScrollPhysics(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final vehiclesGarageList =
                                                                                getJsonField(
                                                                              rowVehiclesInGarageResponse.jsonBody,
                                                                              r'''$.items''',
                                                                            ).toList();
                                                                            if (vehiclesGarageList.isEmpty) {
                                                                              return EmptyStateWidget();
                                                                            }
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: vehiclesGarageList.length,
                                                                              itemBuilder: (context, vehiclesGarageListIndex) {
                                                                                final vehiclesGarageListItem = vehiclesGarageList[vehiclesGarageListIndex];
                                                                                return InkWell(
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
                                                                                              height: MediaQuery.of(context).size.height * 0.35,
                                                                                              child: ActionsBSWidget(
                                                                                                vehicleId: getJsonField(
                                                                                                  vehiclesGarageListItem,
                                                                                                  r'''$.vehicleId''',
                                                                                                ).toString(),
                                                                                                isGarage: true,
                                                                                                isReauctioning: getJsonField(
                                                                                                  vehiclesGarageListItem,
                                                                                                  r'''$.isReAuctioning''',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    AutoSizeText(
                                                                                                      getJsonField(
                                                                                                        vehiclesGarageListItem,
                                                                                                        r'''$.brand''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        getJsonField(
                                                                                                          vehiclesGarageListItem,
                                                                                                          r'''$.model''',
                                                                                                        ).toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
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
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                                vehiclesGarageListItem,
                                                                                                                r'''$.frame''',
                                                                                                              ) !=
                                                                                                              null
                                                                                                          ? getJsonField(
                                                                                                              vehiclesGarageListItem,
                                                                                                              r'''$.frame''',
                                                                                                            ).toString()
                                                                                                          : FFLocalizations.of(context).getVariableText(
                                                                                                              enText: 'Frame No. not set',
                                                                                                              deText: 'Rahmennummer undefiniert',
                                                                                                              frText: 'Numéro de cadre indéfini',
                                                                                                              itText: 'Telaio n. non definito',
                                                                                                            ),
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        functions.changeDateFormat(
                                                                                                            getJsonField(
                                                                                                              vehiclesGarageListItem,
                                                                                                              r'''$.creationTime''',
                                                                                                            ).toString(),
                                                                                                            0),
                                                                                                        textAlign: TextAlign.end,
                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Divider(
                                                                                          thickness: 1.0,
                                                                                          color: Color(0x98ABABAB),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
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
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .sortPurchasedSoldModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            SortPurchasedSoldWidget(
                                                          filterType: 'garage',
                                                          filterAction:
                                                              () async {
                                                            setState(() => _model
                                                                    .apiRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (functions
                                                      .stringToInt(getJsonField(
                                                    rowVehiclesInGarageResponse
                                                        .jsonBody,
                                                    r'''$.totalCount''',
                                                  ).toString()) >
                                                  0)
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '${functions.convertIntToString(_model.skipResults + 1)} - ${functions.convertIntToString((int skip, int count, int total) {
                                                                return skip +
                                                                            count >=
                                                                        total
                                                                    ? total
                                                                    : skip +
                                                                        count;
                                                              }(_model.skipResults, _model.countResults, functions.stringToInt(getJsonField(
                                                                    rowVehiclesInGarageResponse
                                                                        .jsonBody,
                                                                    r'''$.totalCount''',
                                                                  ).toString())))}',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '4vxrymnx' /*  of  */,
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '${getJsonField(
                                                                rowVehiclesInGarageResponse
                                                                    .jsonBody,
                                                                r'''$.totalCount''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .first_page_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                _model.skipResults <=
                                                                        0
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.skipResults =
                                                                              0;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .chevron_left_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                _model.skipResults <=
                                                                        0
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.skipResults =
                                                                              _model.skipResults - _model.countResults;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: _model
                                                                            .skipResults +
                                                                        _model
                                                                            .countResults >=
                                                                    functions
                                                                        .stringToInt(
                                                                            getJsonField(
                                                                      rowVehiclesInGarageResponse
                                                                          .jsonBody,
                                                                      r'''$.totalCount''',
                                                                    ).toString())
                                                                ? null
                                                                : () async {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .skipResults = _model
                                                                              .skipResults +
                                                                          _model
                                                                              .countResults;
                                                                    });
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                  },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .last_page_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: _model
                                                                        .skipResults >=
                                                                    functions
                                                                        .stringToInt(
                                                                            getJsonField(
                                                                      rowVehiclesInGarageResponse
                                                                          .jsonBody,
                                                                      r'''$.totalCount''',
                                                                    ).toString())
                                                                ? null
                                                                : () async {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .skipResults = functions
                                                                              .stringToInt(getJsonField(
                                                                            rowVehiclesInGarageResponse.jsonBody,
                                                                            r'''$.totalCount''',
                                                                          ).toString()) -
                                                                          functions.stringToInt(getJsonField(
                                                                                rowVehiclesInGarageResponse.jsonBody,
                                                                                r'''$.totalCount''',
                                                                              ).toString()) %
                                                                              _model.countResults;
                                                                    });
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
