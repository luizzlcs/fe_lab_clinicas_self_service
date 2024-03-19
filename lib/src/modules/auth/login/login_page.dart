import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final controller = Injector.get<LoginController>();

  @override
  void initState() {
    messageListener(controller);
    effect((){
      if(controller.logged){
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: sizeOf.height),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_login.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(40),
              constraints: BoxConstraints(maxWidth: sizeOf.width * 0.8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: LabClinicasTheme.titleStyle,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ]),
                      decoration: InputDecoration(
                        label: Text('E-mail'),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Watch(
                      (_) {
                        return TextFormField(
                          obscureText: controller.obscurePassword,
                          controller: passwordEC,
                          validator:
                              Validatorless.required('Senha obrigatória'),
                          decoration: InputDecoration(
                            label: Text('Password'),
                            suffixIcon: IconButton(
                              onPressed: () => controller.obscureToggle(),
                              icon: controller.obscurePassword
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: sizeOf.width * 0.8,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid =
                              formKey.currentState?.validate() ?? false;

                          if (valid) 
                          {
                            controller.login(emailEC.text, passwordEC.text);
                          }
                        },
                        child: const Text('Entrar'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
