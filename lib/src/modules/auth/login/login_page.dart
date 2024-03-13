import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),              
              child: Column(
                children: [
                  Text('Login'),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: sizeOf.width * 0.8,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Entrar'),
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
