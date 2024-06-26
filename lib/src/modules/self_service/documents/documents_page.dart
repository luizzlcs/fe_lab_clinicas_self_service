import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/model/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/widgets/document_box_widget.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/widget/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> with MessageViewMixin {
  final selfServiceController = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(selfServiceController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final documents = selfServiceController.model.documents;
    final totalHealfInsuranceCard =
        documents?[DocumentType.healthInsuranceCard]?.length ?? 0;
    final totalMedicalOrder =
        documents?[DocumentType.medicalOrder]?.length ?? 0;
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
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
                  Image.asset('assets/images/folder.png'),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'ADICIONAR DOCUMENTO',
                    style: LabClinicasTheme.subTitleSmallStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Selecione o documento que deseja salvar',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: LabClinicasTheme.blueColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: sizeOf.width * 0.8,
                    height: 150,
                    child: Row(
                      children: [
                        DocumentBoxWidget(
                          uploaded: totalHealfInsuranceCard > 0,
                          icon: Image.asset('assets/images/id_card.png'),
                          label: 'CARTEIRINHA',
                          totalFiles: totalHealfInsuranceCard,
                          onTap: () async {
                            final filePath = await Navigator.of(context)
                                .pushNamed('/self-service/documents/scan');
                            if (filePath != null && filePath != '') {
                              selfServiceController.registerDocument(
                                  DocumentType.healthInsuranceCard,
                                  filePath.toString());
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DocumentBoxWidget(
                          uploaded: totalMedicalOrder > 0,
                          icon: Image.asset('assets/images/document.png'),
                          label: 'PEDIDO MÉDICO',
                          totalFiles: totalMedicalOrder,
                          onTap: () async {
                            final filePath = await Navigator.of(context)
                                .pushNamed('/self-service/documents/scan');
                            if (filePath != null && filePath != '') {
                              selfServiceController.registerDocument(
                                  DocumentType.medicalOrder,
                                  filePath.toString());
                              setState(() {});
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible:
                        totalHealfInsuranceCard > 0 && totalMedicalOrder > 0,
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red)),
                            onPressed: () {
                              selfServiceController.clearDocuments();
                              setState(() {});
                            },
                            child: const Text(
                                textAlign: TextAlign.center, 'REMOVER TODAS'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: LabClinicasTheme.orangeColor),
                            onPressed: () async {
                              await selfServiceController.finalize();
                              // Navigator.of(context).pushNamed('/self-service/done');
                            },
                            child: const Text('PRÓXIMO'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
