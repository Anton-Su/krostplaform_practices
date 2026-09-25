import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Пункт $title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.orangeAccent,
              fontFamily: 'DancingScript',
            ),
          ),
        ),
        body: Column(
            children: [
              const SizedBox(height: 20),
              Center(child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/icon app.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),),),
              const SizedBox(height: 10),
              Text(
                "Описание  $title",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.orangeAccent,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
        )
    );
  }
}