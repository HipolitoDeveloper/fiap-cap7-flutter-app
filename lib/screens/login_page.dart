import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'register_page.dart';  // Import the register page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Encontre o meio de transporte ideal para você',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "E-mail",
                          hintText: "Digite aqui seu e-mail",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu e-mail';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Senha",
                          hintText: "Digite aqui sua senha",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity, // Makes the button expand full width
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16), // Increase button size
                          backgroundColor: Colors.blue, // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Por favor, preencha todos os campos')),
                            );
                          }
                        },
                        child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(), // Go to registration page
                          ),
                        );
                      },
                      child: const Text('Não tem uma conta? Cadastre-se aqui!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
