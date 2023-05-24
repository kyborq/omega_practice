enum AppPages {
  login,
  register,
  home,
  splash,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.splash:
        return '/splash';
      case AppPages.login:
        return 'login';
      case AppPages.register:
        return 'register';
      case AppPages.home:
        return '/';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.splash:
        return 'Добро пожаловать';
      case AppPages.login:
        return 'Войдите в профиль';
      case AppPages.register:
        return 'Новый пользователь';
      case AppPages.home:
        return 'Главная';
    }
  }
}
