import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _cleanpaid = 'In progress';
  String get cleanpaid => _cleanpaid;
  set cleanpaid(String value) {
    _cleanpaid = value;
  }

  String _rentalpaid = 'In progress';
  String get rentalpaid => _rentalpaid;
  set rentalpaid(String value) {
    _rentalpaid = value;
  }

  String _Groccery = 'In progress';
  String get Groccery => _Groccery;
  set Groccery(String value) {
    _Groccery = value;
  }

  String _foodpaid = 'In progress';
  String get foodpaid => _foodpaid;
  set foodpaid(String value) {
    _foodpaid = value;
  }

  String _errandpaid = 'In progress';
  String get errandpaid => _errandpaid;
  set errandpaid(String value) {
    _errandpaid = value;
  }

  String _furniturepaid = 'In progress';
  String get furniturepaid => _furniturepaid;
  set furniturepaid(String value) {
    _furniturepaid = value;
  }

  String _transpaid = 'In progress';
  String get transpaid => _transpaid;
  set transpaid(String value) {
    _transpaid = value;
  }

  String _workPaid = 'In progress';
  String get workPaid => _workPaid;
  set workPaid(String value) {
    _workPaid = value;
  }
}
