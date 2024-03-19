import 'dart:ffi';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(actions: [
        PopupMenuButton<int>(
          child: IconPopupMenuWidget(),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 1,
                child: Text('Iniciar Terminal'),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text('Finalizar Terminal'),
              ),
            ];
          },
        )
      ]),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(bottom: 260),
          padding:  EdgeInsets.all(40),
          width: sizeOf.width * .8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Bem Vindo!",
                style: LabClinicasTheme.titleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: sizeOf.width * .8,
                child: ElevatedButton(onPressed: (){}, child: Text('INICIAR TERMINAL')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
