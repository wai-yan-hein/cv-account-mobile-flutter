// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vrkey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VAparKey _$VAparKeyFromJson(Map<String, dynamic> json) {
  return VAparKey(
    json['cvId'] as int,
    json['userId'] as String,
    json['compCode'] as int,
    json['currency'] as String,
  );
}

Map<String, dynamic> _$VAparKeyToJson(VAparKey instance) => <String, dynamic>{
      'cvId': instance.cvId,
      'userId': instance.userId,
      'compCode': instance.compCode,
      'currency': instance.currency,
    };
