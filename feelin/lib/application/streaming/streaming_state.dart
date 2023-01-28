part of 'streaming_bloc.dart';

@freezed
class StreamingState with _$StreamingState {
  const factory StreamingState({
    required Option<Either<ConnectFailure, VendorAccounts>> fetchAccountFailureOrSuccessOption,
    required Option<Either<ConnectFailure, Unit>> disconnectFailureOrSuccessOption,
    required bool isConnected,
    required Vendor vendor,
    required String vendorId,
  }) = _StreamingState;
  factory StreamingState.initial() => StreamingState(
    fetchAccountFailureOrSuccessOption: none(),
    disconnectFailureOrSuccessOption: none(),
    isConnected: false,
    vendor: Vendor.none,
    vendorId: '',
  );
}