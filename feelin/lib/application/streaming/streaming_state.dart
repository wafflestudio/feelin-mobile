part of 'streaming_bloc.dart';

@freezed
class StreamingState with _$StreamingState {
  const factory StreamingState({
    required Option<Either<ConnectFailure, VendorAccounts>> fetchAccountFailureOrSuccessOption,
    required Option<Either<ConnectFailure, Unit>> disconnectFailureOrSuccessOption,
    required Option<Either<String, String>> saveFailureOrSuccessOption,
    required bool isSaving,
    required bool isConnected,
    required Vendor vendor,
    required String vendorId,
  }) = _StreamingState;
  factory StreamingState.initial() => StreamingState(
    fetchAccountFailureOrSuccessOption: none(),
    disconnectFailureOrSuccessOption: none(),
    saveFailureOrSuccessOption: none(),
    isSaving: false,
    isConnected: false,
    vendor: Vendor.none,
    vendorId: '',
  );
}