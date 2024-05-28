import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profileedit_widget.dart' show ProfileeditWidget;
import 'package:flutter/material.dart';

class ProfileeditModel extends FlutterFlowModel<ProfileeditWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for myAddress widget.
  FocusNode? myAddressFocusNode;
  TextEditingController? myAddressTextController;
  String? Function(BuildContext, String?)? myAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    myAddressFocusNode?.dispose();
    myAddressTextController?.dispose();
  }
}
