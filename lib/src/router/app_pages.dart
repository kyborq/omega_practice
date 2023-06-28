enum AppPages {
  register,
  login,
  home,
  image,
  splash,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.register:
        return '/register';
      case AppPages.login:
        return '/login';
      case AppPages.home:
        return '/home';
      case AppPages.image:
        return '/image';
      case AppPages.splash:
        return '/';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.register:
        return 'Регистрация';
      case AppPages.login:
        return 'Вход';
      case AppPages.home:
        return 'Галерея';
      case AppPages.image:
        return 'Предпросмотр';
      case AppPages.splash:
        return 'Добро пожаловать';
    }
  }
}
