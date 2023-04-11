import '/backend/api_requests/api_calls.dart';
import '/components/start_auction/start_auction_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'actions_b_s_model.dart';
export 'actions_b_s_model.dart';

class ActionsBSWidget extends StatefulWidget {
  const ActionsBSWidget({
    Key? key,
    this.vehicleId,
    this.isGarage,
    this.auctionId,
    this.isReauctioning,
  }) : super(key: key);

  final String? vehicleId;
  final bool? isGarage;
  final String? auctionId;
  final bool? isReauctioning;

  @override
  _ActionsBSWidgetState createState() => _ActionsBSWidgetState();
}

class _ActionsBSWidgetState extends State<ActionsBSWidget> {
  late ActionsBSModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionsBSModel());

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'iritv0cf' /* Actions */,
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
          if (!widget.isGarage! || widget.isReauctioning!)
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    if (widget.isGarage!) {
                      setState(() {
                        FFAppState().NewVehicleId = widget.vehicleId!;
                      });

                      context.pushNamed('Preview');
                    } else {
                      context.pushNamed(
                        'VehicleDetailMobile',
                        queryParams: {
                          'vehicleId': serializeParam(
                            widget.vehicleId,
                            ParamType.String,
                          ),
                          'auctionId': serializeParam(
                            widget.auctionId,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    }

                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'cjidykrq' /* Details */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.isGarage ?? true)
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    if (widget.isGarage!) {
                      setState(() {
                        FFAppState().NewVehicleId = widget.vehicleId!;
                      });
                      _model.apiResultInfo2 =
                          await EFDevGroup.vehicleInfoStepTwoCall.call(
                        vehicleId: widget.vehicleId,
                        language: FFLocalizations.of(context).languageCode,
                      );
                      if ((_model.apiResultInfo2?.succeeded ?? true)) {
                        context.pushNamed(
                          'RegisterCar_step2',
                          queryParams: {
                            'editRegister': serializeParam(
                              (_model.apiResultInfo2?.jsonBody ?? ''),
                              ParamType.JSON,
                            ),
                          }.withoutNulls,
                        );
                      }
                    }
                    Navigator.pop(context);

                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Icon(
                          Icons.edit_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'oycqbrc3' /* Edit Vehicle */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.isGarage! && widget.isReauctioning!)
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      enableDrag: false,
                      context: context,
                      builder: (bottomSheetContext) {
                        return Padding(
                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 1.0,
                            child: StartAuctionWidget(
                              vehicleId: widget.vehicleId,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));

                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'tb103mu6' /* Reauction vehicle */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!widget.isGarage!)
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Icon(
                        Icons.picture_as_pdf_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'xocouizy' /* Get invoice */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          if (!widget.isGarage!)
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Icon(
                        Icons.person_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'zmjke772' /* Get user info */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 48.0,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: Icon(
                      Icons.delete_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'kastor75' /* Delete Vehicle */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
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
