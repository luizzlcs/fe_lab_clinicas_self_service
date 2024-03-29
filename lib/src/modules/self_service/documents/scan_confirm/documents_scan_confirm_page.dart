import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../../widget/lab_clinicas_self_service_app_bar.dart';

class DocumentsScanConfirmPage extends StatelessWidget {
   DocumentsScanConfirmPage({super.key});

  final controller = Injector.get<DocumentsScanConfirmController>();

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final foto = ModalRoute.of(context)!.settings.arguments as XFile;
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
            child: Column(
              children: [
                Image.asset('assets/images/foto_confirm_icon.png'),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'CONFIRA SUA FOTO',
                  style: LabClinicasTheme.subTitleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: sizeOf.width * .5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: DottedBorder(
                      dashPattern: [1, 10, 1, 3],
                      borderType: BorderType.RRect,
                      strokeWidth: 4,
                      color: LabClinicasTheme.orangeColor,
                      strokeCap: StrokeCap.square,
                      radius: Radius.circular(16),
                      child: Image.file(File(foto.path)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(textAlign: TextAlign.center, 'TIRAR OUTRA'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('SALVAR'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
