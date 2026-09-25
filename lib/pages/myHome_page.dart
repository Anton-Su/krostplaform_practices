import 'package:flutter/material.dart';
import 'package:practice_1/pages/profile_page.dart';
import 'package:practice_1/routes.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeClick(title: widget.title),
      const ProfilePage(),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.deepPurple.shade50,
        indicatorColor: Colors.deepPurple.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }
}

class HomeClick extends StatefulWidget {
  final String title;
  const HomeClick({super.key, required this.title});

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

  final List<IconData> earlyIcons = [
    Icons.face,
    Icons.tag_faces,
    Icons.work,
    Icons.book,
    Icons.gamepad
  ];

  final List<IconData> laterIcons = [
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
    final width = MediaQuery.sizeOf(context).width;
    final int horizontalCount = width > 600 ? 2 : 1;
    final double horizontalChildAspectRatio = width > 600 ? 10 : 5;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.orangeAccent,
              fontFamily: 'DancingScript',
            ),
          ),
        ),
        body:
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
              SizedBox(
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
              SizedBox(height: 15),
              Expanded(child: GridView.builder(
                itemCount: tasks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: horizontalCount,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: horizontalChildAspectRatio),
                itemBuilder: (context, index) {
                  return Card(child: ListTile(
                    title: Text(tasks[index], style: TextStyle(fontSize: 18),
                      textAlign: .center,),
                    leading: Icon(earlyIcons[index]),
                    trailing: Icon(laterIcons[index]),
                    onTap: () {
                      // переброска на другую страницу


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
                },),),
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
                          style: TextStyle(fontSize: 17)),)
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}