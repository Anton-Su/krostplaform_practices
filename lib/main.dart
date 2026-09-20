import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'The Antoha MarketPlace'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(
            fontSize: 30,
            color: Colors.orangeAccent,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ), //AppBar
        body: HomeClick()); //Scaffold
  }

}


class HomeClick extends StatefulWidget {
  const HomeClick({super.key});

  @override
  State<HomeClick> createState() {
    return _MyHomeClickPage();
  }

}


class _MyHomeClickPage extends State<HomeClick> {
  int counter = 0;
  final List<String> path = [
    'assets/images/about all.png',
    'assets/images/about family.png',
    'assets/images/about high-tech.png',
    'assets/images/about home.png',
    'assets/images/about study.png'
  ];

  void _counterInc() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Интернет-магазины',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(child: ElevatedButton(
              onPressed: () {
                _counterInc();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Поменять'),)
            ),
            SizedBox(height: 20),
            Flexible(child: Text(
              'Учёт товаров, категоризация, взаимодействие с покупателями и продавцами, обработка платежей, логистика, оповещения, модерация, дизайн',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),),
            //Text
            SizedBox(height: 20),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _counterInc,
                      child: Image.asset(
                        path[counter % path.length],
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(width: 10), // отступ между иконкой и текстом
                    Flexible(child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text('1) Заказать обувь',
                            style: TextStyle(fontSize: 18)),
                        Text(
                            '2) Заказать игры', style: TextStyle(fontSize: 18)),
                        Text('3) Стать продавцом',
                            style: TextStyle(fontSize: 18)),
                        Text('4) Быть красавчиком',
                            style: TextStyle(fontSize: 18)),
                      ],))
                  ],
                )
            ),
            SizedBox(height: 40),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 100.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 40), // отступ между иконкой и текстом
                    Flexible(child: Text(
                        'Cтудент МИРЭА Сулейкин А.М ИКБО-61-23',
                        style: TextStyle(fontSize: 20)),)
                  ],
                )
            ),
          ],
        ), //Column
      );
  }
}
