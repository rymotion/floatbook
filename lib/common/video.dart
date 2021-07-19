/// [Video] class descibes any video being shared in application
import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:floatbook/common/serializer.dart';

part 'video.g.dart';

abstract class Video implements Built<Video, VideoBuilder> {
  Video._();

  factory Video([updates(VideoBuilder b)]) = _$Video;

  @BuiltValueField(wireName: "videoRef")
  String get videoRef;

  @BuiltValueField(wireName: "metaData")
  String get metaData;

  String toJSON() {
    return json.encode(serializers.serializeWith(Video.serializer, this));
  }

  static Video fromJSON(String jsonString) =>
      serializers.deserializeWith(Video.serializer, json.decode(jsonString));

  static Serializer<Video> get serializer => _$videoSerializer;
}
