import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FurnitureRecord extends FirestoreRecord {
  FurnitureRecord._(
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

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "date_order_needed" field.
  String? _dateOrderNeeded;
  String get dateOrderNeeded => _dateOrderNeeded ?? '';
  bool hasDateOrderNeeded() => _dateOrderNeeded != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _dateOrderNeeded = snapshotData['date_order_needed'] as String?;
    _photo = snapshotData['photo'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('furniture');

  static Stream<FurnitureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FurnitureRecord.fromSnapshot(s));

  static Future<FurnitureRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FurnitureRecord.fromSnapshot(s));

  static FurnitureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FurnitureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FurnitureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FurnitureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FurnitureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FurnitureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFurnitureRecordData({
  DocumentReference? user,
  DateTime? createdDate,
  String? address,
  String? phoneNumber,
  String? displayName,
  String? dateOrderNeeded,
  String? photo,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'created_date': createdDate,
      'address': address,
      'phone_number': phoneNumber,
      'display_name': displayName,
      'date_order_needed': dateOrderNeeded,
      'photo': photo,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class FurnitureRecordDocumentEquality implements Equality<FurnitureRecord> {
  const FurnitureRecordDocumentEquality();

  @override
  bool equals(FurnitureRecord? e1, FurnitureRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.createdDate == e2?.createdDate &&
        e1?.address == e2?.address &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.displayName == e2?.displayName &&
        e1?.dateOrderNeeded == e2?.dateOrderNeeded &&
        e1?.photo == e2?.photo &&
        e1?.description == e2?.description;
  }

  @override
  int hash(FurnitureRecord? e) => const ListEquality().hash([
        e?.user,
        e?.createdDate,
        e?.address,
        e?.phoneNumber,
        e?.displayName,
        e?.dateOrderNeeded,
        e?.photo,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is FurnitureRecord;
}
