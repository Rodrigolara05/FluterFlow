import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_f24_date_field_model.dart';
export 'e_f24_date_field_model.dart';

class EF24DateFieldWidget extends StatefulWidget {
  const EF24DateFieldWidget({
    Key? key,
    this.initialDate,
  }) : super(key: key);

  final DateTime? initialDate;

  @override
  _EF24DateFieldWidgetState createState() => _EF24DateFieldWidgetState();
}

class _EF24DateFieldWidgetState extends State<EF24DateFieldWidget> {
  late EF24DateFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EF24DateFieldModel());

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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                _model.datePicked != null
                    ? _model.datePicked?.toString()
                    : (widget.initialDate != null
                        ? widget.initialDate?.toString()
                        : getCurrentTimestamp.toString()),
                '\"\"',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
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
