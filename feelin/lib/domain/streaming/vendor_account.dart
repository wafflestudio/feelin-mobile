import 'package:json_annotation/json_annotation.dart';

part 'vendor_account.g.dart';

@JsonSerializable()
class VendorAccount{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'vendor')
  String vendor;

  VendorAccount({
    required this.id,
    required this.vendor,
  });

  factory VendorAccount.fromJson(Map<String, dynamic> json) => _$VendorAccountFromJson(json);

  Map<String, dynamic> toJson() => _$VendorAccountToJson(this);
}