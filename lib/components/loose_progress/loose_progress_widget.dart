import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loose_progress_model.dart';
export 'loose_progress_model.dart';

class LooseProgressWidget extends StatefulWidget {
  const LooseProgressWidget({
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
  _LooseProgressWidgetState createState() => _LooseProgressWidgetState();
}

class _LooseProgressWidgetState extends State<LooseProgressWidget> {
  late LooseProgressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LooseProgressModel());

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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    valueOrDefault<String>(
                      FFLocalizations.of(context).getVariableText(
                        enText: 'Are you sure you want to leave?',
                        deText: 'Bist du sicher dass du gehen willst?',
                        frText: 'Êtes-vous sûr de vouloir quitter?',
                        itText: 'Sei sicuro di voler partire?',
                      ),
                      'Bist du sicher dass du gehen willst?',
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    FFLocalizations.of(context).getVariableText(
                      enText: 'You\'ll lose your progress.',
                      deText: 'Du verlierst deinen Fortschritt.',
                      frText: 'Vous perdrez votre progression.',
                      itText: 'Perderai i tuoi progressi.',
                    ),
                    'Du verlierst deinen Fortschritt.',
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
                          context.pushNamed('RegisterCar_method');
                        },
                        text: valueOrDefault<String>(
                          FFLocalizations.of(context).getVariableText(
                            enText: 'Leave',
                            deText: 'Verlassen',
                            frText: 'Partir',
                            itText: 'Partire',
                          ),
                          'Verlassen',
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
