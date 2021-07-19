
import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:floatbook/common/serializer.dart';

part 'content.g.dart';

abstract class Content implements Built<Content, ContentBuilder> {
  Content._();

  factory Content([updates(ContentBuilder b)]) = _$Content;

  @BuiltValueField(wireName: "dataType")
  String get dataType;

  @BuiltValueField(wireName: "data")
  String get data;

  String toJSON() {
    return json.encode(serializers.serializeWith(Content.serializer, this));
  }

  static Content fromJSON(String jsonString) => serializers.deserializeWith(
      Content.serializer, json.decode(jsonString));

  static Serializer<Content> get serializer => _$contentSerializer;
}