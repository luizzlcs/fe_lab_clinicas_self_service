import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DonePage extends StatelessWidget {
  final selfServiceController = Injector.get<SelfServiceController>();
  DonePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);


    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/stroke_check.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'SUA SENHA É',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 218,
                    minHeight: 48,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: LabClinicasTheme.orangeColor,
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      selfServiceController.password,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'AGUARDE!\n',
                        style: TextStyle(
                            color: LabClinicasTheme.blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Sua senha será chamada no painel',
                        style: TextStyle(
                          color: LabClinicasTheme.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Imprimir senha',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Senha via SMS',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: LabClinicasTheme.orangeColor),
                    onPressed: () {
                      selfServiceController.restartProcess();
                    },
                    child: const Text('FINALIZAR'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
