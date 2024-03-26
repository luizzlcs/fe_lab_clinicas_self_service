import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import '../widget/lab_clinicas_self_service_app_bar.dart';

@JsonSerializable()
class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> with PatientFormcontroller {
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: EdgeInsets.only(top: 18),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/images/check_icon.png'),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Cadastro encontrado',
                      style: LabClinicasTheme.titleSmallStyle),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Confirma os dados do seu cadastro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LabClinicasTheme.blueColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: nameEC,
                    decoration: InputDecoration(
                      label: Text('Nome paciente'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: phoneEC,
                    decoration: InputDecoration(
                      label: Text('Telefone de contato'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: documentEC,
                    decoration: InputDecoration(
                      label: Text('Digite seu CPF'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: cepEC,
                    decoration: InputDecoration(
                      label: Text('CEP'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          controller: streetEC,
                          decoration: InputDecoration(
                            label: Text('Endereço'),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: numberEC,
                          decoration: InputDecoration(
                            label: Text('Nº'),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          controller: complementEC,
                          decoration: InputDecoration(
                            label: Text('complemento'),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: stateEC,
                          decoration: InputDecoration(
                            label: Text('UF'),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cityEC,
                          decoration: InputDecoration(
                            label: Text('Cidade'),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: districtEC,
                          decoration: InputDecoration(
                            label: Text('Bairro'),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: guardianEC,
                    decoration: InputDecoration(
                      label: Text('Responsável'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller:guardianIdentificationNumberEC,
                    decoration: InputDecoration(
                      label: Text('Documento de identificação'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 118,
                          child: OutlinedButton(
                              onPressed: () {}, child: Text('EDITAR'))),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('CONTINUAR')))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
