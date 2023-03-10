import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../state_manager/app_state_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nrp = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    width: 350,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _nrp,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: appStateManager.loadingLogin
                          ? null
                          : () {
                              appStateManager.login(
                                  _nrp.text, _password.text, context);
                            },
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        context.push('/register');
                      },
                      child: const Text('Register')),
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
