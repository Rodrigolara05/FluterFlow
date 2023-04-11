import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicles_favourites_model.dart';
export 'vehicles_favourites_model.dart';

class VehiclesFavouritesWidget extends StatefulWidget {
  const VehiclesFavouritesWidget({Key? key}) : super(key: key);

  @override
  _VehiclesFavouritesWidgetState createState() =>
      _VehiclesFavouritesWidgetState();
}

class _VehiclesFavouritesWidgetState extends State<VehiclesFavouritesWidget> {
  late VehiclesFavouritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehiclesFavouritesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().filterDescriptionLists = '';
        FFAppState().filterSortDescLists = true;
      });
    });

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
      ),
    );
  }
}
