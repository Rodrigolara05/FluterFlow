import '/backend/api_requests/api_calls.dart';
import '/components/car_card/car_card_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/home_emptystate/home_emptystate_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => _model.apiRequestCompleter2 = null);
      await _model.waitForApiRequestCompleted2();
    });

    _model.textFieldMinPriceController ??= TextEditingController();
    _model.textFieldMaxPriceController ??= TextEditingController();
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
          backgroundColor: Color(0xFF0E9594),
          elevation: 8.0,
          child: Icon(
            Icons.chat,
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 24.0,
          ),
        ),
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
                                  'ktsr762z' /* HOME */,
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
                                  'ysqgtn7m' /* HOW IT WORKS */,
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
                                  '5jn7gq3a' /* ADD VEHICLE */,
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
                                  '2s07wc61' /* CONTACT US */,
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
                                'pbk2efaw' /* Vehicles */,
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
                                  'isqnhyai' /* Vehicles Sold */,
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
                                  'r32zv2su' /* Vehicles Purchased */,
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
                                  'wbsog5b1' /* Vehicles in Auction */,
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
                                  'acjgz894' /* Vehicles in Garage */,
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
                                  'gvjdqhr0' /* My Favourite Vehicles */,
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
                                'krh6na1c' /* Saved searches */,
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
                                'iopt6g83' /* My saved search */,
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
                                        'xrf70zmn' /* Sub Users */,
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
                                          'efq16swp' /* Add Sub User */,
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
                                          'laz2pf7l' /* Sub User Listing */,
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
                                's642bj8k' /* Settings */,
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
                                  'thec1wik' /* Account */,
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
                                'bfdq3v4x' /* My invoices */,
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
                                  'jwk9sn9d' /* Terms and Conditions */,
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
                                  '1fhr7y8q' /* Privacy Policy */,
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
                              'xyonsprl' /* Login / Registration */,
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
                              'dub5uqm1' /* Logout */,
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
          child: Container(
            decoration: BoxDecoration(),
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() => _model.apiRequestCompleter2 = null);
                await _model.waitForApiRequestCompleted2();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 467.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Image.asset(
                                  'assets/images/fondo_hero.jpg',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    constraints: BoxConstraints(
                                      maxWidth: 1100.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Divider(
                                            height: 80.0,
                                            thickness: 0.0,
                                          ),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 396.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'hrr65ww9' /* Your auction platform for vehi... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 32.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'c2filngo' /* For companies in Switzerland */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 1100.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        desktop: false,
                                      ))
                                        Divider(
                                          height: 160.0,
                                          thickness: 0.0,
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Divider(
                                          height: 80.0,
                                          thickness: 0.0,
                                        ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: EFDevGroup.vehicleBrandsCall
                                                .call(
                                              language:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 35.0,
                                                    height: 35.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final searchformVehicleBrandsResponse =
                                                  snapshot.data!;
                                              return Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
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
                                                              'vzxavnjf' /* Main popup */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
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
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Wrap(
                                                              spacing: 8.0,
                                                              runSpacing: 8.0,
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
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width >=
                                                                          500.0
                                                                      ? 276.0
                                                                      : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.dropDownBrandController ??=
                                                                              FormFieldController<String>(
                                                                            _model.dropDownBrandValue ??=
                                                                                '',
                                                                          ),
                                                                          options: (EFDevGroup.vehicleBrandsCall.brandIds(
                                                                            searchformVehicleBrandsResponse.jsonBody,
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()!
                                                                              .map((e) => e.toString())
                                                                              .toList()
                                                                              .toList(),
                                                                          optionLabels: (EFDevGroup.vehicleBrandsCall.brandNames(
                                                                            searchformVehicleBrandsResponse.jsonBody,
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()!
                                                                              .map((e) => e.toString())
                                                                              .toList()
                                                                              .toList(),
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.dropDownBrandValue = val);
                                                                            setState(() {
                                                                              _model.isLoading = true;
                                                                            });
                                                                            if (_model.dropDownBrandValue != null &&
                                                                                _model.dropDownBrandValue != '') {
                                                                              setState(() => _model.apiRequestCompleter1 = null);
                                                                              await _model.waitForApiRequestCompleted1(minWait: 1000);
                                                                            }
                                                                            setState(() {
                                                                              _model.isLoading = false;
                                                                            });
                                                                            setState(() {
                                                                              _model.minYearModel = 0;
                                                                              _model.minYearMin = 0;
                                                                              _model.minYearMax = 0;
                                                                              _model.jsonModels = null;
                                                                            });
                                                                          },
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'u77d4uyg' /* Select Brand */,
                                                                          ),
                                                                          fillColor:
                                                                              Colors.white,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              Color(0xFFB9B9B9),
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
                                                                          isSearchable:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: EFDevGroup
                                                                              .regionsListCall
                                                                              .call(),
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
                                                                            final dropDownRegionRegionsListResponse =
                                                                                snapshot.data!;
                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownRegionController ??= FormFieldController<String>(
                                                                                _model.dropDownRegionValue ??= '',
                                                                              ),
                                                                              options: (EFDevGroup.regionsListCall.regionCodes(
                                                                                dropDownRegionRegionsListResponse.jsonBody,
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()!
                                                                                  .map((e) => e.toString())
                                                                                  .toList()
                                                                                  .toList(),
                                                                              optionLabels: (EFDevGroup.regionsListCall.regionNames(
                                                                                dropDownRegionRegionsListResponse.jsonBody,
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()!
                                                                                  .map((e) => e.toString())
                                                                                  .toList()
                                                                                  .toList(),
                                                                              onChanged: (val) => setState(() => _model.dropDownRegionValue = val),
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '0n60sw82' /* Select Region */,
                                                                              ),
                                                                              fillColor: Colors.white,
                                                                              elevation: 2.0,
                                                                              borderColor: Color(0xFFB9B9B9),
                                                                              borderWidth: 1.5,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: EFDevGroup
                                                                              .passengerTypesListCall
                                                                              .call(
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
                                                                            final dropDownPassengerPassengerTypesListResponse =
                                                                                snapshot.data!;
                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownPassengerController ??= FormFieldController<String>(null),
                                                                              options: (EFDevGroup.passengerTypesListCall.typeIds(
                                                                                dropDownPassengerPassengerTypesListResponse.jsonBody,
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()!
                                                                                  .map((e) => e.toString())
                                                                                  .toList()
                                                                                  .toList(),
                                                                              optionLabels: (EFDevGroup.passengerTypesListCall.typeDescriptions(
                                                                                dropDownPassengerPassengerTypesListResponse.jsonBody,
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()!
                                                                                  .map((e) => e.toString())
                                                                                  .toList()
                                                                                  .toList(),
                                                                              onChanged: (val) => setState(() => _model.dropDownPassengerValue = val),
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'dd346ur7' /* Passenger Car */,
                                                                              ),
                                                                              fillColor: Colors.white,
                                                                              elevation: 2.0,
                                                                              borderColor: Color(0xFFB9B9B9),
                                                                              borderWidth: 1.5,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: EFDevGroup
                                                                            .fuelListCall
                                                                            .call(
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
                                                                          final dropDownFuelFuelListResponse =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              int>(
                                                                            controller: _model.dropDownFuelController ??=
                                                                                FormFieldController<int>(
                                                                              _model.dropDownFuelValue ??= 0,
                                                                            ),
                                                                            options: functions
                                                                                .dynamicListToListInt(EFDevGroup.fuelListCall
                                                                                    .fuelCodes(
                                                                                      dropDownFuelFuelListResponse.jsonBody,
                                                                                    )!
                                                                                    .toList())!
                                                                                .toList(),
                                                                            optionLabels: (EFDevGroup.fuelListCall.fuelTexts(
                                                                              dropDownFuelFuelListResponse.jsonBody,
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .map((e) => e.toString())
                                                                                .toList()
                                                                                .toList(),
                                                                            onChanged: (val) =>
                                                                                setState(() => _model.dropDownFuelValue = val),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '00kdvise' /* Select Fuel */,
                                                                            ),
                                                                            fillColor:
                                                                                Colors.white,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0xFFB9B9B9),
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
                                                                            isSearchable:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width >=
                                                                          500.0
                                                                      ? 276.0
                                                                      : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: (_model.apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                                                                                ..complete(EFDevGroup.vehicleModelsByBrandIdCall.call(
                                                                                  language: FFLocalizations.of(context).languageCode,
                                                                                  brandId: _model.dropDownBrandValue,
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
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            final dropDownModelVehicleModelsByBrandIdResponse =
                                                                                snapshot.data!;
                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownModelController ??= FormFieldController<String>(
                                                                                _model.dropDownModelValue ??= '',
                                                                              ),
                                                                              options: (_model.dropDownBrandValue != null && _model.dropDownBrandValue != '') && dropDownModelVehicleModelsByBrandIdResponse.succeeded
                                                                                  ? (EFDevGroup.vehicleModelsByBrandIdCall.brandIds(
                                                                                      dropDownModelVehicleModelsByBrandIdResponse.jsonBody,
                                                                                    ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()!
                                                                                      .map((e) => e.toString())
                                                                                      .toList()
                                                                                  : ['0'].toList(),
                                                                              optionLabels: (_model.dropDownBrandValue != null && _model.dropDownBrandValue != '') && dropDownModelVehicleModelsByBrandIdResponse.succeeded
                                                                                  ? (EFDevGroup.vehicleModelsByBrandIdCall.modelNames(
                                                                                      dropDownModelVehicleModelsByBrandIdResponse.jsonBody,
                                                                                    ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()!
                                                                                  : [''].toList(),
                                                                              onChanged: (val) async {
                                                                                setState(() => _model.dropDownModelValue = val);
                                                                                setState(() {
                                                                                  _model.jsonModels = dropDownModelVehicleModelsByBrandIdResponse.jsonBody;
                                                                                });
                                                                                setState(() {
                                                                                  _model.minYearModel = functions.stringToInt(functions.getMinYearFromModel(_model.jsonModels!, _model.dropDownModelValue!));
                                                                                });
                                                                              },
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'us865c87' /* Select Model */,
                                                                              ),
                                                                              fillColor: Colors.white,
                                                                              elevation: 2.0,
                                                                              borderColor: Color(0xFFB9B9B9),
                                                                              borderWidth: 1.5,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              disabled: _model.isLoading || (_model.dropDownBrandValue == null || _model.dropDownBrandValue == ''),
                                                                              isSearchable: false,
                                                                            );
                                                                          },
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
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.dropDownMinYearController ??= FormFieldController<String>(null),
                                                                                  options: functions.generateYearList(_model.minYearModel, 0, _model.minYearMax).toList(),
                                                                                  onChanged: (val) async {
                                                                                    setState(() => _model.dropDownMinYearValue = val);
                                                                                    setState(() {
                                                                                      _model.minYearMin = functions.stringToInt(_model.dropDownMinYearValue);
                                                                                    });
                                                                                  },
                                                                                  width: 180.0,
                                                                                  height: 40.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'w2v3n71z' /* Min Year */,
                                                                                  ),
                                                                                  fillColor: Colors.white,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Color(0xFFB9B9B9),
                                                                                  borderWidth: 1.5,
                                                                                  borderRadius: 8.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                  hidesUnderline: true,
                                                                                  isSearchable: false,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.dropDownMaxYearController ??= FormFieldController<String>(null),
                                                                                  options: functions.generateYearList(_model.minYearModel, _model.minYearMin, 0).toList(),
                                                                                  onChanged: (val) async {
                                                                                    setState(() => _model.dropDownMaxYearValue = val);
                                                                                    setState(() {
                                                                                      _model.minYearMax = functions.stringToInt(_model.dropDownMaxYearValue);
                                                                                    });
                                                                                  },
                                                                                  width: 180.0,
                                                                                  height: 40.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'gujq56ab' /* Max Year */,
                                                                                  ),
                                                                                  fillColor: Colors.white,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Color(0xFFB9B9B9),
                                                                                  borderWidth: 1.5,
                                                                                  borderRadius: 8.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                  hidesUnderline: true,
                                                                                  isSearchable: false,
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
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: EFDevGroup
                                                                              .commercialTypesListCall
                                                                              .call(
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
                                                                            final dropDownCommercialCommercialTypesListResponse =
                                                                                snapshot.data!;
                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownCommercialController ??= FormFieldController<String>(
                                                                                _model.dropDownCommercialValue ??= '',
                                                                              ),
                                                                              options: (EFDevGroup.commercialTypesListCall.typeIds(
                                                                                dropDownCommercialCommercialTypesListResponse.jsonBody,
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()!
                                                                                  .map((e) => e.toString())
                                                                                  .toList()
                                                                                  .toList(),
                                                                              optionLabels: (EFDevGroup.commercialTypesListCall.typeDescriptions(
                                                                                dropDownCommercialCommercialTypesListResponse.jsonBody,
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()!
                                                                                  .map((e) => e.toString())
                                                                                  .toList()
                                                                                  .toList(),
                                                                              onChanged: (val) => setState(() => _model.dropDownCommercialValue = val),
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                's8rlfy2w' /* Commercial Car */,
                                                                              ),
                                                                              fillColor: Colors.white,
                                                                              elevation: 2.0,
                                                                              borderColor: Color(0xFFB9B9B9),
                                                                              borderWidth: 1.5,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.textFieldMinPriceController,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    isDense: true,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      '5ds73cbs' /* Min Price */,
                                                                                    ),
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: Color(0xFFB9B9B9),
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  keyboardType: TextInputType.number,
                                                                                  validator: _model.textFieldMinPriceControllerValidator.asValidator(context),
                                                                                  inputFormatters: [
                                                                                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.textFieldMaxPriceController,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    isDense: true,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'kcdzex2f' /* Max Price */,
                                                                                    ),
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: Color(0xFFB9B9B9),
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  keyboardType: TextInputType.number,
                                                                                  validator: _model.textFieldMaxPriceControllerValidator.asValidator(context),
                                                                                  inputFormatters: [
                                                                                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
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
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            if ((_model.textFieldMinPriceController.text !=
                                                                            null &&
                                                                        _model.textFieldMinPriceController.text !=
                                                                            '') &&
                                                                    (_model.textFieldMaxPriceController.text !=
                                                                            null &&
                                                                        _model.textFieldMaxPriceController.text !=
                                                                            '')
                                                                ? (functions.stringToDouble(_model
                                                                        .textFieldMinPriceController
                                                                        .text) <
                                                                    functions.stringToDouble(_model
                                                                        .textFieldMaxPriceController
                                                                        .text))
                                                                : true) {
                                                              setState(() {
                                                                FFAppState()
                                                                    .searchBrand = '';
                                                                FFAppState()
                                                                    .searchModel = '';
                                                                FFAppState()
                                                                    .searchFuel = '';
                                                                FFAppState()
                                                                    .searchMinYear = _model.dropDownMinYearValue !=
                                                                            null &&
                                                                        _model.dropDownMinYearValue !=
                                                                            ''
                                                                    ? functions
                                                                        .stringToInt(
                                                                            _model.dropDownMinYearValue)
                                                                    : 0;
                                                                FFAppState()
                                                                    .searchMaxYear = _model.textFieldMaxPriceController.text !=
                                                                            null &&
                                                                        _model.textFieldMaxPriceController.text !=
                                                                            ''
                                                                    ? functions
                                                                        .stringToInt(
                                                                            _model.dropDownMaxYearValue)
                                                                    : 0;
                                                                FFAppState()
                                                                    .searchPassenger = [];
                                                                FFAppState()
                                                                    .searchCommercial = [];
                                                                FFAppState()
                                                                    .searchMinPrice = 0;
                                                                FFAppState()
                                                                    .searchMaxPrice = 0;
                                                                FFAppState()
                                                                    .searchRegion = [];
                                                              });
                                                              setState(() {
                                                                FFAppState()
                                                                    .searchBrand = _model.dropDownBrandValue !=
                                                                            null &&
                                                                        _model.dropDownBrandValue !=
                                                                            ''
                                                                    ? _model
                                                                        .dropDownBrandValue!
                                                                    : '';
                                                                FFAppState()
                                                                    .searchModel = _model.dropDownModelValue !=
                                                                            null &&
                                                                        _model.dropDownModelValue !=
                                                                            ''
                                                                    ? _model
                                                                        .dropDownModelValue!
                                                                    : '';
                                                                FFAppState()
                                                                    .searchFuel = _model
                                                                            .dropDownFuelValue! >
                                                                        0
                                                                    ? functions
                                                                        .convertIntToString(
                                                                            _model.dropDownFuelValue!)
                                                                    : '';
                                                                FFAppState()
                                                                        .searchMinPrice =
                                                                    functions.stringToInt(_model
                                                                        .textFieldMinPriceController
                                                                        .text);
                                                                FFAppState()
                                                                        .searchMaxPrice =
                                                                    functions.stringToInt(_model
                                                                        .textFieldMaxPriceController
                                                                        .text);
                                                              });
                                                              if (_model.dropDownRegionValue !=
                                                                      null &&
                                                                  _model.dropDownRegionValue !=
                                                                      '') {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .addToSearchRegion(
                                                                          _model
                                                                              .dropDownRegionValue!);
                                                                });
                                                              }
                                                              if (_model.dropDownPassengerValue !=
                                                                      null &&
                                                                  _model.dropDownPassengerValue !=
                                                                      '') {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .addToSearchPassenger(
                                                                          _model
                                                                              .dropDownPassengerValue!);
                                                                });
                                                              }
                                                              if (_model.dropDownCommercialValue !=
                                                                      null &&
                                                                  _model.dropDownCommercialValue !=
                                                                      '') {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .addToSearchCommercial(
                                                                          _model
                                                                              .dropDownCommercialValue!);
                                                                });
                                                              }

                                                              context.pushNamed(
                                                                  'ActiveAuctions');
                                                            } else {
                                                              await actions
                                                                  .snackbarAction(
                                                                context,
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      'Minimum price cannot be greater than maximum price',
                                                                  deText:
                                                                      'Der Mindestpreis kann nicht höher sein als der Höchstpreis',
                                                                  frText:
                                                                      'Le prix minimum ne peut pas être supérieur au prix maximum',
                                                                  itText:
                                                                      'Il prezzo minimo non può essere superiore al prezzo massimo',
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ms7zm2k4' /* Search */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
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
                                                            color: Color(
                                                                0xFFC5181D),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            hoverColor: Color(
                                                                0xFFF3F3F3),
                                                            hoverBorderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            hoverElevation:
                                                                10.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
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
                    InkWell(
                      onTap: () async {
                        setState(() {
                          FFAppState().ShowMenu = false;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 1100.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 48.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FutureBuilder<ApiCallResponse>(
                                                future: (_model
                                                            .apiRequestCompleter2 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(EFDevGroup
                                                              .listFilterActiveAuctionsCall
                                                              .call(
                                                            language:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                            typeDescription: FFAppState()
                                                                            .filterSortType !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .filterSortType !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .filterSortType
                                                                : 'All vehicles',
                                                            sortDescription: FFAppState()
                                                                            .filterSortSortBy !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .filterSortSortBy !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .filterSortSortBy
                                                                : 'Recent',
                                                            isFavorite: FFAppState()
                                                                .filterSortFavorite,
                                                            hasBuyNowPrice:
                                                                FFAppState()
                                                                    .filterSortBuyNow,
                                                            userId: FFAppState()
                                                                            .UserId !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .UserId !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .UserId
                                                                : '00000000-0000-0000-0000-000000000000',
                                                            maxResultCount: 10,
                                                            skipCount: 0,
                                                            regionCodesList:
                                                                FFAppState()
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
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final listViewAuctionsListFilterActiveAuctionsResponse =
                                                      snapshot.data!;
                                                  return Builder(
                                                    builder: (context) {
                                                      final activeAuctionsList =
                                                          functions
                                                              .verifyNullList(
                                                                  getJsonField(
                                                                listViewAuctionsListFilterActiveAuctionsResponse
                                                                    .jsonBody,
                                                                r'''$.items''',
                                                              ))
                                                              .toList()
                                                              .take(10)
                                                              .toList();
                                                      if (activeAuctionsList
                                                          .isEmpty) {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              HomeEmptystateWidget(),
                                                        );
                                                      }
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            activeAuctionsList
                                                                .length,
                                                        itemBuilder: (context,
                                                            activeAuctionsListIndex) {
                                                          final activeAuctionsListItem =
                                                              activeAuctionsList[
                                                                  activeAuctionsListIndex];
                                                          return InkWell(
                                                            onTap: () async {
                                                              if (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width >=
                                                                  480.0) {
                                                                context
                                                                    .pushNamed(
                                                                  'VehicleDetail',
                                                                  queryParams: {
                                                                    'vehicleId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        activeAuctionsListItem,
                                                                        r'''$.vehicleId''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'auctionId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        activeAuctionsListItem,
                                                                        r'''$.auctionId''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'VehicleDetailMobile',
                                                                  queryParams: {
                                                                    'vehicleId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        activeAuctionsListItem,
                                                                        r'''$.vehicleId''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'auctionId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        activeAuctionsListItem,
                                                                        r'''$.auctionId''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                setState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                              }
                                                            },
                                                            child:
                                                                CarCardWidget(
                                                              key: Key(
                                                                  'Keyxx7_${activeAuctionsListIndex}_of_${activeAuctionsList.length}'),
                                                              jsonVehicleData:
                                                                  activeAuctionsListItem,
                                                              netxAction:
                                                                  () async {
                                                                setState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 200.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      setState(() {
                                                        FFAppState()
                                                            .searchBrand = '';
                                                        FFAppState()
                                                            .searchModel = '';
                                                        FFAppState()
                                                            .searchFuel = '';
                                                        FFAppState()
                                                            .searchMinYear = _model
                                                                        .dropDownMinYearValue !=
                                                                    null &&
                                                                _model.dropDownMinYearValue !=
                                                                    ''
                                                            ? functions
                                                                .stringToInt(_model
                                                                    .dropDownMinYearValue)
                                                            : 0;
                                                        FFAppState()
                                                            .searchMaxYear = _model
                                                                        .textFieldMaxPriceController
                                                                        .text !=
                                                                    null &&
                                                                _model.textFieldMaxPriceController
                                                                        .text !=
                                                                    ''
                                                            ? functions
                                                                .stringToInt(_model
                                                                    .dropDownMaxYearValue)
                                                            : 0;
                                                        FFAppState()
                                                            .searchPassenger = [];
                                                        FFAppState()
                                                            .searchCommercial = [];
                                                        FFAppState()
                                                            .searchMinPrice = 0;
                                                        FFAppState()
                                                            .searchMaxPrice = 0;
                                                        FFAppState()
                                                            .searchRegion = [];
                                                      });

                                                      context.pushNamed(
                                                          'ActiveAuctions');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'l7kbnpqh' /* See All */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -0.61),
                                          child: InkWell(
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().ShowMenu = true;
                                              });
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'llh8griw' /* Results */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    setState(() => _model
                                                            .apiRequestCompleter2 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted2();
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.filterModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: FilterWidget(
                                                      filterAction: () async {
                                                        setState(() => _model
                                                                .apiRequestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted2();
                                                      },
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Container(
                          width: 140.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/ri_instagram-fill.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/bi_linkedin.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/ri_whatsapp-fill.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
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
        ),
      ),
    );
  }
}
