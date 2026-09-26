import 'package:flutter/material.dart';
import 'package:practice_1/routes.dart';
import 'package:practice_1/widgets/text_field.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  void _toLogin(){
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  void _submit(String path) {
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
      Navigator.pushReplacementNamed(context, path);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Валидация не пройдена!'),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text(
          "Регистрация",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.orangeAccent,
            fontFamily: 'DancingScript',
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _emailController,
                    isProtected: false,
                    type: 'Email',
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _passwordController,
                    isProtected: true,
                    type: 'Password',
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: _passwordController,
                    isProtected: true,
                    type: 'ConfirmPassword',
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white, // цвет текста
                      fixedSize: Size(250, 100),
                    ),
                    onPressed: () => _submit(Routes.profile),
                    child: const Text("Зарегистрироваться", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Уже есть аккаунт? ', style: TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: () {
                    _toLogin();
                  },
                  child: const Text(
                    'Войдите',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}