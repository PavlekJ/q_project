import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDTO {

  @JsonKey(name : "postId")
  final int postId;

  @JsonKey(name : "id")
  final int id;

  @JsonKey(name : "name")
  final String name;

  @JsonKey(name : "email")
  final String email;

  @JsonKey(name : "body")
  final String body;

  PostDTO(this.postId, this.id, this.name, this.email, this.body);

  static PostDTO mock() {
    return PostDTO(1, 1, 'ime', 'mail', 'Ovo je komentar');
  }

  factory PostDTO.fromJson(Map<String, dynamic> json) => _$PostDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PostDTOToJson(this);
}