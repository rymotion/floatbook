library floatbook_photo;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:floatbook/common/serializer.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  Photo._();

  factory Photo([updates(PhotoBuilder b)]) = _$Photo;

  @BuiltValueField(wireName: "urlRef")
  String get urlRef;

  @BuiltValueField(wireName: "metaData")
  String get metaData;

  String toJSON() {
    return json.encode(serializers.serializeWith(Photo.serializer, this));
  }

  static Photo fromJSON(String jsonString) => serializers.deserializeWith(
      Photo.serializer, json.decode(jsonString));

  static Serializer<Photo> get serializer => _$photoSerializer;
}