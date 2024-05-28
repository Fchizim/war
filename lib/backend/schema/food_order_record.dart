import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FoodOrderRecord extends FirestoreRecord {
  FoodOrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "order_detail" field.
  String? _orderDetail;
  String get orderDetail => _orderDetail ?? '';
  bool hasOrderDetail() => _orderDetail != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
    _location = snapshotData['location'] as String?;
    _orderDetail = snapshotData['order_detail'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodOrder');

  static Stream<FoodOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodOrderRecord.fromSnapshot(s));

  static Future<FoodOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodOrderRecord.fromSnapshot(s));

  static FoodOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodOrderRecordData({
  DocumentReference? user,
  String? displayName,
  String? location,
  String? orderDetail,
  String? phoneNumber,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'display_name': displayName,
      'location': location,
      'order_detail': orderDetail,
      'phone_number': phoneNumber,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodOrderRecordDocumentEquality implements Equality<FoodOrderRecord> {
  const FoodOrderRecordDocumentEquality();

  @override
  bool equals(FoodOrderRecord? e1, FoodOrderRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.displayName == e2?.displayName &&
        e1?.location == e2?.location &&
        e1?.orderDetail == e2?.orderDetail &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(FoodOrderRecord? e) => const ListEquality().hash([
        e?.user,
        e?.displayName,
        e?.location,
        e?.orderDetail,
        e?.phoneNumber,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodOrderRecord;
}
