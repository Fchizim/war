import '/flutter_flow/flutter_flow_util.dart';
import 'list_rental_widget.dart' show ListRentalWidget;
import 'package:flutter/material.dart';

class ListRentalModel extends FlutterFlowModel<ListRentalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
