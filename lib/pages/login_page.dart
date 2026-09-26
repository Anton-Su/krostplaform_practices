import 'package:flutter/material.dart';
import 'package:practice_1/routes.dart';
import 'package:practice_1/widgets/text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toRegister(String path){
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, path);
  }

  void _submit(String path) {
    if (_formKey.currentState?.validate() ?? false) {
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
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [Text('Забыли пароль?')],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white, // цвет текста
                      fixedSize: Size(250, 100),
                    ),
                    onPressed: () => _submit(Routes.info),
                    child: const Text("Войти", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Нет аккаунта? ', style: TextStyle(fontSize: 20)),
                Flexible(child: GestureDetector(
                  onTap: () {
                    _toRegister(Routes.register);
                  },
                  child: const Text(
                    'Зарегистрируйтесь',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}