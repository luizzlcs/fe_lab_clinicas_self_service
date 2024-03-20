import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PatientPage extends StatelessWidget {

  const PatientPage({ super.key });

   @override
   Widget build(BuildContext context) {
    final patient = Injector.get<SelfServiceController>().debug();
       return Scaffold(
           appBar: AppBar(title: const Text('Patient'),),
           body: Container(),
       );
  }
}