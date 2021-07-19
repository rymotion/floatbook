import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:floatbook/common/content.dart';

import 'package:floatbook/common/message.dart';
import 'package:floatbook/common/photo.dart';
import 'package:floatbook/common/user.dart';
import 'package:floatbook/common/video.dart';

part 'serializer.g.dart';

@SerializersFor(const [
  Message,
  Content,
  Photo,
  User,
  Video,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializer =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) => standardSerializer.deserializeWith<T>(
    standardSerializer.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));
