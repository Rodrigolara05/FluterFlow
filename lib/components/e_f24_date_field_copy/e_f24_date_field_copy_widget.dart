import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_f24_date_field_copy_model.dart';
export 'e_f24_date_field_copy_model.dart';

class EF24DateFieldCopyWidget extends StatefulWidget {
  const EF24DateFieldCopyWidget({
    Key? key,
    this.initialDate,
  }) : super(key: key);

  final DateTime? initialDate;

  @override
  _EF24DateFieldCopyWidgetState createState() =>
      _EF24DateFieldCopyWidgetState();
}

class _EF24DateFieldCopyWidgetState extends State<EF24DateFieldCopyWidget> {
  late EF24DateFieldCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EF24DateFieldCopyModel());

    _model.textFieldDateController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textFieldDateController?.text = dateTimeFormat(
            'd/M/y',
            widget.initialDate,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
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
      width: MediaQuery.of(context).size.width * 1.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0x66ABABAB),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textFieldDateController,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: dateTimeFormat(
                    'd/M/y',
                    _model.datePicked,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  hintText: FFLocalizations.of(context).getText(
                    '3n7j8ou9' /* [Some hint text...] */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textFieldDateControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.solidCalendarAlt,
              color: Color(0x99ABABAB),
              size: 24.0,
            ),
            onPressed: () async {
              final _datePickedDate = await showDatePicker(
                context: context,
                initialDate: getCurrentTimestamp,
                firstDate: DateTime(1900),
                lastDate: DateTime(2050),
              );

              if (_datePickedDate != null) {
                setState(() {
                  _model.datePicked = DateTime(
                    _datePickedDate.year,
                    _datePickedDate.month,
                    _datePickedDate.day,
                  );
                });
              }
              FFAppState().update(() {});
            },
          ),
        ],
      ),
    );
  }
}
