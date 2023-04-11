import '/backend/api_requests/api_calls.dart';
import '/components/loose_progress/loose_progress_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_car_step4_model.dart';
export 'register_car_step4_model.dart';

class RegisterCarStep4Widget extends StatefulWidget {
  const RegisterCarStep4Widget({
    Key? key,
    this.editRegister,
    this.withBack,
  }) : super(key: key);

  final dynamic editRegister;
  final bool? withBack;

  @override
  _RegisterCarStep4WidgetState createState() => _RegisterCarStep4WidgetState();
}

class _RegisterCarStep4WidgetState extends State<RegisterCarStep4Widget> {
  late RegisterCarStep4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterCarStep4Model());

    _model.textFieldMinPriceController ??= TextEditingController(
        text: widget.editRegister != null
            ? functions.convertDoubleToString(
                getJsonField(
                  widget.editRegister,
                  r'''$.minPrice''',
                ),
                0)
            : '');
    _model.textFieldTransportCostController ??= TextEditingController(
        text: widget.editRegister != null
            ? functions.convertDoubleToString(
                getJsonField(
                  widget.editRegister,
                  r'''$.transportCost''',
                ),
                0)
            : '');
    _model.textFieldBuyPriceController ??= TextEditingController(
        text: widget.editRegister != null
            ? functions.convertDoubleToString(
                getJsonField(
                  widget.editRegister,
                  r'''$.buyNowPrice''',
                ),
                0)
            : '');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: valueOrDefault<bool>(
          MediaQuery.of(context).size.width <= 500.0 ? true : false,
          false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'vot44bod' /* Add Vehicle */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                actions: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (widget.editRegister != null) {
                        context.pop();
                      } else {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x00000000),
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (bottomSheetContext) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_unfocusNode),
                              child: Padding(
                                padding: MediaQuery.of(bottomSheetContext)
                                    .viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  child: LooseProgressWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      }
                    },
                  ),
                ],
                centerTitle: true,
                elevation: 4.0,
              )
            : null,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 18.0, 32.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 3.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFABABAB),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 18.0, 32.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 18.0, 32.0, 0.0),
                                  child: Container(
                                    width: 200.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 380.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCheckCircle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sde52ur6' /* Data */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCheckCircle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gghxbmv1' /* Details */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCheckCircle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ev4qsgs2' /* Attachments */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 32.0,
                                                  icon: Icon(
                                                    FFIcons
                                                        .kclarityCoinBagSolid,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vrnxzvra' /* Auction */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 8.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 808.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fj0s9jfu' /* STEP 4 OF 4 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'abhmidzg' /* Auction Details */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            width: isWeb ? 244.0 : 500.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dbbhj80r' /* Minimum Price */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 8.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .textFieldMinPriceController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFB9B9B9),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    keyboardType:
                                                        const TextInputType
                                                                .numberWithOptions(
                                                            signed: true,
                                                            decimal: true),
                                                    validator: _model
                                                        .textFieldMinPriceControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(RegExp(
                                                              '\\d*\\.?\\d*'))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        500.0
                                                    ? 504.0
                                                    : 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fytldugv' /* To be transported by the */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: EFDevGroup
                                                            .transportationTypesCall
                                                            .call(
                                                          language:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 35.0,
                                                                height: 35.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final dropDownTransportedByTransportationTypesResponse =
                                                              snapshot.data!;
                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .dropDownTransportedByController ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model
                                                                  .dropDownTransportedByValue ??= widget
                                                                          .editRegister !=
                                                                      null
                                                                  ? getJsonField(
                                                                      widget
                                                                          .editRegister,
                                                                      r'''$.transportTypeId''',
                                                                    ).toString()
                                                                  : '',
                                                            ),
                                                            options: (EFDevGroup
                                                                    .transportationTypesCall
                                                                    .transportTypeDescription(
                                                              dropDownTransportedByTransportationTypesResponse
                                                                  .jsonBody,
                                                            ) as List)
                                                                .map<String>(
                                                                    (s) => s
                                                                        .toString())
                                                                .toList()!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                .toList(),
                                                            optionLabels: (EFDevGroup
                                                                    .transportationTypesCall
                                                                    .transportTypeId(
                                                              dropDownTransportedByTransportationTypesResponse
                                                                  .jsonBody,
                                                            ) as List)
                                                                .map<String>(
                                                                    (s) => s
                                                                        .toString())
                                                                .toList()!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              setState(() =>
                                                                  _model.dropDownTransportedByValue =
                                                                      val);
                                                              setState(() {
                                                                _model.isLabelTransport =
                                                                    false;
                                                              });
                                                              setState(() {
                                                                _model
                                                                    .textFieldTransportCostController
                                                                    ?.clear();
                                                              });
                                                            },
                                                            width:
                                                                double.infinity,
                                                            height: 40.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            fillColor:
                                                                Colors.white,
                                                            elevation: 2.0,
                                                            borderColor: Color(
                                                                0xFFB9B9B9),
                                                            borderWidth: 1.5,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        12.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (_model.isLabelTransport)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'i3sjz374' /* This field is required. */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: _model.dropDownTransportedByValue !=
                                                            null &&
                                                        _model.dropDownTransportedByValue !=
                                                            ''
                                                    ? (_model
                                                            .dropDownTransportedByValue !=
                                                        'b8b91ee4-9856-43c1-ab75-29fcf2b1a448')
                                                    : (widget.editRegister !=
                                                            null
                                                        ? (getJsonField(
                                                              widget
                                                                  .editRegister,
                                                              r'''$.transportTypeId''',
                                                            ) !=
                                                            'b8b91ee4-9856-43c1-ab75-29fcf2b1a448')
                                                        : false),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width >=
                                                          500.0
                                                      ? 244.0
                                                      : 500.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'hdyq2w0z' /* Transport costs (Switzerland f... */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldTransportCostController,
                                                          readOnly: isWeb
                                                              ? (_model.dropDownTransportedByValue !=
                                                                          null &&
                                                                      _model.dropDownTransportedByValue !=
                                                                          ''
                                                                  ? (_model
                                                                          .dropDownTransportedByValue ==
                                                                      'b8b91ee4-9856-43c1-ab75-29fcf2b1a448')
                                                                  : (widget.editRegister !=
                                                                          null
                                                                      ? (getJsonField(
                                                                            widget.editRegister,
                                                                            r'''$.transportTypeId''',
                                                                          ) ==
                                                                          'b8b91ee4-9856-43c1-ab75-29fcf2b1a448')
                                                                      : true))
                                                              : false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFB9B9B9),
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          keyboardType:
                                                              const TextInputType
                                                                      .numberWithOptions(
                                                                  signed: true,
                                                                  decimal:
                                                                      true),
                                                          validator: _model
                                                              .textFieldTransportCostControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '\\d*\\.?\\d*'))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        500.0
                                                    ? 244.0
                                                    : 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '8gx9u0z3' /* Auction Duration */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  8.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              int>(
                                                        controller: _model
                                                                .dropDownDurationController ??=
                                                            FormFieldController<
                                                                int>(
                                                          _model.dropDownDurationValue ??=
                                                              widget.editRegister !=
                                                                      null
                                                                  ? ((getJsonField(
                                                                            widget.editRegister,
                                                                            r'''$.durationHours''',
                                                                          ) /
                                                                          3600)
                                                                      .toInt())
                                                                  : 24,
                                                        ),
                                                        options: [24, 48, 72],
                                                        optionLabels: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'd05cchff' /* 24 */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yejstmzf' /* 48 */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rilg09fi' /* 72 */,
                                                          )
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .dropDownDurationValue =
                                                              val);
                                                          setState(() {
                                                            _model.isLabelDuration =
                                                                false;
                                                          });
                                                        },
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        fillColor: Colors.white,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Color(0xFFB9B9B9),
                                                        borderWidth: 1.5,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    4.0,
                                                                    12.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isSearchable: false,
                                                      ),
                                                    ),
                                                    if (_model.isLabelDuration)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'to16cwqn' /* This field is required. */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        500.0
                                                    ? 244.0
                                                    : 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'br4fygjr' /* Increase with */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  8.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              double>(
                                                        controller: _model
                                                                .dropDownIncreaseController ??=
                                                            FormFieldController<
                                                                double>(
                                                          _model.dropDownIncreaseValue ??=
                                                              widget.editRegister !=
                                                                      null
                                                                  ? getJsonField(
                                                                      widget
                                                                          .editRegister,
                                                                      r'''$.minStepBid''',
                                                                    )
                                                                  : 50.0,
                                                        ),
                                                        options: [
                                                          50.0,
                                                          100.0,
                                                          150.0,
                                                          200.0
                                                        ],
                                                        optionLabels: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'h8m7k608' /* 50 */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'y387yp8s' /* 100 */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'p7n6nlmg' /* 150 */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'qa3orhy2' /* 200 */,
                                                          )
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .dropDownIncreaseValue =
                                                              val);
                                                          setState(() {
                                                            _model.isLabelIncrease =
                                                                false;
                                                          });
                                                        },
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        fillColor: Colors.white,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Color(0xFFB9B9B9),
                                                        borderWidth: 1.5,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    4.0,
                                                                    12.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isSearchable: false,
                                                      ),
                                                    ),
                                                    if (_model.isLabelIncrease)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'hx6wjh8h' /* This field is required. */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width >=
                                                          500.0
                                                      ? 244.0
                                                      : 500.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'h0v1y2sl' /* Buy Now Price */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'skyts04y' /* (Optional) */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldBuyPriceController,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFB9B9B9),
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          keyboardType:
                                                              const TextInputType
                                                                      .numberWithOptions(
                                                                  signed: true,
                                                                  decimal:
                                                                      true),
                                                          validator: _model
                                                              .textFieldBuyPriceControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '\\d*\\.?\\d*'))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '0k1ph4qd' /* * */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'g0jgp607' /* All prices incl: 7.7 % MwSt. */,
                                                    ),
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 16.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xFF95A1AC),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkboxValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      'I hereby confirm that I read and understood the ',
                                                                  deText:
                                                                      'Ich bestätige hiermit, dass ich die ',
                                                                  frText:
                                                                      'Je confirme par la présente avoir lu et compris les ',
                                                                  itText:
                                                                      'Con la presente confermo di aver letto e compreso l\' ',
                                                                ),
                                                                'Ich bestätige hiermit, dass ich die ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      'Terms and Conditions ',
                                                                  deText:
                                                                      'Allgemeinen Geschäftsbedingungen gelesen, ',
                                                                  frText:
                                                                      'Termes et conditions ',
                                                                  itText:
                                                                      'Termini e Condizioni ',
                                                                ),
                                                                'Allgemeinen Geschäftsbedingungen gelesen, ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                              mouseCursor:
                                                                  SystemMouseCursors
                                                                      .click,
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'TermsConditions');
                                                                    },
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      ' and that I agree to them.',
                                                                  deText:
                                                                      ' verstanden und akzeptiert habe.',
                                                                  frText:
                                                                      ' et que je les accepte.',
                                                                  itText:
                                                                      ' e che sono d\'accordo con loro.',
                                                                ),
                                                                ' verstanden und akzeptiert habe.',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
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
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 808.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().isEditInformation = false;
                                        context.pop();
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'wil92frp' /* Back */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Color(0xFFC5181D),
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFFC5181D),
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: !_model.checkboxValue!
                                          ? null
                                          : () async {
                                              if ((_model.textFieldMinPriceController
                                                              .text !=
                                                          null &&
                                                      _model
                                                              .textFieldMinPriceController
                                                              .text !=
                                                          '') &&
                                                  (_model.dropDownTransportedByValue !=
                                                          null &&
                                                      _model.dropDownTransportedByValue !=
                                                          '') &&
                                                  (_model.dropDownTransportedByValue !=
                                                          'b8b91ee4-9856-43c1-ab75-29fcf2b1a448'
                                                      ? (_model.textFieldTransportCostController
                                                                  .text !=
                                                              null &&
                                                          _model.textFieldTransportCostController
                                                                  .text !=
                                                              '')
                                                      : true) &&
                                                  (_model.dropDownDurationValue !=
                                                      null) &&
                                                  (_model.dropDownIncreaseValue !=
                                                      null) &&
                                                  (_model.dropDownDurationValue !=
                                                      0)) {
                                                if ((functions.stringToDouble(_model
                                                            .textFieldMinPriceController
                                                            .text) >
                                                        0.0) &&
                                                    (functions.stringToDouble(_model
                                                            .textFieldMinPriceController
                                                            .text) <=
                                                        10000000.0) &&
                                                    (_model.textFieldBuyPriceController.text != null &&
                                                            _model.textFieldBuyPriceController
                                                                    .text !=
                                                                ''
                                                        ? ((functions.stringToDouble(_model.textFieldBuyPriceController.text) >
                                                                0.0) &&
                                                            (functions.stringToDouble(
                                                                    _model.textFieldBuyPriceController.text) <=
                                                                10000000.0))
                                                        : true)) {
                                                  if (!(_model.textFieldBuyPriceController
                                                                  .text !=
                                                              null &&
                                                          _model.textFieldBuyPriceController
                                                                  .text !=
                                                              ''
                                                      ? (functions.stringToDouble(
                                                              _model
                                                                  .textFieldMinPriceController
                                                                  .text) >=
                                                          functions.stringToDouble(
                                                              _model
                                                                  .textFieldBuyPriceController
                                                                  .text))
                                                      : false)) {
                                                    if (_model.textFieldTransportCostController
                                                                    .text !=
                                                                null &&
                                                            _model.textFieldTransportCostController
                                                                    .text !=
                                                                ''
                                                        ? (functions.stringToDouble(
                                                                _model
                                                                    .textFieldTransportCostController
                                                                    .text) <
                                                            functions
                                                                .stringToDouble(
                                                                    _model
                                                                        .textFieldMinPriceController
                                                                        .text))
                                                        : true) {
                                                      if (functions.stringToDouble(
                                                              _model
                                                                  .textFieldTransportCostController
                                                                  .text) <=
                                                          400.0) {
                                                        if (_model.textFieldTransportCostController
                                                                        .text !=
                                                                    null &&
                                                                _model.textFieldTransportCostController
                                                                        .text !=
                                                                    ''
                                                            ? (functions.stringToDouble(
                                                                    _model
                                                                        .textFieldTransportCostController
                                                                        .text) >
                                                                0.0)
                                                            : true) {
                                                          _model.apiResultPreview =
                                                              await EFDevGroup
                                                                  .setAuctionPreviewCall
                                                                  .call(
                                                            vehicleId:
                                                                FFAppState()
                                                                    .NewVehicleId,
                                                            transportTypeId: _model
                                                                .dropDownTransportedByValue,
                                                            minPrice: functions
                                                                .stringToDouble(
                                                                    _model
                                                                        .textFieldMinPriceController
                                                                        .text),
                                                            transportCost: functions
                                                                .stringToDouble(
                                                                    _model
                                                                        .textFieldTransportCostController
                                                                        .text),
                                                            durationHours: _model
                                                                .dropDownDurationValue,
                                                            minStepBid: _model
                                                                .dropDownIncreaseValue,
                                                            buyNowPrice: functions
                                                                .stringToDouble(
                                                                    _model
                                                                        .textFieldBuyPriceController
                                                                        .text),
                                                            language:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                          );
                                                          if ((_model
                                                                  .apiResultPreview
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .isEditInformation =
                                                                  false;
                                                            });

                                                            context.pushNamed(
                                                                'Preview');
                                                          } else {
                                                            await actions
                                                                .snackbarAction(
                                                              context,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    'Error saving...',
                                                                deText:
                                                                    'Fehler beim Speichern...',
                                                                frText:
                                                                    'Erreur lors de l\'enregistrement...',
                                                                itText:
                                                                    'Errore durante il salvataggio...',
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          await actions
                                                              .snackbarAction(
                                                            context,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Transportation cost must be greater than 0',
                                                              deText:
                                                                  'Die Transportkosten müssen größer als 0 sein',
                                                              frText:
                                                                  'Le coût du transport doit être supérieur à 0',
                                                              itText:
                                                                  'Il costo del trasporto deve essere maggiore di 0',
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        await actions
                                                            .snackbarAction(
                                                          context,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText:
                                                                'Transportation cost cannot be greater than 400',
                                                            deText:
                                                                'Die Transportkosten dürfen 400',
                                                            frText:
                                                                'Le coût du transport ne peut être supérieur à 400 ',
                                                            itText:
                                                                'Il costo del trasporto non può essere superiore a 400',
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      await actions
                                                          .snackbarAction(
                                                        context,
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Transportation cost cannot be greater than the minimum price',
                                                          deText:
                                                              'Die Transportkosten dürfen den Mindestpreis nicht überschreiten',
                                                          frText:
                                                              'Le coût du transport ne peut pas être supérieur au prix minimum',
                                                          itText:
                                                              'Il costo del trasporto non può essere superiore al prezzo minimo',
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    await actions
                                                        .snackbarAction(
                                                      context,
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Buy now price should be higher than minimum price',
                                                        deText:
                                                            'Der Sofortkaufpreis sollte höher sein als der Mindestpreis',
                                                        frText:
                                                            'Le prix d\'achat immédiat doit être supérieur au prix minimum',
                                                        itText:
                                                            'Il prezzo di acquisto ora dovrebbe essere superiore al prezzo minimo',
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  await actions.snackbarAction(
                                                    context,
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText:
                                                          'Prices must be greater than 0 and less than 10\'000\'000',
                                                      deText:
                                                          'Preise müssen grösser als 0 und kleiner als 10\'000\'000 sein',
                                                      frText:
                                                          'Les prix doivent être supérieurs à 0 et inférieurs à 10\'000\'000',
                                                      itText:
                                                          'I prezzi devono essere maggiori di 0 e minori di 10\'000\'000',
                                                    ),
                                                  );
                                                }
                                              } else {
                                                await actions.snackbarAction(
                                                  context,
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        'Please fill all required fields',
                                                    deText:
                                                        'Füllen Sie die Pflichtfelder aus',
                                                    frText:
                                                        'Veuillez remplir tous les champs obligatoires',
                                                    itText:
                                                        'Si prega di compilare tutti i campi obbligatori',
                                                  ),
                                                );
                                                if (_model.dropDownTransportedByValue ==
                                                        null ||
                                                    _model.dropDownTransportedByValue ==
                                                        '') {
                                                  setState(() {
                                                    _model.isLabelTransport =
                                                        true;
                                                  });
                                                }
                                                if (_model
                                                        .dropDownDurationValue ==
                                                    0) {
                                                  setState(() {
                                                    _model.isLabelDuration =
                                                        true;
                                                  });
                                                }
                                                if (_model
                                                        .dropDownIncreaseValue ==
                                                    null) {
                                                  setState(() {
                                                    _model.isLabelIncrease =
                                                        true;
                                                  });
                                                }
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                              }

                                              setState(() {});
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'nd5jvn7g' /* Preview */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFC5181D),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        disabledTextColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
