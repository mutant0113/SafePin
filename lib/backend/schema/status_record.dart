import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'status_record.g.dart';

abstract class StatusRecord
    implements Built<StatusRecord, StatusRecordBuilder> {
  static Serializer<StatusRecord> get serializer => _$statusRecordSerializer;

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
  @BuiltValueField(wireName: 'has_pinged_friend')
  bool get hasPingedFriend;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StatusRecordBuilder builder) => builder
    ..friendLastMask = 0
    ..friendLastAlcohol = 0
    ..friendLastFood = 0
    ..friendName = ''
    ..friendPhotoUrl = ''
    ..hasPingedFriend = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('status');

  static Stream<StatusRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StatusRecord._();
  factory StatusRecord([void Function(StatusRecordBuilder) updates]) =
      _$StatusRecord;
}

Map<String, dynamic> createStatusRecordData({
  DocumentReference user,
  DocumentReference friend,
  int friendLastMask,
  int friendLastAlcohol,
  int friendLastFood,
  Timestamp updateTimestamp,
  String friendName,
  String friendPhotoUrl,
  bool hasPingedFriend,
}) =>
    serializers.serializeWith(
        StatusRecord.serializer,
        StatusRecord((s) => s
          ..user = user
          ..friend = friend
          ..friendLastMask = friendLastMask
          ..friendLastAlcohol = friendLastAlcohol
          ..friendLastFood = friendLastFood
          ..updateTimestamp = updateTimestamp
          ..friendName = friendName
          ..friendPhotoUrl = friendPhotoUrl
          ..hasPingedFriend = hasPingedFriend));

StatusRecord get dummyStatusRecord {
  final builder = StatusRecordBuilder()
    ..friendLastMask = dummyInteger
    ..friendLastAlcohol = dummyInteger
    ..friendLastFood = dummyInteger
    ..updateTimestamp = dummyTimestamp
    ..friendName = dummyString
    ..friendPhotoUrl = dummyImagePath
    ..hasPingedFriend = dummyBoolean;
  return builder.build();
}

List<StatusRecord> createDummyStatusRecord({int count}) =>
    List.generate(count, (_) => dummyStatusRecord);
