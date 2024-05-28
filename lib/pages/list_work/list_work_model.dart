import '/flutter_flow/flutter_flow_util.dart';
import 'list_work_widget.dart' show ListWorkWidget;
import 'package:flutter/material.dart';

class ListWorkModel extends FlutterFlowModel<ListWorkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
