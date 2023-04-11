import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_account_model.dart';
export 'delete_account_model.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({
    Key? key,
    this.userId,
    this.isSubUser,
  }) : super(key: key);

  final String? userId;
  final bool? isSubUser;

  @override
  _DeleteAccountWidgetState createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<DeleteAccountWidget> {
  late DeleteAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width >= 500.0 ? 500.0 : 390.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Delete Account?',
                                deText: 'Konto löschen?',
                                frText: 'Supprimer le compte?',
                                itText: 'Eliminare l\'account?',
                              ),
                              'Konto löschen?',
                            ),
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getVariableText(
                        enText:
                            'This action can\'t be undone. You\'ll lose all the account information.',
                        deText:
                            'Diese Aktion kann nicht rückgängig gemacht werden. Sie verlieren alle Kontoinformationen.',
                        frText:
                            'Cette action ne peut pas être annulée. Vous perdrez toutes les informations du compte.',
                        itText:
                            'Questa azione non può essere annullata. Perderai tutte le informazioni sull\'account.',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Cancel',
                                    deText: 'Stornieren',
                                    frText: 'Annuler',
                                    itText: 'Annulla',
                                  ),
                                  'Stornieren',
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
                                  _model.apiResultDeleteAccount =
                                      await EFDevGroup.deleteAccountCall.call(
                                    userId: widget.userId,
                                    language: FFLocalizations.of(context)
                                        .languageCode,
                                  );
                                  if (EFDevGroup.deleteAccountCall.isDeleted(
                                        (_model.apiResultDeleteAccount
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      true) {
                                    if (!widget.isSubUser!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            EFDevGroup.deleteAccountCall
                                                .message(
                                                  (_model.apiResultDeleteAccount
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                      setState(() {
                                        FFAppState().IsLoggedUser = false;
                                        FFAppState().UserId =
                                            '00000000-0000-0000-0000-000000000000';
                                        FFAppState().AccessToken = '';
                                        FFAppState().RefreshToken = '';
                                        FFAppState().isSubUser = false;
                                        FFAppState().userEmail = '';
                                        FFAppState().companyId = '';
                                        FFAppState().firstName = '';
                                        FFAppState().lastName = '';
                                      });

                                      context.goNamed('HomePage');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            EFDevGroup.deleteAccountCall
                                                .message(
                                                  (_model.apiResultDeleteAccount
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          EFDevGroup.deleteAccountCall
                                              .message(
                                                (_model.apiResultDeleteAccount
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  }

                                  setState(() {});
                                },
                                text: valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Delete',
                                    deText: 'Löschen',
                                    frText: 'Supprimer',
                                    itText: 'Eliminare',
                                  ),
                                  'Löschen',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
