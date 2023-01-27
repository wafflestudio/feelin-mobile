// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorAccounts _$VendorAccountsFromJson(Map<String, dynamic> json) =>
    VendorAccounts(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => VendorAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorAccountsToJson(VendorAccounts instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
    };
