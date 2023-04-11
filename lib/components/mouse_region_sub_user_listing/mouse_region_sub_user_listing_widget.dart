import '/backend/api_requests/api_calls.dart';
import '/components/delete_account/delete_account_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mouse_region_sub_user_listing_model.dart';
export 'mouse_region_sub_user_listing_model.dart';

class MouseRegionSubUserListingWidget extends StatefulWidget {
  const MouseRegionSubUserListingWidget({
    Key? key,
    this.jsonSubUser,
    this.refreshAction,
  }) : super(key: key);

  final dynamic jsonSubUser;
  final Future<dynamic> Function()? refreshAction;

  @override
  _MouseRegionSubUserListingWidgetState createState() =>
      _MouseRegionSubUserListingWidgetState();
}

class _MouseRegionSubUserListingWidgetState
    extends State<MouseRegionSubUserListingWidget>
    with TickerProviderStateMixin {
  late MouseRegionSubUserListingModel _model;

  final animationsMap = {
    'mouseRegionOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -8.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1.0,
          end: 1.05,
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
    _model = createModel(context, () => MouseRegionSubUserListingModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: !_model.isSelected ? Color(0xFFF3F3F3) : Color(0x00000000),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: AutoSizeText(
                          '${getJsonField(
                            widget.jsonSubUser,
                            r'''$.firstName''',
                          ).toString()} ${getJsonField(
                            widget.jsonSubUser,
                            r'''$.lastName''',
                          ).toString()}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: AutoSizeText(
                          getJsonField(
                            widget.jsonSubUser,
                            r'''$.email''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Color(0xFF242729),
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  _model.apiResultf7d = await EFDevGroup
                                      .activateDeactivateSubuserCall
                                      .call(
                                    subUserId: getJsonField(
                                      widget.jsonSubUser,
                                      r'''$.id''',
                                    ).toString(),
                                  );
                                  await widget.refreshAction?.call();

                                  setState(() {});
                                },
                                child: Container(
                                  width: 64.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: getJsonField(
                                              widget.jsonSubUser,
                                              r'''$.isActive''',
                                            ) ==
                                            true
                                        ? Color(0xFF007D19)
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                                widget.jsonSubUser,
                                                r'''$.isActive''',
                                              ) ==
                                              true
                                          ? FFLocalizations.of(context)
                                              .getVariableText(
                                              enText: 'Active',
                                              deText: 'Aktiv',
                                              frText: 'Actif',
                                              itText: 'Attivo',
                                            )
                                          : FFLocalizations.of(context)
                                              .getVariableText(
                                              enText: 'Inactive',
                                              deText: 'Inaktiv',
                                              frText: 'Inactif',
                                              itText: 'Inattivo',
                                            ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          functions.changeDateFormat(
                              getJsonField(
                                widget.jsonSubUser,
                                r'''$.creationTime''',
                              ).toString(),
                              0),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.apiResultActivate =
                                            await EFDevGroup
                                                .activateDeactivateSubuserCall
                                                .call(
                                          subUserId: getJsonField(
                                            widget.jsonSubUser,
                                            r'''$.id''',
                                          ).toString(),
                                        );

                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.delete_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x00000000),
                                          enableDrag: false,
                                          context: context,
                                          builder: (bottomSheetContext) {
                                            return Padding(
                                              padding: MediaQuery.of(
                                                      bottomSheetContext)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0,
                                                child: DeleteAccountWidget(
                                                  userId: getJsonField(
                                                    widget.jsonSubUser,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  isSubUser: true,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        await widget.refreshAction?.call();
                                      },
                                    ),
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
              ],
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          ),
        ],
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        setState(() {
          _model.isSelected = false;
        });
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        setState(() {
          _model.isSelected = true;
        });
      }),
    ).animateOnActionTrigger(
      animationsMap['mouseRegionOnActionTriggerAnimation']!,
    );
  }
}
