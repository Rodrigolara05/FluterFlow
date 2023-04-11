import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_model.dart';
export 'filter_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key? key,
    this.filterAction,
  }) : super(key: key);

  final Future<dynamic> Function()? filterAction;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget>
    with TickerProviderStateMixin {
  late FilterModel _model;

  var hasContainerTriggered = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                  child: InkWell(
                    onTap: () async {
                      if (_model.isClosed) {
                        setState(() {
                          _model.isClosed = false;
                        });
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          setState(() => hasContainerTriggered = true);
                          SchedulerBinding.instance.addPostFrameCallback(
                              (_) async => await animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0));
                        }
                      } else {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap[
                                  'containerOnActionTriggerAnimation']!
                              .controller
                              .reverse();
                        }
                        setState(() {
                          _model.isClosed = true;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: Icon(
                              Icons.sort_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '9brdjb4x' /* Filter */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!_model.isClosed)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: 260.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (FFAppState().IsLoggedUser)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'agvmcu7u' /* Visibility */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxRegionValue ??=
                                          FFAppState()
                                                  .filterSortRegionCode
                                                  .length >
                                              0,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .checkboxRegionValue = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'z5k5enrp' /* Region */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              if (_model.checkboxRegionValue ?? true)
                                FutureBuilder<ApiCallResponse>(
                                  future: EFDevGroup.regionsListCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    final dropDownRegionRegionsListResponse =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownRegionController ??=
                                              FormFieldController<String>(
                                        _model.dropDownRegionValue ??= '',
                                      ),
                                      options: (getJsonField(
                                        dropDownRegionRegionsListResponse
                                            .jsonBody,
                                        r'''$.items[:].regionCode''',
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()!
                                          .toList(),
                                      optionLabels: (getJsonField(
                                        dropDownRegionRegionsListResponse
                                            .jsonBody,
                                        r'''$.items[:].regionName''',
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()!
                                          .toList(),
                                      onChanged: (val) => setState(() =>
                                          _model.dropDownRegionValue = val),
                                      width: double.infinity,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Colors.black,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '0wrkjw76' /* Select region... */,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .borderColor,
                                      borderWidth: 1.5,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                    );
                                  },
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxFavoriteValue ??=
                                          FFAppState().filterSortFavorite !=
                                                  null
                                              ? FFAppState().filterSortFavorite
                                              : false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .checkboxFavoriteValue = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'fbzd01ob' /* My Favourites */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxBuyNowValue ??=
                                          FFAppState().filterSortBuyNow != null
                                              ? FFAppState().filterSortBuyNow
                                              : false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .checkboxBuyNowValue = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '9feyc8d1' /* Buy Now Price */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'jo7o2696' /* Type */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                              FlutterFlowRadioButton(
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '1uz35tbm' /* All vehicles */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'tku3q38h' /* My Bids */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'u60vzfs3' /* My Auctions */,
                                  )
                                ].toList(),
                                onChanged: (val) => setState(() {}),
                                controller: _model.radioButtonController1 ??=
                                    FormFieldController<String>(
                                        FFAppState().filterSortType != null &&
                                                FFAppState().filterSortType !=
                                                    ''
                                            ? FFAppState().filterSortType
                                            : 'All vehicles'),
                                optionHeight: 25.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.vertical,
                                radioButtonColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                            ],
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zodxjfyf' /* Sort */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                        FlutterFlowRadioButton(
                          options: [
                            FFLocalizations.of(context).getText(
                              'wzu1jrs0' /* Recent */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qa6cnwju' /* Brand A-Z */,
                            ),
                            FFLocalizations.of(context).getText(
                              'wcb5lsbh' /* Brand Z-A */,
                            ),
                            FFLocalizations.of(context).getText(
                              'wcavra79' /* New-Old Year */,
                            ),
                            FFLocalizations.of(context).getText(
                              'peqie4t7' /* Old-New Year */,
                            ),
                            FFLocalizations.of(context).getText(
                              '7ubrgek5' /* Low-High Price */,
                            ),
                            FFLocalizations.of(context).getText(
                              'yomvppdn' /* High-Low Price */,
                            ),
                            FFLocalizations.of(context).getText(
                              'mdtjgmbx' /* Low-High Mileage */,
                            ),
                            FFLocalizations.of(context).getText(
                              'zorgtjvr' /* High-Low Mileage */,
                            ),
                            FFLocalizations.of(context).getText(
                              'kx2mbmrb' /* Mechanics */,
                            ),
                            FFLocalizations.of(context).getText(
                              'u72lclek' /* Lowest remaining time */,
                            )
                          ].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonController2 ??=
                              FormFieldController<String>(
                                  FFAppState().filterSortSortBy != null &&
                                          FFAppState().filterSortSortBy != ''
                                      ? FFAppState().filterSortSortBy
                                      : 'Recent'),
                          optionHeight: 25.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().filterSortRegionCode = [];
                              FFAppState().filterSortFavorite = false;
                              FFAppState().filterSortBuyNow = false;
                              FFAppState().filterSortType = '';
                              FFAppState().filterSortSortBy = '';
                              if (FFAppState().IsLoggedUser) {
                                FFAppState().update(() {
                                  FFAppState().filterSortFavorite =
                                      _model.checkboxFavoriteValue!;
                                  FFAppState().filterSortBuyNow =
                                      _model.checkboxBuyNowValue!;
                                  FFAppState().filterSortType =
                                      _model.radioButtonValue1 != null &&
                                              _model.radioButtonValue1 != ''
                                          ? _model.radioButtonValue1!
                                          : 'All vehicles';
                                  FFAppState().filterSortSortBy =
                                      _model.radioButtonValue2 != null &&
                                              _model.radioButtonValue2 != ''
                                          ? _model.radioButtonValue2!
                                          : 'Recent';
                                });
                                if ((_model.dropDownRegionValue != null &&
                                        _model.dropDownRegionValue != '') &&
                                    _model.checkboxRegionValue!) {
                                  setState(() {
                                    FFAppState().addToFilterSortRegionCode(
                                        _model.dropDownRegionValue!);
                                  });
                                }
                              } else {
                                FFAppState().update(() {
                                  FFAppState().filterSortSortBy =
                                      _model.radioButtonValue2 != null &&
                                              _model.radioButtonValue2 != ''
                                          ? _model.radioButtonValue2!
                                          : 'Recent';
                                });
                              }

                              await widget.filterAction?.call();
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                await animationsMap[
                                        'containerOnActionTriggerAnimation']!
                                    .controller
                                    .reverse();
                              }
                              setState(() {
                                _model.isClosed = true;
                              });
                            },
                            text: FFLocalizations.of(context).getText(
                              'uw59hxcl' /* Save */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                      ],
                    ),
                  ),
                ),
              ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation']!,
                  hasBeenTriggered: hasContainerTriggered),
            ),
        ],
      ),
    );
  }
}
