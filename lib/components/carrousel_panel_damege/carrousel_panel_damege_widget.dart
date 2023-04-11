import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carrousel_panel_damege_model.dart';
export 'carrousel_panel_damege_model.dart';

class CarrouselPanelDamegeWidget extends StatefulWidget {
  const CarrouselPanelDamegeWidget({
    Key? key,
    this.imgNum,
    this.vehicleId,
  }) : super(key: key);

  final int? imgNum;
  final String? vehicleId;

  @override
  _CarrouselPanelDamegeWidgetState createState() =>
      _CarrouselPanelDamegeWidgetState();
}

class _CarrouselPanelDamegeWidgetState
    extends State<CarrouselPanelDamegeWidget> {
  late CarrouselPanelDamegeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarrouselPanelDamegeModel());

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
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 350.0,
                constraints: BoxConstraints(
                  maxWidth: 603.0,
                  maxHeight: 402.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FutureBuilder<ApiCallResponse>(
                        future: EFDevGroup.getDamagedVehicleImagesCall.call(
                          vehicleId: widget.vehicleId,
                          language: FFLocalizations.of(context).languageCode,
                        ),
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
                          final carouselWidgetGetDamagedVehicleImagesResponse =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: 300.0,
                            child: custom_widgets.CarouselWidget(
                              width: double.infinity,
                              height: 300.0,
                              baseURL: FFAppState().BaseFilePath,
                              vehicleId: widget.vehicleId!,
                              location: 1,
                              jsonMenuItems: getJsonField(
                                carouselWidgetGetDamagedVehicleImagesResponse
                                    .jsonBody,
                                r'''$.items''',
                              ),
                              imagePosition: widget.imgNum!,
                            ),
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
    );
  }
}
