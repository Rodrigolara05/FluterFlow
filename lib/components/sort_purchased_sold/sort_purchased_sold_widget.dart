import '/flutter_flow/flutter_flow_animations.dart';
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
import 'sort_purchased_sold_model.dart';
export 'sort_purchased_sold_model.dart';

class SortPurchasedSoldWidget extends StatefulWidget {
  const SortPurchasedSoldWidget({
    Key? key,
    this.filterAction,
    this.filterType,
  }) : super(key: key);

  final Future<dynamic> Function()? filterAction;
  final String? filterType;

  @override
  _SortPurchasedSoldWidgetState createState() =>
      _SortPurchasedSoldWidgetState();
}

class _SortPurchasedSoldWidgetState extends State<SortPurchasedSoldWidget>
    with TickerProviderStateMixin {
  late SortPurchasedSoldModel _model;

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
    _model = createModel(context, () => SortPurchasedSoldModel());

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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
                                'er49xxln' /* Sort */,
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
          ),
          if (!_model.isClosed)
            Material(
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'h51ocvru' /* Sort */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                      ),
                      Stack(
                        children: [
                          if ((widget.filterType == 'purchased') &&
                              (FFAppState().IsPrivate ||
                                  FFAppState().isSubUser))
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  's85sq76l' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '37x4r86s' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '3vzw10oa' /* Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ovrcnho4' /* Price */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'es4awjkm' /* To pay */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'oli2a5p4' /* Pending */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'tbif1phj' /* Paid */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller:
                                  _model.radioButtonPurchasedController ??=
                                      FormFieldController<String>(
                                          FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                          if ((widget.filterType == 'purchased') &&
                              !(FFAppState().IsPrivate ||
                                  FFAppState().isSubUser))
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  'q63m083u' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'pds00ihm' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'jc0n6oue' /* Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'nc09zs7x' /* Price */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'v1kf4ti6' /* To pay */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wkc8mnlw' /* Pending */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '304ekszl' /* Paid */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'di2u8wj0' /* Members */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller:
                                  _model.radioButtonPurchasedProController ??=
                                      FormFieldController<String>(
                                          FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                          if ((widget.filterType == 'sold') &&
                              (FFAppState().IsPrivate ||
                                  FFAppState().isSubUser))
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  'hgjqb719' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dly8lqsi' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6n996lxe' /* Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'gqyqama0' /* Price */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fiidqyrw' /* Waiting */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'izri6tsj' /* Completed */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonSoldController ??=
                                  FormFieldController<String>(
                                      FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                          if ((widget.filterType == 'sold') &&
                              !(FFAppState().IsPrivate ||
                                  FFAppState().isSubUser))
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  '5b21b4ky' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'e5edi5qv' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'b2tu0eoy' /* Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'qbwct6ji' /* Price */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'g2b6jab9' /* Waiting */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'lcwympw3' /* Completed */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8q2g4kg4' /* Members */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller:
                                  _model.radioButtonSoldProController ??=
                                      FormFieldController<String>(
                                          FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                          if ((widget.filterType == 'auction') &&
                              (FFAppState().IsPrivate ||
                                  FFAppState().isSubUser))
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  'q7m9idba' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ngiohuvm' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6s30ul7o' /* Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'c43bs2of' /* Price */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'o1mos38v' /* Remaining Time */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller:
                                  _model.radioButtonAuctionController ??=
                                      FormFieldController<String>(
                                          FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                          if ((widget.filterType == 'auction') &&
                              !(FFAppState().IsPrivate ||
                                  FFAppState().isSubUser))
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  '5xm2tu0i' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'g0uhychx' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ib7f72vo' /* Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8roplnih' /* Price */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'kulegqfe' /* Remaining Time */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'pu14spyr' /* Members */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller:
                                  _model.radioButtonAuctionProController ??=
                                      FormFieldController<String>(
                                          FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                          if (widget.filterType == 'garage')
                            FlutterFlowRadioButton(
                              options: [
                                FFLocalizations.of(context).getText(
                                  '94dlhrmu' /* Created */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'x7minkrv' /* Brand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ik6yzypa' /* Model */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8kz3bt4z' /* Body Type */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'cawz2wkf' /* Frame */,
                                )
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonGarageController ??=
                                  FormFieldController<String>(
                                      FFAppState().filterDescriptionLists),
                              optionHeight: 25.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
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
                      Divider(
                        thickness: 1.0,
                      ),
                      FlutterFlowRadioButton(
                        options: [
                          FFLocalizations.of(context).getText(
                            'yveeyxqf' /* Ascending */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4wpjtw8x' /* Descending */,
                          )
                        ].toList(),
                        onChanged: (val) => setState(() {}),
                        controller: _model.radioButtonController ??=
                            FormFieldController<String>(FFAppState()
                                    .filterSortDescLists
                                ? FFLocalizations.of(context).getVariableText(
                                    enText: 'Descending',
                                    deText: 'Absteigend',
                                    frText: 'Descendant',
                                    itText: 'Discendente',
                                  )
                                : FFLocalizations.of(context).getVariableText(
                                    enText: 'Ascending',
                                    deText: 'Aufsteigend',
                                    frText: 'Ascendant',
                                    itText: 'Ascendente',
                                  )),
                        optionHeight: 25.0,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        selectedTextStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              FFAppState().filterDescriptionLists = '';
                              FFAppState().filterSortDescLists = _model
                                      .radioButtonValue ==
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Descending',
                                    deText: 'Absteigend',
                                    frText: 'Descendant',
                                    itText: 'Discendente',
                                  );
                            });
                            if (FFAppState().IsPrivate ||
                                FFAppState().isSubUser) {
                              setState(() {
                                FFAppState().filterDescriptionLists = () {
                                  if (widget.filterType == 'purchased') {
                                    return _model.radioButtonPurchasedValue!;
                                  } else if (widget.filterType == 'sold') {
                                    return _model.radioButtonSoldValue!;
                                  } else if (widget.filterType == 'auction') {
                                    return _model.radioButtonAuctionValue!;
                                  } else {
                                    return _model.radioButtonGarageValue!;
                                  }
                                }();
                                FFAppState().filterSortDescLists = _model
                                        .radioButtonValue ==
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Descending',
                                      deText: 'Absteigend',
                                      frText: 'Descendant',
                                      itText: 'Discendente',
                                    );
                              });
                            } else {
                              setState(() {
                                FFAppState().filterDescriptionLists = () {
                                  if (widget.filterType == 'purchased') {
                                    return _model.radioButtonPurchasedProValue!;
                                  } else if (widget.filterType == 'sold') {
                                    return _model.radioButtonSoldProValue!;
                                  } else if (widget.filterType == 'auction') {
                                    return _model.radioButtonAuctionProValue!;
                                  } else {
                                    return _model.radioButtonGarageValue!;
                                  }
                                }();
                                FFAppState().filterSortDescLists = _model
                                        .radioButtonValue ==
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Descending',
                                      deText: 'Absteigend',
                                      frText: 'Descendant',
                                      itText: 'Discendente',
                                    );
                              });
                            }

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
                            await widget.filterAction?.call();
                          },
                          text: FFLocalizations.of(context).getText(
                            '99idayja' /* Apply */,
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
                                      .containsKey(FlutterFlowTheme.of(context)
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
        ],
      ),
    );
  }
}
