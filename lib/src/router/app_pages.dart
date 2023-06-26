enum AppPages {
  login,
  home,
  image,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.login:
        return '/login';
      case AppPages.home:
        return '/';
      case AppPages.image:
        return '/image';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.login:
        return 'Вход';
      case AppPages.home:
        return 'Галерея';
      case AppPages.image:
        return 'Предпросмотр';
    }
  }
}
