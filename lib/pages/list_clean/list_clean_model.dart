import '/flutter_flow/flutter_flow_util.dart';
import 'list_clean_widget.dart' show ListCleanWidget;
import 'package:flutter/material.dart';

class ListCleanModel extends FlutterFlowModel<ListCleanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
