import 'package:json_annotation/json_annotation.dart';

part 'me.g.dart';

@JsonSerializable()
class Me {

  static String endpoint = '/me';

  final String? username;
  final String? email;

  Me({this.username, this.email});

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this); 
}