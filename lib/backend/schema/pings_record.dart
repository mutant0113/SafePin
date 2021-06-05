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
  DocumentReference get user;

  @nullable
  DocumentReference get friend;

  @nullable
  @BuiltValueField(wireName: 'friend_last_mask')
  int get friendLastMask;

  @nullable
  @BuiltValueField(wireName: 'friend_last_alcohol')
  int get friendLastAlcohol;

  @nullable
  @BuiltValueField(wireName: 'friend_last_food')
  int get friendLastFood;

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
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  bool get isResponsed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PingsRecordBuilder builder) => builder
    ..friendLastMask = 0
    ..friendLastAlcohol = 0
    ..friendLastFood = 0
    ..friendName = ''
    ..friendPhotoUrl = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..isResponsed = false;

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
  DocumentReference user,
  DocumentReference friend,
  int friendLastMask,
  int friendLastAlcohol,
  int friendLastFood,
  Timestamp updateTimestamp,
  String friendName,
  String friendPhotoUrl,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  Timestamp createdTime,
  bool isResponsed,
}) =>
    serializers.serializeWith(
        PingsRecord.serializer,
        PingsRecord((p) => p
          ..user = user
          ..friend = friend
          ..friendLastMask = friendLastMask
          ..friendLastAlcohol = friendLastAlcohol
          ..friendLastFood = friendLastFood
          ..updateTimestamp = updateTimestamp
          ..friendName = friendName
          ..friendPhotoUrl = friendPhotoUrl
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..isResponsed = isResponsed));

PingsRecord get dummyPingsRecord {
  final builder = PingsRecordBuilder()
    ..friendLastMask = dummyInteger
    ..friendLastAlcohol = dummyInteger
    ..friendLastFood = dummyInteger
    ..updateTimestamp = dummyTimestamp
    ..friendName = dummyString
    ..friendPhotoUrl = dummyImagePath
    ..email = dummyString
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp
    ..isResponsed = dummyBoolean;
  return builder.build();
}

List<PingsRecord> createDummyPingsRecord({int count}) =>
    List.generate(count, (_) => dummyPingsRecord);
