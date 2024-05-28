import '/flutter_flow/flutter_flow_util.dart';
import 'list_groc_widget.dart' show ListGrocWidget;
import 'package:flutter/material.dart';

class ListGrocModel extends FlutterFlowModel<ListGrocWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
