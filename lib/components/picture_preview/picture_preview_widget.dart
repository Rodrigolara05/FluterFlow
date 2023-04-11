import '/components/delete_pictures/delete_pictures_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'picture_preview_model.dart';
export 'picture_preview_model.dart';

class PicturePreviewWidget extends StatefulWidget {
  const PicturePreviewWidget({
    Key? key,
    this.imagePath,
    this.imageLocation,
    this.imageId,
    this.imageName,
    this.vehicleId,
  }) : super(key: key);

  final String? imagePath;
  final int? imageLocation;
  final String? imageId;
  final String? imageName;
  final String? vehicleId;

  @override
  _PicturePreviewWidgetState createState() => _PicturePreviewWidgetState();
}

class _PicturePreviewWidgetState extends State<PicturePreviewWidget> {
  late PicturePreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PicturePreviewModel());

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
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              constraints: BoxConstraints(
                maxWidth: 600.0,
                maxHeight:
                    MediaQuery.of(context).size.width >= 500.0 ? 450.0 : 350.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ecb865c0' /* Title */,
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Image.network(
                      widget.imagePath!,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x00000000),
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (bottomSheetContext) {
                            return Padding(
                              padding:
                                  MediaQuery.of(bottomSheetContext).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: DeletePicturesWidget(
                                  imageLocation: widget.imageLocation,
                                  imageName: widget.imageName,
                                  vehicleId: widget.vehicleId,
                                  imageId: widget.imageId,
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: FFLocalizations.of(context).getText(
                        'hxtx60nw' /* Delete */,
                      ),
                      options: FFButtonOptions(
                        width: 160.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFC5181D),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
