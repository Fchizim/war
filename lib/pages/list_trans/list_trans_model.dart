import '/flutter_flow/flutter_flow_util.dart';
import 'list_trans_widget.dart' show ListTransWidget;
import 'package:flutter/material.dart';

class ListTransModel extends FlutterFlowModel<ListTransWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
