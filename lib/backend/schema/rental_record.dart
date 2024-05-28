import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RentalRecord extends FirestoreRecord {
  RentalRecord._(
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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "date_needed" field.
  String? _dateNeeded;
  String get dateNeeded => _dateNeeded ?? '';
  bool hasDateNeeded() => _dateNeeded != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _address = snapshotData['address'] as String?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _dateNeeded = snapshotData['date_needed'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rental');

  static Stream<RentalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RentalRecord.fromSnapshot(s));

  static Future<RentalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RentalRecord.fromSnapshot(s));

  static RentalRecord fromSnapshot(DocumentSnapshot snapshot) => RentalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RentalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RentalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RentalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RentalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRentalRecordData({
  DocumentReference? user,
  String? displayName,
  String? phoneNumber,
  String? address,
  String? description,
  DateTime? createdTime,
  String? dateNeeded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'address': address,
      'description': description,
      'created_time': createdTime,
      'date_needed': dateNeeded,
    }.withoutNulls,
  );

  return firestoreData;
}

class RentalRecordDocumentEquality implements Equality<RentalRecord> {
  const RentalRecordDocumentEquality();

  @override
  bool equals(RentalRecord? e1, RentalRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.address == e2?.address &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime &&
        e1?.dateNeeded == e2?.dateNeeded;
  }

  @override
  int hash(RentalRecord? e) => const ListEquality().hash([
        e?.user,
        e?.displayName,
        e?.phoneNumber,
        e?.address,
        e?.description,
        e?.createdTime,
        e?.dateNeeded
      ]);

  @override
  bool isValidKey(Object? o) => o is RentalRecord;
}
