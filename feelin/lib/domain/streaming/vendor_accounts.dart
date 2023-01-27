import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/streaming/vendor_account.dart';

part 'vendor_accounts.g.dart';

@JsonSerializable()
class VendorAccounts{

  @JsonKey(name: 'accounts')
  List<VendorAccount> accounts;

  VendorAccounts({
    required this.accounts,
  });

  factory VendorAccounts.fromJson(Map<String, dynamic> json) => _$VendorAccountsFromJson(json);

  Map<String, dynamic> toJson() => _$VendorAccountsToJson(this);
}