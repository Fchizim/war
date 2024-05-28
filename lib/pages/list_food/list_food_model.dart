import '/flutter_flow/flutter_flow_util.dart';
import 'list_food_widget.dart' show ListFoodWidget;
import 'package:flutter/material.dart';

class ListFoodModel extends FlutterFlowModel<ListFoodWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
