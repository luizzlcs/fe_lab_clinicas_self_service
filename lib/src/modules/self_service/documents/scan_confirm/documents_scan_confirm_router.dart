import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'documents_scan_confirm_controller.dart';

class DocumentsScanConfirmRouter extends FlutterGetItModulePageRouter {
  const DocumentsScanConfirmRouter({super.key});

  @override
  List<Bind<Object>> get bindings =>
      [Bind.lazySingleton((i) => DocumentsScanConfirmController())];

  @override
  WidgetBuilder get view => (_) => DocumentsScanConfirmPage();
}
