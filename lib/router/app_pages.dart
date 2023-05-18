enum AppPages {
  auth,
  home,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.auth:
        return '/auth';
      case AppPages.home:
        return '/';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.auth:
        return 'Добро пожаловать';
      case AppPages.home:
        return 'Главная';
    }
  }
}
