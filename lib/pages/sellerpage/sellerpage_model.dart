import '/flutter_flow/flutter_flow_util.dart';
import 'sellerpage_widget.dart' show SellerpageWidget;
import 'package:flutter/material.dart';

class SellerpageModel extends FlutterFlowModel<SellerpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
