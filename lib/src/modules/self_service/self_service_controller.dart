import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/model/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findpatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  var _model = const SelfServiceModel();

  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDataStepAndNext(String name, String lastName) {
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _step.forceUpdate(FormSteps.patient);
  }

  void debug(){
    print(_model.name);
    print(_model.lastName);
  }

  void clearForm() {
    _model = _model.clear();
  }
}