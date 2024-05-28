import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CleaningRecord extends FirestoreRecord {
  CleaningRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "whatToClean" field.
  String? _whatToClean;
  String get whatToClean => _whatToClean ?? '';
  bool hasWhatToClean() => _whatToClean != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "date_need" field.
  String? _dateNeed;
  String get dateNeed => _dateNeed ?? '';
  bool hasDateNeed() => _dateNeed != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _address = snapshotData['address'] as String?;
    _whatToClean = snapshotData['whatToClean'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _dateNeed = snapshotData['date_need'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cleaning');

  static Stream<CleaningRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CleaningRecord.fromSnapshot(s));

  static Future<CleaningRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CleaningRecord.fromSnapshot(s));

  static CleaningRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CleaningRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CleaningRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CleaningRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CleaningRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CleaningRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCleaningRecordData({
  DocumentReference? user,
  String? phoneNumber,
  String? displayName,
  String? address,
  String? whatToClean,
  DateTime? createdTime,
  String? type,
  String? dateNeed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'phone_number': phoneNumber,
      'display_name': displayName,
      'address': address,
      'whatToClean': whatToClean,
      'created_time': createdTime,
      'type': type,
      'date_need': dateNeed,
    }.withoutNulls,
  );

  return firestoreData;
}

class CleaningRecordDocumentEquality implements Equality<CleaningRecord> {
  const CleaningRecordDocumentEquality();

  @override
  bool equals(CleaningRecord? e1, CleaningRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.displayName == e2?.displayName &&
        e1?.address == e2?.address &&
        e1?.whatToClean == e2?.whatToClean &&
        e1?.createdTime == e2?.createdTime &&
        e1?.type == e2?.type &&
        e1?.dateNeed == e2?.dateNeed;
  }

  @override
  int hash(CleaningRecord? e) => const ListEquality().hash([
        e?.user,
        e?.phoneNumber,
        e?.displayName,
        e?.address,
        e?.whatToClean,
        e?.createdTime,
        e?.type,
        e?.dateNeed
      ]);

  @override
  bool isValidKey(Object? o) => o is CleaningRecord;
}
