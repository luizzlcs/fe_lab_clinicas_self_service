import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import 'package:fe_lab_clinicas_self_service_cb/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  PatientController({required PatientRepository repository})
      : _repository = repository;

  final PatientRepository _repository;
  PatientModel? patient;
  final _nextStep = signal<bool>(false);
  bool get nextStep => _nextStep();

  void goNextStep() {
    _nextStep.value = true;
  }

  Future<void> updanteAndNext(PatientModel model) async {
    final updateResult = await _repository.update(model);

    switch (updateResult) {
      case Left():
        showError('Erro ao chamar os dados do paciente, chame o atendente');
      case Right():
        showInfo('Paciente atualizado com sucesso');
        patient = model;
        goNextStep();
    }
  }
}
