import '/components/binding_bid/binding_bid_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bid_mobile_model.dart';
export 'bid_mobile_model.dart';

class BidMobileWidget extends StatefulWidget {
  const BidMobileWidget({
    Key? key,
    this.soldPrice,
    this.minPrice,
    this.minStepBid,
    this.buyNow,
    this.vehicleId,
    this.auctionId,
    this.transportCost,
    this.fee,
    this.hasTransportCost,
  }) : super(key: key);

  final double? soldPrice;
  final double? minPrice;
  final double? minStepBid;
  final double? buyNow;
  final String? vehicleId;
  final String? auctionId;
  final double? transportCost;
  final double? fee;
  final bool? hasTransportCost;

  @override
  _BidMobileWidgetState createState() => _BidMobileWidgetState();
}

class _BidMobileWidgetState extends State<BidMobileWidget> {
  late BidMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BidMobileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.incrementBid = functions.getIncrementBid(
            functions.stringToDouble(_model.dropDownIncrementValue!),
            widget.soldPrice! > 0.0 ? widget.soldPrice! : widget.minPrice!);
      });
    });

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
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '15px7qq4' /* Your Bid */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'p1tfvgc2' /* Select Bid Amount */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownIncrementController ??=
                                FormFieldController<String>(
                              _model.dropDownIncrementValue ??=
                                  widget.soldPrice! > 0.0
                                      ? functions
                                          .getNewIncrement(
                                              widget.soldPrice!,
                                              widget.minStepBid! > 0.0
                                                  ? widget.minStepBid!
                                                  : 50.0)
                                          .toString()
                                      : widget.minPrice?.toString(),
                            ),
                            options: functions
                                .generatePriceList(
                                    widget.soldPrice! > 0.0
                                        ? widget.soldPrice!
                                        : widget.minPrice!,
                                    widget.minStepBid!,
                                    5,
                                    widget.buyNow!,
                                    widget.soldPrice == 0.0)
                                .toList(),
                            onChanged: (val) async {
                              setState(
                                  () => _model.dropDownIncrementValue = val);
                              setState(() {
                                _model.incrementBid = functions.getIncrementBid(
                                    functions.stringToDouble(
                                        _model.dropDownIncrementValue!),
                                    widget.soldPrice! > 0.0
                                        ? widget.soldPrice!
                                        : widget.minPrice!);
                              });
                            },
                            width: double.infinity,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            fillColor: Colors.white,
                            elevation: 2.0,
                            borderColor: Color(0x66ABABAB),
                            borderWidth: 1.5,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                          ),
                        ),
                        if (_model.dropDownIncrementValue != null &&
                            _model.dropDownIncrementValue != '')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zdy848bk' /* Increment of CHF */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  functions.formatNumberThousand(
                                      _model.incrementBid),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (bottomSheetContext) {
                          return Padding(
                            padding:
                                MediaQuery.of(bottomSheetContext).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 1.0,
                              child: BindingBidWidget(
                                price: functions.stringToDouble(
                                    _model.dropDownIncrementValue!),
                                vehicleId: widget.vehicleId,
                                auctionId: widget.auctionId,
                                isBuyNow: false,
                                transportCost: widget.transportCost,
                                fee: widget.fee,
                                hasTransportCost: widget.hasTransportCost,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));

                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'b64ai2bi' /* Place a Bid */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
