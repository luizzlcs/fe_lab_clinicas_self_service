import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';
import '../../../model/self_service_model.dart';
import '../widget/lab_clinicas_self_service_app_bar.dart';

@JsonSerializable()
class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with PatientFormcontroller, MessageViewMixin {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formKey = GlobalKey<FormState>();
  final controller = Injector.get<PatientController>();

  late bool patientFound;
  late bool enabledForm;

  @override
  void initState() {
    final SelfServiceModel(:patient) = selfServiceController.model;
    messageListener(controller);

    patientFound = patient != null;
    enabledForm = !patientFound;
    initializeForm(patient);

    effect(() {
      if (controller.nextStep) {
        selfServiceController.updatePatientAndGoDocument(controller.patient);
      }
    });

    super.initState();
  }

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
                  Visibility(
                    visible: patientFound,
                    replacement: Image.asset('assets/images/lupa_icon.png'),
                    child: Image.asset('assets/images/check_icon.png'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Visibility(
                    visible: patientFound,
                    replacement: Text(
                      textAlign: TextAlign.center,
                      'Cadastro não encontrado',
                      style: LabClinicasTheme.titleSmallStyle,
                    ),
                    child: Text('Cadastro encontrado',
                        style: LabClinicasTheme.titleSmallStyle),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Visibility(
                    visible: patientFound,
                    replacement: Text(
                      'Preencha o formulário abaixo para fazer o seu cadastro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: LabClinicasTheme.blueColor,
                      ),
                    ),
                    child: Text(
                      'Confirma os dados do seu cadastro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: LabClinicasTheme.blueColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    readOnly: !enabledForm,
                    controller: nameEC,
                    validator: Validatorless.required('Nome obrigatório'),
                    decoration: InputDecoration(
                      label: Text('Nome paciente'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    readOnly: !enabledForm,
                    controller: emailEC,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório!'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    readOnly: !enabledForm,
                    controller: phoneEC,
                    keyboardType: TextInputType.phone,
                    validator: Validatorless.required('Telefone obrigatório'),
                    decoration: InputDecoration(
                      label: Text('Telefone de contato'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    readOnly: !enabledForm,
                    controller: documentEC,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    validator: Validatorless.required('CPF obrigatório'),
                    decoration: InputDecoration(
                      label: Text('Digite seu CPF'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    readOnly: !enabledForm,
                    controller: cepEC,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter()
                    ],
                    validator: Validatorless.required('CEP obrigatório'),
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
                          readOnly: !enabledForm,
                          controller: streetEC,
                          validator:
                              Validatorless.required('Endereço obrigatório'),
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
                          readOnly: !enabledForm,
                          controller: numberEC,
                          validator:
                              Validatorless.required('Número obrigatório'),
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
                          readOnly: !enabledForm,
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
                          readOnly: !enabledForm,
                          controller: stateEC,
                          validator:
                              Validatorless.required('Estado obrigatório'),
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
                          readOnly: !enabledForm,
                          controller: cityEC,
                          validator:
                              Validatorless.required('Cidade obrigatória'),
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
                          readOnly: !enabledForm,
                          controller: districtEC,
                          validator:
                              Validatorless.required('Bairro obrigatório'),
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
                    readOnly: !enabledForm,
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
                    readOnly: !enabledForm,
                    controller: guardianIdentificationNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      label: Text('Documento de identificação'),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: !enabledForm,
                    replacement: SizedBox(
                      width: sizeOf.width * .8,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid =
                              formKey.currentState?.validate() ?? false;
                          if (valid) {
                            if(patientFound){
                              controller.updanteAndNext(updatePatient(
                                selfServiceController.model.patient!));
                            }else{
                              // Cadastro!!!
                              controller.saveAndNext(createPatientRegister());
                            }
                            
                          }
                        },
                        child: Visibility(
                          visible: !patientFound,
                          replacement: Text('SALVAR E CONTINUAR'),
                          child: Text('CADASTRAR'),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 118,
                            child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    enabledForm = true;
                                  });
                                },
                                child: Text('EDITAR'))),
                        const SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.patient =
                                      selfServiceController.model.patient;
                                  controller.goNextStep();
                                },
                                child: Text('CONTINUAR')))
                      ],
                    ),
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
