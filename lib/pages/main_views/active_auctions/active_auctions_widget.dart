import '/backend/api_requests/api_calls.dart';
import '/components/car_card/car_card_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'active_auctions_model.dart';
export 'active_auctions_model.dart';

class ActiveAuctionsWidget extends StatefulWidget {
  const ActiveAuctionsWidget({Key? key}) : super(key: key);

  @override
  _ActiveAuctionsWidgetState createState() => _ActiveAuctionsWidgetState();
}

class _ActiveAuctionsWidgetState extends State<ActiveAuctionsWidget> {
  late ActiveAuctionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveAuctionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFLocalizations.of(context).languageCode != 'en') &&
          (FFLocalizations.of(context).languageCode != 'de') &&
          (FFLocalizations.of(context).languageCode != 'fr') &&
          (FFLocalizations.of(context).languageCode != 'it')) {
        setAppLanguage(context, 'en');
      }
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _model.main?.animateTo(
              0,
              duration: Duration(milliseconds: 100),
              curve: Curves.ease,
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          elevation: 8.0,
          child: Icon(
            Icons.keyboard_arrow_up_rounded,
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 24.0,
          ),
        ),
        endDrawer: Drawer(
          elevation: 16.0,
          child: SingleChildScrollView(
            controller: _model.columnController,
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
                                  'c4ij9riz' /* HOME */,
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
                                  'fqh4irfq' /* HOW IT WORKS */,
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
                                  'pu95fpat' /* ADD VEHICLE */,
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
                                  'sqpuc632' /* CONTACT US */,
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
                                '5gk7un9z' /* Vehicles */,
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
                                  'ng4ds913' /* Vehicles Sold */,
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
                                  'dhpuya94' /* Vehicles Purchased */,
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
                                  '77ixxac5' /* Vehicles in Auction */,
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
                                  'dbzvugoz' /* Vehicles in Garage */,
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
                                  '77zu63xm' /* My Favourite Vehicles */,
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
                                '4yvdg4sg' /* Saved searches */,
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
                                '88wzlom7' /* My saved search */,
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
                                        'auvrja0e' /* Sub Users */,
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
                                          'pd5wl8dr' /* Add Sub User */,
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
                                          'lzig523z' /* Sub User Listing */,
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
                                'xtr5v725' /* Settings */,
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
                                  'ecrmmkqz' /* Account */,
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
                                'w6p5rpmc' /* My invoices */,
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
                    controller: _model.profile,
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
                                  'hu9gifiw' /* Terms and Conditions */,
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
                                  'tkwy7cct' /* Privacy Policy */,
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
                              '59w9txyj' /* Login / Registration */,
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
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '97l074vy' /* Logout */,
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
        appBar: MediaQuery.of(context).size.width <= 500.0
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
                    context.goNamed('HomePage');
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '0ia0i92d' /* Active Auctions */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              controller: _model.main,
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 40.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                context.pushNamed('HomePage');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'rtmqxcj0' /* Home */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '1z0cq1f9' /* Active auctions */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1100.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'hjud64m6' /* Results */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(EFDevGroup
                                              .listFilterActiveAuctionsCall
                                              .call(
                                            language:
                                                FFLocalizations.of(context)
                                                    .languageCode,
                                            userId: FFAppState().UserId !=
                                                        null &&
                                                    FFAppState().UserId != ''
                                                ? FFAppState().UserId
                                                : '00000000-0000-0000-0000-000000000000',
                                            typeDescription: FFAppState()
                                                            .filterSortType !=
                                                        null &&
                                                    FFAppState()
                                                            .filterSortType !=
                                                        ''
                                                ? FFAppState().filterSortType
                                                : 'All vehicles',
                                            sortDescription: FFAppState()
                                                            .filterSortSortBy !=
                                                        null &&
                                                    FFAppState()
                                                            .filterSortSortBy !=
                                                        ''
                                                ? FFAppState().filterSortSortBy
                                                : 'Recent',
                                            isFavorite:
                                                FFAppState().filterSortFavorite,
                                            hasBuyNowPrice:
                                                FFAppState().filterSortBuyNow,
                                            maxResultCount: 50,
                                            skipCount: 0,
                                            searchBrand:
                                                FFAppState().searchBrand,
                                            searchModel:
                                                FFAppState().searchModel,
                                            searchFuel: FFAppState().searchFuel,
                                            searchMinYear:
                                                FFAppState().searchMinYear > 0
                                                    ? FFAppState().searchMinYear
                                                    : null,
                                            searchMaxYear:
                                                FFAppState().searchMaxYear > 0
                                                    ? FFAppState().searchMaxYear
                                                    : null,
                                            searchMinPrice:
                                                (FFAppState().searchMinPrice > 0
                                                        ? FFAppState()
                                                            .searchMinPrice
                                                        : null)
                                                    ?.toDouble(),
                                            searchMaxPrice:
                                                (FFAppState().searchMaxPrice > 0
                                                        ? FFAppState()
                                                            .searchMaxPrice
                                                        : null)
                                                    ?.toDouble(),
                                            searchPassengerList:
                                                FFAppState().searchPassenger,
                                            searchCommercialList:
                                                FFAppState().searchCommercial,
                                            searchRegionList:
                                                FFAppState().searchRegion,
                                            regionCodesList: FFAppState()
                                                .filterSortRegionCode,
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
                                  final listViewListFilterActiveAuctionsResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final vehicleDataList = getJsonField(
                                        listViewListFilterActiveAuctionsResponse
                                            .jsonBody,
                                        r'''$.items''',
                                      ).toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: vehicleDataList.length,
                                        itemBuilder:
                                            (context, vehicleDataListIndex) {
                                          final vehicleDataListItem =
                                              vehicleDataList[
                                                  vehicleDataListIndex];
                                          return InkWell(
                                            onTap: () async {
                                              if (MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  480.0) {
                                                context.pushNamed(
                                                  'VehicleDetail',
                                                  queryParams: {
                                                    'vehicleId': serializeParam(
                                                      getJsonField(
                                                        vehicleDataListItem,
                                                        r'''$.vehicleId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'auctionId': serializeParam(
                                                      getJsonField(
                                                        vehicleDataListItem,
                                                        r'''$.auctionId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'VehicleDetailMobile',
                                                  queryParams: {
                                                    'vehicleId': serializeParam(
                                                      getJsonField(
                                                        vehicleDataListItem,
                                                        r'''$.vehicleId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'auctionId': serializeParam(
                                                      getJsonField(
                                                        vehicleDataListItem,
                                                        r'''$.auctionId''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: CarCardWidget(
                                              key: Key(
                                                  'Keyvp9_${vehicleDataListIndex}_of_${vehicleDataList.length}'),
                                              jsonVehicleData:
                                                  vehicleDataListItem,
                                              netxAction: () async {
                                                setState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                              },
                                            ),
                                          );
                                        },
                                        controller: _model.listViewController,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.41),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: wrapWithModel(
                              model: _model.filterModel,
                              updateCallback: () => setState(() {}),
                              child: FilterWidget(
                                filterAction: () async {
                                  setState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
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
        ),
      ),
    );
  }
}
