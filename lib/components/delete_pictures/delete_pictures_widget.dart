import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_pictures_model.dart';
export 'delete_pictures_model.dart';

class DeletePicturesWidget extends StatefulWidget {
  const DeletePicturesWidget({
    Key? key,
    this.imageLocation,
    this.imageName,
    this.vehicleId,
    this.imageId,
  }) : super(key: key);

  final int? imageLocation;
  final String? imageName;
  final String? vehicleId;
  final String? imageId;

  @override
  _DeletePicturesWidgetState createState() => _DeletePicturesWidgetState();
}

class _DeletePicturesWidgetState extends State<DeletePicturesWidget> {
  late DeletePicturesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletePicturesModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    valueOrDefault<String>(
                      FFLocalizations.of(context).getVariableText(
                        enText: 'Are you sure you want to delete?',
                        deText: 'Sind Sie sicher, dass Sie löschen möchten?',
                        frText: 'Etes-vous sûr que vous voulez supprimer?',
                        itText: 'Sei sicuro di voler eliminare?',
                      ),
                      'Sind Sie sicher, dass Sie löschen möchten?',
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    FFLocalizations.of(context).getVariableText(
                      enText: 'This action can\'t be undone.',
                      deText:
                          'Diese Aktion kann nicht rückgängig gemacht werden.',
                      frText: 'Cette action ne peut pas être annulée.',
                      itText: 'Questa azione non può essere annullata.',
                    ),
                    'Diese Aktion kann nicht rückgängig gemacht werden.',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
            child: Container(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResultDelete =
                              await actions.deleteFileFromAzure(
                            FFAppState().BlobConnectionString,
                            widget.imageName!,
                            widget.imageLocation!,
                            widget.vehicleId!,
                          );
                          if (_model.apiResultDelete == null ||
                              _model.apiResultDelete == '') {
                            _model.apiResultm5a =
                                await EFDevGroup.deleteImageCall.call(
                              imageId: widget.imageId,
                            );
                            if ((_model.apiResultm5a?.succeeded ?? true)) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiResultm5a?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(_model.apiResultDelete!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
          ),
        ],
      ),
    );
  }
}
