import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/bindings/lab_clinicas_application_bindings.dart';
import 'src/modules/auth/auth_module.dart';
import 'src/page/splashPage/splash_page.dart';

void main() {
  runZonedGuarded(() {
    runApp(const LabClinicasSelfServiceApp());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasSelfServiceApp extends StatelessWidget {
  const LabClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: "Lab Clinicas Auto Atendimento",
      bindings: LabClinicasApplicationBindings(),
      pageBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashPage(),
          path: '/',
        ),
      ],
      modules: [
        AuthModule(),
        HomeModule(),
      ],
      didStart: () {
        FlutterGetItBindingRegister.registerPermanentBinding('CAMERAS', [
          Bind.lazySingleton((i) => ''),
        ]);
      },
    );
  }
}
