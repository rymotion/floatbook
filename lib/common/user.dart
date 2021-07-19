import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:floatbook/common/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  @BuiltValueField(wireName: "alias")
  String get alias;

  @BuiltValueField(wireName: "data")
  String get data;

  @BuiltValueField(wireName: "verified")
  bool get verified;

  @BuiltValueField(wireName: "online")
  bool get online;

  @BuiltValueField(wireName: "profileRef")
  String get profileRef;

  String toJSON() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJSON(String jsonString) => serializers.deserializeWith(
      User.serializer, json.decode(jsonString));

  static Serializer<User> get serializer => _$userSerializer;
}