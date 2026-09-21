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
  final List <String> tasks = [
    'Заказать обувь',
    'Заказать игры',
    'Стать продавцом',
    'Продавать много и выгодно',
    'Стать красавчиком'
  ];

  final List<IconData> early_icons = [
    Icons.face,
    Icons.tag_faces,
    Icons.work,
    Icons.book,
    Icons.gamepad
  ];

  final List<IconData> later_icons = [
    Icons.face_2,
    Icons.garage,
    Icons.work_off,
    Icons.book_online,
    Icons.handyman
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
            SizedBox(height: 20),
            Flexible(child: Text(
              'Учёт товаров, категоризация, взаимодействие с покупателями и продавцами, обработка платежей, логистика, оповещения, модерация, дизайн',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: _counterInc,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        path[counter % path.length],
                        width: 180,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: _counterInc,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        path[(counter + 1) % path.length],
                        width: 180,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(child: ListTile(
                  title: Text(tasks[index], style: TextStyle(fontSize: 18), textAlign: .center,),
                  leading: Icon(early_icons[index]),
                  trailing: Icon(later_icons[index]),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Нажато ${index + 1} пунктик'),
                        behavior: SnackBarBehavior.fixed,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                );
              },
            ),),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 80.0,
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
