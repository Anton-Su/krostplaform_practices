import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ), //AppBar
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Интернет-магазины',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            //Text
            SizedBox(height: 30),
            Text(
              'Учёт товаров, категоризация, взаимодействие с покупателями и продавцами, обработка платежей, логистика, оповещения, модерация, дизайн',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            //Text
            SizedBox(height: 20),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/About Image.png',
                      width: 160,
                      height: 160,
                    ),
                    SizedBox(width: 40), // отступ между иконкой и текстом
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text('1) Заказать обувь', style: TextStyle(fontSize: 18)),
                        Text('2) Заказать игры', style: TextStyle(fontSize: 18)),
                        Text('3) Стать продавцом', style: TextStyle(fontSize: 18)),
                        Text('4) Быть красавчиком', style: TextStyle(fontSize: 18)),
                      ],)
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
                      size: 80.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 40), // отступ между иконкой и текстом
                    Text('Сулейкин А.М ИКБО-61-23', style: TextStyle(fontSize: 18)),
                  ],
                )
            ),
          ],
        ), //Column
      ), //Padding
    ); //Scaffold
  }
}
