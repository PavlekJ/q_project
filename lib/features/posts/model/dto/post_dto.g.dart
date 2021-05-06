// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDTO _$PostDTOFromJson(Map<String, dynamic> json) {
  return PostDTO(
    json['postId'] as int,
    json['id'] as int,
    json['name'] as String,
    json['email'] as String,
    json['body'] as String,
  );
}

Map<String, dynamic> _$PostDTOToJson(PostDTO instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
