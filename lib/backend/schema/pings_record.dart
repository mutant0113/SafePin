import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'pings_record.g.dart';

abstract class PingsRecord implements Built<PingsRecord, PingsRecordBuilder> {
  static Serializer<PingsRecord> get serializer => _$pingsRecordSerializer;

  @nullable
  DocumentReference get sender;

  @nullable
  DocumentReference get receiver;

  @nullable
  @BuiltValueField(wireName: 'update_timestamp')
  Timestamp get updateTimestamp;

  @nullable
  @BuiltValueField(wireName: 'friend_name')
  String get friendName;

  @nullable
  @BuiltValueField(wireName: 'friend_photo_url')
  String get friendPhotoUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PingsRecordBuilder builder) => builder
    ..friendName = ''
    ..friendPhotoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pings');

  static Stream<PingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PingsRecord._();
  factory PingsRecord([void Function(PingsRecordBuilder) updates]) =
      _$PingsRecord;
}

Map<String, dynamic> createPingsRecordData({
  DocumentReference sender,
  DocumentReference receiver,
  Timestamp updateTimestamp,
  String friendName,
  String friendPhotoUrl,
}) =>
    serializers.serializeWith(
        PingsRecord.serializer,
        PingsRecord((p) => p
          ..sender = sender
          ..receiver = receiver
          ..updateTimestamp = updateTimestamp
          ..friendName = friendName
          ..friendPhotoUrl = friendPhotoUrl));

PingsRecord get dummyPingsRecord {
  final builder = PingsRecordBuilder()
    ..updateTimestamp = dummyTimestamp
    ..friendName = dummyString
    ..friendPhotoUrl = dummyImagePath;
  return builder.build();
}

List<PingsRecord> createDummyPingsRecord({int count}) =>
    List.generate(count, (_) => dummyPingsRecord);
