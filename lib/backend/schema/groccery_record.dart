import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class GrocceryRecord extends FirestoreRecord {
  GrocceryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "order_detail" field.
  String? _orderDetail;
  String get orderDetail => _orderDetail ?? '';
  bool hasOrderDetail() => _orderDetail != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "date_needed" field.
  String? _dateNeeded;
  String get dateNeeded => _dateNeeded ?? '';
  bool hasDateNeeded() => _dateNeeded != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _orderDetail = snapshotData['order_detail'] as String?;
    _address = snapshotData['address'] as String?;
    _dateNeeded = snapshotData['date_needed'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groccery');

  static Stream<GrocceryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrocceryRecord.fromSnapshot(s));

  static Future<GrocceryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrocceryRecord.fromSnapshot(s));

  static GrocceryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrocceryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrocceryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrocceryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrocceryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrocceryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrocceryRecordData({
  DocumentReference? user,
  DateTime? createdDate,
  String? displayName,
  String? phoneNumber,
  String? orderDetail,
  String? address,
  String? dateNeeded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'created_date': createdDate,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'order_detail': orderDetail,
      'address': address,
      'date_needed': dateNeeded,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrocceryRecordDocumentEquality implements Equality<GrocceryRecord> {
  const GrocceryRecordDocumentEquality();

  @override
  bool equals(GrocceryRecord? e1, GrocceryRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.createdDate == e2?.createdDate &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.orderDetail == e2?.orderDetail &&
        e1?.address == e2?.address &&
        e1?.dateNeeded == e2?.dateNeeded;
  }

  @override
  int hash(GrocceryRecord? e) => const ListEquality().hash([
        e?.user,
        e?.createdDate,
        e?.displayName,
        e?.phoneNumber,
        e?.orderDetail,
        e?.address,
        e?.dateNeeded
      ]);

  @override
  bool isValidKey(Object? o) => o is GrocceryRecord;
}
