import 'package:flutter/material.dart';
import 'package:practice_1/routes.dart';

class LoadingPage extends StatefulWidget {
  final String title;
  const LoadingPage({super.key, required this.title});
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //Имитация инициализации (загрузка настроек, БД)
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.orangeAccent,
          fontFamily: 'DancingScript',
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
      body: Center(child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/images/icon app.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),),)
    );
  }
}
