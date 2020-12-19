import 'package:json_annotation/json_annotation.dart';

part 'vr.g.dart';

@JsonSerializable(nullable: false)
class VApar {
  final String traderId;
  final String traderName;
  final double opening;
  final double drAmt;
  final double crAmt;
  final double closing;
  final String accountCode;

  VApar(this.traderId, this.traderName, this.opening, this.drAmt, this.crAmt,
      this.closing, this.accountCode);
  factory VApar.fromJson(Map<String, dynamic> json) => _$VAparFromJson(json);
  Map<String, dynamic> toJson() => _$VAparToJson(this);
}
