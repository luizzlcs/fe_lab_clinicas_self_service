import 'package:camera/camera.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../widget/lab_clinicas_self_service_app_bar.dart';

class DocumentsScanPage extends StatefulWidget {
  const DocumentsScanPage({super.key});

  @override
  State<DocumentsScanPage> createState() => _DocumentsScanPageState();
}

class _DocumentsScanPageState extends State<DocumentsScanPage> {
  late CameraController cameraController;

  @override
  void initState() {
    cameraController = CameraController(
        Injector.get<List<CameraDescription>>().first,
        ResolutionPreset.ultraHigh);
    super.initState();
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
            child: Column(
              children: [
                Image.asset('assets/images/cam_icon.png'),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'TIRAR A FOTO AGORA',
                  style: LabClinicasTheme.subTitleSmallStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Posicione o documento dentro do quatro a baixo e aperte o botão para tirar a foto.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LabClinicasTheme.blueColor),
                ),
                const SizedBox(
                  height: 18,
                ),
                FutureBuilder(
                  future: cameraController.initialize(),
                  builder: (context, snapshot) {
                    switch (snapshot) {
                      case AsyncSnapshot(
                          connectionState:
                              ConnectionState.waiting || ConnectionState.active
                        ):
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case AsyncSnapshot(connectionState: ConnectionState.done):
                        if (cameraController.value.isInitialized){
                          return CameraPreview(cameraController);
                        }
                    }
                    return Center(child: Text('Erro ao carregar câmera.'),);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
