// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VApar _$VAparFromJson(Map<String, dynamic> json) {
  return VApar(
    json['traderId'] as String,
    json['traderName'] as String,
    (json['opening'] as num).toDouble(),
    (json['drAmt'] as num).toDouble(),
    (json['crAmt'] as num).toDouble(),
    (json['closing'] as num).toDouble(),
    json['accountCode'] as String,
  );
}

Map<String, dynamic> _$VAparToJson(VApar instance) => <String, dynamic>{
      'traderId': instance.traderId,
      'traderName': instance.traderName,
      'opening': instance.opening,
      'drAmt': instance.drAmt,
      'crAmt': instance.crAmt,
      'closing': instance.closing,
      'accountCode': instance.accountCode,
    };
