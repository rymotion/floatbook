
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:floatbook/common/serializer.dart';

import 'package:floatbook/common/content.dart';
import 'package:floatbook/common/user.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder>{
  Message._();

  factory Message([updates(MessageBuilder b)]) = _$Message;

  @BuiltValueField(wireName: "user")
  User get user;

  @BuiltValueField(wireName: "content")
  BuiltList<Content> get messageContent;

  String toJSON() {
    return json.encode(serializers.serializeWith(Message.serializer, this));
  }

  static Message fromJSON(String jsonString) => serializers.deserializeWith(
      Message.serializer, json.decode(jsonString));

  static Serializer<Message> get serializer => _$messageSerializer;
}