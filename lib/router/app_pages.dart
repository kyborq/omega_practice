enum AppPages {
  login,
  register,
  home,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.login:
        return '/login';
      case AppPages.register:
        return '/register';
      case AppPages.home:
        return '/';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.login:
        return 'Добро пожаловать!';
      case AppPages.register:
        return 'Новый пользователь';
      case AppPages.home:
        return 'Главная';
    }
  }
}
