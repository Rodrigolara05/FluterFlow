import '/backend/api_requests/api_calls.dart';
import '/components/actionss_sub_user_listing/actionss_sub_user_listing_widget.dart';
import '/components/empty_sub_use_listing/empty_sub_use_listing_widget.dart';
import '/components/mouse_region_sub_user_listing/mouse_region_sub_user_listing_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_user_listing_model.dart';
export 'sub_user_listing_model.dart';

class SubUserListingWidget extends StatefulWidget {
  const SubUserListingWidget({Key? key}) : super(key: key);

  @override
  _SubUserListingWidgetState createState() => _SubUserListingWidgetState();
}

class _SubUserListingWidgetState extends State<SubUserListingWidget> {
  late SubUserListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubUserListingModel());

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
                    'jtyemgy6' /* Sub user Listing */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                actions: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: FaIcon(
                        FontAwesomeIcons.userPlus,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('AddSub-User');
                      },
                    ),
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
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
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '33dmf659' /* Vehicles */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                  Icon(
                                                    FFIcons.kcarSport,
                                                    color: FlutterFlowTheme.of(
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
                                                        '0xexfxsq' /* Sold Vehicles */,
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
                                                        'swc9zo3b' /* Purchased Vehicles */,
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
                                                        'v1o8blnt' /* Vehicles in Auction */,
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
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'VehiclesInGarage');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'h3d0q7of' /* Vehicles in Garage */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
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
                                                        'wc9kxi8m' /* Favourite Vehicles */,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hhcnc1hx' /* Reminder */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.search_rounded,
                                                    color: FlutterFlowTheme.of(
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
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
                                                              '5husq4ze' /* Users management */,
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
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
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
                                                    decoration: BoxDecoration(),
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
                                                                '5r9uohta' /* Add Sub User */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                '7nebw19z' /* Sub User Listing */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8584o464' /* Settings */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                  Icon(
                                                    FFIcons.ksettings,
                                                    color: FlutterFlowTheme.of(
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
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'Account');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'y6a11vdb' /* Account */,
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
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'i6ijoi5y' /* My Invoices */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
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
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'TermsConditions');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '83ddgh83' /* Terms and Conditions */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'PrivacyPolicy');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'a1m74ua8' /* Privacy Policy */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: InkWell(
                                                onTap: () async {
                                                  await EFDevGroup
                                                      .logoutUserCall
                                                      .call(
                                                    email:
                                                        FFAppState().userEmail,
                                                  );
                                                  setState(() {
                                                    FFAppState().IsLoggedUser =
                                                        false;
                                                    FFAppState().IsPrivate =
                                                        true;
                                                    FFAppState().AccessToken =
                                                        '';
                                                    FFAppState().RefreshToken =
                                                        '';
                                                    FFAppState()
                                                            .TokenExpiration =
                                                        DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                1672549200000);
                                                    FFAppState().isSubUser =
                                                        false;
                                                    FFAppState().UserId =
                                                        '00000000-0000-0000-0000-000000000000';
                                                    FFAppState().userEmail = '';
                                                    FFAppState().companyId = '';
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
                                                        'h69ao720' /* Log out */,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: (_model
                                                      .apiRequestCompleter1 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(EFDevGroup
                                                        .listSubusersCall
                                                        .call(
                                                      userManagerId:
                                                          FFAppState().UserId,
                                                      language:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                      maxResultCount:
                                                          _model.resultCount,
                                                      skipCount:
                                                          _model.resultSkip,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnWebListSubusersResponse =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
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
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vok90smm' /* Sub User Listing */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .displaySmallFamily,
                                                                      fontSize:
                                                                          40.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).displaySmallFamily),
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Visibility(
                                                                          visible:
                                                                              responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'uiokmxpu' /* Member */,
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
                                                                      flex: 2,
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'mp75bt78' /* E-Mail */,
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
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'bkokhsex' /* Status */,
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
                                                                      flex: 2,
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '34t5xg21' /* Created */,
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listSubusers = EFDevGroup.listSubusersCall
                                                                                .subUsers(
                                                                                  columnWebListSubusersResponse.jsonBody,
                                                                                )
                                                                                ?.toList() ??
                                                                            [];
                                                                        if (listSubusers
                                                                            .isEmpty) {
                                                                          return EmptySubUseListingWidget();
                                                                        }
                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listSubusers.length,
                                                                          itemBuilder:
                                                                              (context, listSubusersIndex) {
                                                                            final listSubusersItem =
                                                                                listSubusers[listSubusersIndex];
                                                                            return wrapWithModel(
                                                                              model: _model.mouseRegionSubUserListingModels.getModel(
                                                                                getJsonField(
                                                                                  listSubusersItem,
                                                                                  r'''$.id''',
                                                                                ).toString(),
                                                                                listSubusersIndex,
                                                                              ),
                                                                              updateCallback: () => setState(() {}),
                                                                              updateOnChange: true,
                                                                              child: MouseRegionSubUserListingWidget(
                                                                                key: Key(
                                                                                  'Key2hm_${getJsonField(
                                                                                    listSubusersItem,
                                                                                    r'''$.id''',
                                                                                  ).toString()}',
                                                                                ),
                                                                                jsonSubUser: listSubusersItem,
                                                                                refreshAction: () async {
                                                                                  setState(() => _model.apiRequestCompleter1 = null);
                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                },
                                                                              ),
                                                                            );
                                                                          },
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
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Visibility(
                                                      visible:
                                                          functions.stringToInt(
                                                                  getJsonField(
                                                                columnWebListSubusersResponse
                                                                    .jsonBody,
                                                                r'''$.totalCount''',
                                                              ).toString()) >
                                                              0,
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
                                                                  text: '${functions.convertIntToString(_model.resultSkip + 1)} - ${functions.convertIntToString((int skip, int count, int total) {
                                                                    return skip +
                                                                                count >=
                                                                            total
                                                                        ? total
                                                                        : skip +
                                                                            count;
                                                                  }(_model.resultSkip, _model.resultCount, functions.stringToInt(EFDevGroup.listSubusersCall.total(
                                                                        columnWebListSubusersResponse
                                                                            .jsonBody,
                                                                      ).toString())))}',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    's1ua09lt' /*  of  */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: '${EFDevGroup.listSubusersCall.total(
                                                                        columnWebListSubusersResponse
                                                                            .jsonBody,
                                                                      ).toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .first_page_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: _model
                                                                            .resultSkip <=
                                                                        0
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.resultSkip =
                                                                              0;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter1 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted1();
                                                                      },
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_left_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: _model
                                                                            .resultSkip <=
                                                                        0
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.resultSkip =
                                                                              _model.resultSkip - _model.resultCount;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter1 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted1();
                                                                      },
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: _model.resultSkip +
                                                                            _model
                                                                                .resultCount >=
                                                                        EFDevGroup
                                                                            .listSubusersCall
                                                                            .total(
                                                                          columnWebListSubusersResponse
                                                                              .jsonBody,
                                                                        )
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model.resultSkip =
                                                                              _model.resultSkip + _model.resultCount;
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter1 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted1();
                                                                      },
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .last_page_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: _model
                                                                            .resultSkip >=
                                                                        EFDevGroup
                                                                            .listSubusersCall
                                                                            .total(
                                                                          columnWebListSubusersResponse
                                                                              .jsonBody,
                                                                        )
                                                                    ? null
                                                                    : () async {
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .resultSkip = functions.stringToInt(EFDevGroup.listSubusersCall
                                                                                  .total(
                                                                                    columnWebListSubusersResponse.jsonBody,
                                                                                  )
                                                                                  .toString()) -
                                                                              (functions.stringToInt(EFDevGroup.listSubusersCall
                                                                                      .total(
                                                                                        columnWebListSubusersResponse.jsonBody,
                                                                                      )
                                                                                      .toString()) %
                                                                                  _model.resultCount);
                                                                        });
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter1 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted1();
                                                                      },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
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
                                if (responsiveVisibility(
                                  context: context,
                                  desktop: false,
                                ))
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: (_model
                                                      .apiRequestCompleter2 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(EFDevGroup
                                                        .listSubusersCall
                                                        .call(
                                                      userManagerId:
                                                          FFAppState().UserId,
                                                      language:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                      maxResultCount:
                                                          _model.resultCount,
                                                      skipCount:
                                                          _model.resultSkip,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnListSubusersResponse =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                  ),
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
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
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
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vpoxm39t' /* Member / E-Mail */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                  ),
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
                                                                      'plw2qbox' /* Status / Created */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.75,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final subUsersList = EFDevGroup
                                                                        .listSubusersCall
                                                                        .subUsers(
                                                                          columnListSubusersResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList() ??
                                                                    [];
                                                                if (subUsersList
                                                                    .isEmpty) {
                                                                  return EmptySubUseListingWidget();
                                                                }
                                                                return RefreshIndicator(
                                                                  onRefresh:
                                                                      () async {
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter2 =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted2();
                                                                  },
                                                                  child: ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        subUsersList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            subUsersListIndex) {
                                                                      final subUsersListItem =
                                                                          subUsersList[
                                                                              subUsersListIndex];
                                                                      return InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          if (MediaQuery.of(context).size.width <
                                                                              480.0) {
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
                                                                                      height: MediaQuery.of(context).size.height * 0.24,
                                                                                      child: ActionssSubUserListingWidget(
                                                                                        userId: getJsonField(
                                                                                          subUsersListItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        isSubUser: true,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            Navigator.pop(context);
                                                                            setState(() =>
                                                                                _model.apiRequestCompleter2 = null);
                                                                            await _model.waitForApiRequestCompleted2();
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            '${getJsonField(
                                                                                              subUsersListItem,
                                                                                              r'''$.firstName''',
                                                                                            ).toString()} ${getJsonField(
                                                                                              subUsersListItem,
                                                                                              r'''$.lastName''',
                                                                                            ).toString()}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                subUsersListItem,
                                                                                                r'''$.email''',
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
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              _model.apiResultActivateM = await EFDevGroup.activateDeactivateSubuserCall.call(
                                                                                                subUserId: getJsonField(
                                                                                                  subUsersListItem,
                                                                                                  r'''$.id''',
                                                                                                ).toString(),
                                                                                              );
                                                                                              setState(() => _model.apiRequestCompleter2 = null);
                                                                                              await _model.waitForApiRequestCompleted2();

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 64.0,
                                                                                              height: 24.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: getJsonField(
                                                                                                          subUsersListItem,
                                                                                                          r'''$.isActive''',
                                                                                                        ) ==
                                                                                                        true
                                                                                                    ? Color(0xFF0E9594)
                                                                                                    : FlutterFlowTheme.of(context).secondary,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                            subUsersListItem,
                                                                                                            r'''$.isActive''',
                                                                                                          ) ==
                                                                                                          true
                                                                                                      ? FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Active',
                                                                                                          deText: 'Aktiv',
                                                                                                          frText: 'Actif',
                                                                                                          itText: 'Attivo',
                                                                                                        )
                                                                                                      : FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Inactive',
                                                                                                          deText: 'Inaktiv',
                                                                                                          frText: 'Inactif',
                                                                                                          itText: 'Inattivo',
                                                                                                        ),
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              functions.changeDateFormat(
                                                                                                  getJsonField(
                                                                                                    subUsersListItem,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Container(
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
                                                                text: '${functions.convertIntToString(_model.resultSkip + 1)} - ${functions.convertIntToString((int skip, int count, int total) {
                                                                  return skip +
                                                                              count >=
                                                                          total
                                                                      ? total
                                                                      : skip +
                                                                          count;
                                                                }(_model.resultSkip, _model.resultCount, functions.stringToInt(EFDevGroup.listSubusersCall.total(
                                                                      columnListSubusersResponse
                                                                          .jsonBody,
                                                                    ).toString())))}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0aiw8fcq' /*  of  */,
                                                                ),
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text: '${EFDevGroup.listSubusersCall.total(
                                                                      columnListSubusersResponse
                                                                          .jsonBody,
                                                                    ).toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              borderRadius:
                                                                  30.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .first_page_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  _model.resultSkip <=
                                                                          0
                                                                      ? null
                                                                      : () async {
                                                                          setState(
                                                                              () {
                                                                            _model.resultSkip =
                                                                                0;
                                                                          });
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter2 = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted2();
                                                                        },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_left_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  _model.resultSkip <=
                                                                          0
                                                                      ? null
                                                                      : () async {
                                                                          setState(
                                                                              () {
                                                                            _model.resultSkip =
                                                                                _model.resultSkip - _model.resultCount;
                                                                          });
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter2 = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted2();
                                                                        },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_right_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: _model
                                                                              .resultSkip +
                                                                          _model
                                                                              .resultCount >=
                                                                      EFDevGroup
                                                                          .listSubusersCall
                                                                          .total(
                                                                        columnListSubusersResponse
                                                                            .jsonBody,
                                                                      )
                                                                  ? null
                                                                  : () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .resultSkip = _model
                                                                                .resultSkip +
                                                                            _model.resultCount;
                                                                      });
                                                                      setState(() =>
                                                                          _model.apiRequestCompleter2 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .last_page_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: _model
                                                                          .resultSkip >=
                                                                      EFDevGroup
                                                                          .listSubusersCall
                                                                          .total(
                                                                        columnListSubusersResponse
                                                                            .jsonBody,
                                                                      )
                                                                  ? null
                                                                  : () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .resultSkip = functions.stringToInt(EFDevGroup.listSubusersCall
                                                                                .total(
                                                                                  columnListSubusersResponse.jsonBody,
                                                                                )
                                                                                .toString()) -
                                                                            (functions.stringToInt(EFDevGroup.listSubusersCall
                                                                                    .total(
                                                                                      columnListSubusersResponse.jsonBody,
                                                                                    )
                                                                                    .toString()) %
                                                                                _model.resultCount);
                                                                      });
                                                                      setState(() =>
                                                                          _model.apiRequestCompleter2 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    },
                                                            ),
                                                          ],
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
    );
  }
}
