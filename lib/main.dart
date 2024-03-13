import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/bindings/lab_clinicas_application_bindings.dart';
import 'src/modules/auth/auth_module.dart';
import 'src/page/splashPage/splash_page.dart';


void main() {
  runApp(const LabClinicasSelfServiceApp());
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
      modules: [AuthModule()],
    );
  }
}


  