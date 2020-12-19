import 'package:json_annotation/json_annotation.dart';
part 'vrkey.g.dart';

@JsonSerializable(nullable: false)
class VAparKey {
  final int cvId;
  final String userId;
  final int compCode;
  final String currency;
  VAparKey(this.cvId, this.userId, this.compCode, this.currency);
  factory VAparKey.fromJson(Map<String, dynamic> json) =>
      _$VAparKeyFromJson(json);
  Map<String, dynamic> toJson() => _$VAparKeyToJson(this);
}
