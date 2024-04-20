enum ProcessAsyncStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == ProcessAsyncStatus.initial;
  bool get isLoading => this == ProcessAsyncStatus.loading;
  bool get isSuccess => this == ProcessAsyncStatus.success;
  bool get isError => this == ProcessAsyncStatus.error;
}
