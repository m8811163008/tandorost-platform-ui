enum FetchDataStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == FetchDataStatus.initial;
  bool get isLoading => this == FetchDataStatus.loading;
  bool get isLoaded => this == FetchDataStatus.loaded;
  bool get isError => this == FetchDataStatus.error;
}
