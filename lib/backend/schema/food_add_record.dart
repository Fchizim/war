import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FoodAddRecord extends FirestoreRecord {
  FoodAddRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "foodname" field.
  String? _foodname;
  String get foodname => _foodname ?? '';
  bool hasFoodname() => _foodname != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "resturant" field.
  String? _resturant;
  String get resturant => _resturant ?? '';
  bool hasResturant() => _resturant != null;

  void _initializeFields() {
    _foodname = snapshotData['foodname'] as String?;
    _image = snapshotData['image'] as String?;
    _price = snapshotData['price'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _resturant = snapshotData['resturant'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodAdd');

  static Stream<FoodAddRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodAddRecord.fromSnapshot(s));

  static Future<FoodAddRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodAddRecord.fromSnapshot(s));

  static FoodAddRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodAddRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodAddRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodAddRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodAddRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodAddRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodAddRecordData({
  String? foodname,
  String? image,
  String? price,
  DocumentReference? user,
  String? description,
  String? resturant,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'foodname': foodname,
      'image': image,
      'price': price,
      'user': user,
      'description': description,
      'resturant': resturant,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodAddRecordDocumentEquality implements Equality<FoodAddRecord> {
  const FoodAddRecordDocumentEquality();

  @override
  bool equals(FoodAddRecord? e1, FoodAddRecord? e2) {
    return e1?.foodname == e2?.foodname &&
        e1?.image == e2?.image &&
        e1?.price == e2?.price &&
        e1?.user == e2?.user &&
        e1?.description == e2?.description &&
        e1?.resturant == e2?.resturant;
  }

  @override
  int hash(FoodAddRecord? e) => const ListEquality().hash(
      [e?.foodname, e?.image, e?.price, e?.user, e?.description, e?.resturant]);

  @override
  bool isValidKey(Object? o) => o is FoodAddRecord;
}
