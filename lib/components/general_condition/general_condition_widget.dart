import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'general_condition_model.dart';
export 'general_condition_model.dart';

class GeneralConditionWidget extends StatefulWidget {
  const GeneralConditionWidget({
    Key? key,
    this.jsonPreview,
    bool? isPreview,
  })  : this.isPreview = isPreview ?? false,
        super(key: key);

  final dynamic jsonPreview;
  final bool isPreview;

  @override
  _GeneralConditionWidgetState createState() => _GeneralConditionWidgetState();
}

class _GeneralConditionWidgetState extends State<GeneralConditionWidget> {
  late GeneralConditionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralConditionModel());

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
          Material(
            color: Colors.transparent,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              width: 396.0,
              height: 285.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'mszz8zav' /* General Condition */,
                                ),
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).borderColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? getJsonField(
                                          widget.jsonPreview,
                                          r'''$.generallyGoodCondition''',
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isGoodCondition''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'src5enla' /* Generally good condition */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? valueOrDefault<bool>(
                                          getJsonField(
                                            widget.jsonPreview,
                                            r'''$.isVariousTracesOfUse''',
                                          ),
                                          false,
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isVariousTraces''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'eji4625y' /* Various trace of use */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? valueOrDefault<bool>(
                                          getJsonField(
                                            widget.jsonPreview,
                                            r'''$.isInvolvedAccident''',
                                          ),
                                          false,
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isInvolvedAccident''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'w5ts31yt' /* Vehicle involved in accident */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? valueOrDefault<bool>(
                                          getJsonField(
                                            widget.jsonPreview,
                                            r'''$.isDogowner''',
                                          ),
                                          false,
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isDogowner''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'njtss2z9' /* Dog owner */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? valueOrDefault<bool>(
                                          getJsonField(
                                            widget.jsonPreview,
                                            r'''$.isSmoker''',
                                          ),
                                          false,
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isSmoker''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'y74v7hyg' /* Smoker's Vehicle */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? valueOrDefault<bool>(
                                          getJsonField(
                                            widget.jsonPreview,
                                            r'''$.isDamagebyhail''',
                                          ),
                                          false,
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isDamagebyhail''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'fyiryzem' /* Damage by hail */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  widget.isPreview
                                      ? valueOrDefault<bool>(
                                          getJsonField(
                                            widget.jsonPreview,
                                            r'''$.isExportedCar''',
                                          ),
                                          false,
                                        )
                                      : getJsonField(
                                          widget.jsonPreview,
                                          r'''$.vehicleInfo.vehicleData.isExportedCar''',
                                        ),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9ed079yu' /* Exported car */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
          ),
        ],
      ),
    );
  }
}
