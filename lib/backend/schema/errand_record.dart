import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ErrandRecord extends FirestoreRecord {
  ErrandRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "displsy_name" field.
  String? _displsyName;
  String get displsyName => _displsyName ?? '';
  bool hasDisplsyName() => _displsyName != null;

  // "phone_name" field.
  String? _phoneName;
  String get phoneName => _phoneName ?? '';
  bool hasPhoneName() => _phoneName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _displsyName = snapshotData['displsy_name'] as String?;
    _phoneName = snapshotData['phone_name'] as String?;
    _address = snapshotData['address'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('errand');

  static Stream<ErrandRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ErrandRecord.fromSnapshot(s));

  static Future<ErrandRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ErrandRecord.fromSnapshot(s));

  static ErrandRecord fromSnapshot(DocumentSnapshot snapshot) => ErrandRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ErrandRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ErrandRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ErrandRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ErrandRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createErrandRecordData({
  DocumentReference? user,
  String? displsyName,
  String? phoneName,
  String? address,
  DateTime? createdTime,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'displsy_name': displsyName,
      'phone_name': phoneName,
      'address': address,
      'created_time': createdTime,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ErrandRecordDocumentEquality implements Equality<ErrandRecord> {
  const ErrandRecordDocumentEquality();

  @override
  bool equals(ErrandRecord? e1, ErrandRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.displsyName == e2?.displsyName &&
        e1?.phoneName == e2?.phoneName &&
        e1?.address == e2?.address &&
        e1?.createdTime == e2?.createdTime &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ErrandRecord? e) => const ListEquality().hash([
        e?.user,
        e?.displsyName,
        e?.phoneName,
        e?.address,
        e?.createdTime,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is ErrandRecord;
}
