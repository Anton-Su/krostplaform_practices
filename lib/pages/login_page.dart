import 'package:flutter/material.dart';
import 'package:practice_1/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _passwordController2.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;
      }
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Данные успешно прошли проверку'),
        ),
      );
      Navigator.pushNamed(context, '/profile');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        title: const Text(
          "Добро пожаловать!\nВойдите в свой аккаунт\nИли создайте новый",
          style: TextStyle(
            fontSize: 30,
            color: Colors.orangeAccent,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    isProtected: false,
                    controller: _nameController,
                    type: 'Name',
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    controller: _emailController,
                    isProtected: false,
                    type: 'Email',
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    controller: _passwordController,
                    isProtected: true,
                    type: 'Password',
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    controller: _passwordController,
                    isProtected: true,
                    type: 'ConfirmPassword',
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [Text('Забыли пароль?')],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white, // цвет текста
                    ),
                    onPressed: () => _submit(),
                    child: const Text("Войти", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text('Нет аккаунта? ', style: TextStyle(fontSize: 20)), Text('Зарегистрируйтесь', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), )],
            ),
          ],
        ),
      ),
    );
  }
}