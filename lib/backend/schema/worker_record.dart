import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class WorkerRecord extends FirestoreRecord {
  WorkerRecord._(
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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "worker" field.
  String? _worker;
  String get worker => _worker ?? '';
  bool hasWorker() => _worker != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Date_worker_needed" field.
  String? _dateWorkerNeeded;
  String get dateWorkerNeeded => _dateWorkerNeeded ?? '';
  bool hasDateWorkerNeeded() => _dateWorkerNeeded != null;

  // "work_in_detail" field.
  String? _workInDetail;
  String get workInDetail => _workInDetail ?? '';
  bool hasWorkInDetail() => _workInDetail != null;

  // "displsy_name" field.
  String? _displsyName;
  String get displsyName => _displsyName ?? '';
  bool hasDisplsyName() => _displsyName != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _destination = snapshotData['destination'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _worker = snapshotData['worker'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _dateWorkerNeeded = snapshotData['Date_worker_needed'] as String?;
    _workInDetail = snapshotData['work_in_detail'] as String?;
    _displsyName = snapshotData['displsy_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('worker');

  static Stream<WorkerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerRecord.fromSnapshot(s));

  static Future<WorkerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerRecord.fromSnapshot(s));

  static WorkerRecord fromSnapshot(DocumentSnapshot snapshot) => WorkerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerRecordData({
  DocumentReference? user,
  String? destination,
  String? phoneNumber,
  String? worker,
  DateTime? createdTime,
  String? dateWorkerNeeded,
  String? workInDetail,
  String? displsyName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'destination': destination,
      'phone_number': phoneNumber,
      'worker': worker,
      'created_time': createdTime,
      'Date_worker_needed': dateWorkerNeeded,
      'work_in_detail': workInDetail,
      'displsy_name': displsyName,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerRecordDocumentEquality implements Equality<WorkerRecord> {
  const WorkerRecordDocumentEquality();

  @override
  bool equals(WorkerRecord? e1, WorkerRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.destination == e2?.destination &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.worker == e2?.worker &&
        e1?.createdTime == e2?.createdTime &&
        e1?.dateWorkerNeeded == e2?.dateWorkerNeeded &&
        e1?.workInDetail == e2?.workInDetail &&
        e1?.displsyName == e2?.displsyName;
  }

  @override
  int hash(WorkerRecord? e) => const ListEquality().hash([
        e?.user,
        e?.destination,
        e?.phoneNumber,
        e?.worker,
        e?.createdTime,
        e?.dateWorkerNeeded,
        e?.workInDetail,
        e?.displsyName
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerRecord;
}
