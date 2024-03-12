import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/bindings/lab_clinicas_application_bindings.dart';
import 'package:fe_lab_clinicas_self_service/src/page/splashPage/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';


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
    );
  }
}


  