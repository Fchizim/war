import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FurnitureAddRecord extends FirestoreRecord {
  FurnitureAddRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "furniturename" field.
  String? _furniturename;
  String get furniturename => _furniturename ?? '';
  bool hasFurniturename() => _furniturename != null;

  // "buildername" field.
  String? _buildername;
  String get buildername => _buildername ?? '';
  bool hasBuildername() => _buildername != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _furniturename = snapshotData['furniturename'] as String?;
    _buildername = snapshotData['buildername'] as String?;
    _image = snapshotData['image'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _price = snapshotData['price'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('furnitureAdd');

  static Stream<FurnitureAddRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FurnitureAddRecord.fromSnapshot(s));

  static Future<FurnitureAddRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FurnitureAddRecord.fromSnapshot(s));

  static FurnitureAddRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FurnitureAddRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FurnitureAddRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FurnitureAddRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FurnitureAddRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FurnitureAddRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFurnitureAddRecordData({
  String? furniturename,
  String? buildername,
  String? image,
  DocumentReference? user,
  String? description,
  String? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'furniturename': furniturename,
      'buildername': buildername,
      'image': image,
      'user': user,
      'description': description,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class FurnitureAddRecordDocumentEquality
    implements Equality<FurnitureAddRecord> {
  const FurnitureAddRecordDocumentEquality();

  @override
  bool equals(FurnitureAddRecord? e1, FurnitureAddRecord? e2) {
    return e1?.furniturename == e2?.furniturename &&
        e1?.buildername == e2?.buildername &&
        e1?.image == e2?.image &&
        e1?.user == e2?.user &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price;
  }

  @override
  int hash(FurnitureAddRecord? e) => const ListEquality().hash([
        e?.furniturename,
        e?.buildername,
        e?.image,
        e?.user,
        e?.description,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is FurnitureAddRecord;
}
