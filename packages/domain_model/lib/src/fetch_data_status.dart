enum ProcessAsyncStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == ProcessAsyncStatus.initial;
  bool get isLoading => this == ProcessAsyncStatus.loading;
  bool get isLoaded => this == ProcessAsyncStatus.loaded;
  bool get isError => this == ProcessAsyncStatus.error;
}
