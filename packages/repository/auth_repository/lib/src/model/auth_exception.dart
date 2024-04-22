/// Auth exception when user disconnect and
class AuthException implements Exception {
  const AuthException();
}

/// User cancled and maybe did not logged in.
class UserCancledException implements Exception {
  const UserCancledException();
}

/// Bazzar did not install on user device.
class NotInstalledException implements Exception {
  const NotInstalledException();
}
