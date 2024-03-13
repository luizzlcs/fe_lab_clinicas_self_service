import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../../repositories/user/user_repository_impl.dart';
import 'login/login_router.dart';

class AuthModule extends FlutterGetItModule {
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepositoryImpl>(
            (i) => UserRepositoryImpl(restClient: i()))
      ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/login': (_) => LoginRouter(),
      };
}
