import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_web_model.dart';
export 'profile_web_model.dart';

class ProfileWebWidget extends StatefulWidget {
  const ProfileWebWidget({Key? key}) : super(key: key);

  @override
  _ProfileWebWidgetState createState() => _ProfileWebWidgetState();
}

class _ProfileWebWidgetState extends State<ProfileWebWidget> {
  late ProfileWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileWebModel());

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

    return InkWell(
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.8, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 68.0, 0.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: 240.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'b8w2sqi9' /* Vehicles */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        color: FlutterFlowTheme.of(context)
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('VehiclesSold');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            't21lqvie' /* Sold Vehicles */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('VehiclesPurchased');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'gbeeck1x' /* Purchased Vehicles */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
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
                                          context
                                              .pushNamed('VehiclesInAuction');

                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jwx915fq' /* Vehicles in Auction */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('VehiclesInGarage');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'm7o1piv6' /* Vehicles in Garage */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('VehiclesFavourites');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'lmnjrno0' /* Favourite Vehicles */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'oduvcgzs' /* Reminders */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.bell,
                                        color: FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'jxxh2hip' /* Users management */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              FaIcon(
                                                FontAwesomeIcons.user,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                context
                                                    .pushNamed('AddSub-User');

                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 24.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jfypt1gw' /* Add Sub User */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                    'Sub-userListing');

                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 24.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dp11o7n5' /* Sub User Listing */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'nmuzv02c' /* Settings */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        color: FlutterFlowTheme.of(context)
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
                                    Container(
                                      width: double.infinity,
                                      height: 24.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '1n42uwy0' /* Profile */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('Account');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '92pv32fo' /* Account */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                    Container(
                                      width: double.infinity,
                                      height: 24.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3bdk6ur5' /* My Invoices */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('TermsConditions');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kmfl6i82' /* Terms and Conditions */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('PrivacyPolicy');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '091g7a1n' /* Privacy Policy */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
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

                                    context.pushNamed('HomePage');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8gpp18fm' /* Log out */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          FFIcons.kpower,
                                          color: FlutterFlowTheme.of(context)
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Text(
                                      '${FFLocalizations.of(context).getVariableText(
                                        enText: 'Version ',
                                        deText: 'Version ',
                                        frText: 'Version ',
                                        itText: 'Versione ',
                                      )}${FFAppState().Version}',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
