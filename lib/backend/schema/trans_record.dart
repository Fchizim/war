import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TransRecord extends FirestoreRecord {
  TransRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  bool hasDestination() => _destination != null;

  // "pickLocation" field.
  String? _pickLocation;
  String get pickLocation => _pickLocation ?? '';
  bool hasPickLocation() => _pickLocation != null;

  // "departDate" field.
  String? _departDate;
  String get departDate => _departDate ?? '';
  bool hasDepartDate() => _departDate != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "provider" field.
  String? _provider;
  String get provider => _provider ?? '';
  bool hasProvider() => _provider != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _destination = snapshotData['destination'] as String?;
    _pickLocation = snapshotData['pickLocation'] as String?;
    _departDate = snapshotData['departDate'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _provider = snapshotData['provider'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trans');

  static Stream<TransRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransRecord.fromSnapshot(s));

  static Future<TransRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransRecord.fromSnapshot(s));

  static TransRecord fromSnapshot(DocumentSnapshot snapshot) => TransRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransRecordData({
  DocumentReference? user,
  String? destination,
  String? pickLocation,
  String? departDate,
  String? phoneNumber,
  DateTime? createdTime,
  String? displayName,
  String? provider,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'destination': destination,
      'pickLocation': pickLocation,
      'departDate': departDate,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'display_name': displayName,
      'provider': provider,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransRecordDocumentEquality implements Equality<TransRecord> {
  const TransRecordDocumentEquality();

  @override
  bool equals(TransRecord? e1, TransRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.destination == e2?.destination &&
        e1?.pickLocation == e2?.pickLocation &&
        e1?.departDate == e2?.departDate &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.provider == e2?.provider;
  }

  @override
  int hash(TransRecord? e) => const ListEquality().hash([
        e?.user,
        e?.destination,
        e?.pickLocation,
        e?.departDate,
        e?.phoneNumber,
        e?.createdTime,
        e?.displayName,
        e?.provider
      ]);

  @override
  bool isValidKey(Object? o) => o is TransRecord;
}
