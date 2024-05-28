import '/flutter_flow/flutter_flow_util.dart';
import 'list_errand_widget.dart' show ListErrandWidget;
import 'package:flutter/material.dart';

class ListErrandModel extends FlutterFlowModel<ListErrandWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
