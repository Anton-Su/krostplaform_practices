import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_1/pages/myHomePage/block/my_home_bloc.dart';
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
    final List<Widget> screens = [
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
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
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
      body: IndexedStack(index: _selectedIndex, children: screens),
    );
  }
}

class HomeClick extends StatelessWidget {
  final String title;

  const HomeClick({super.key, required this.title});

  final List<IconData> earlyIcons = const [
    Icons.face,
    Icons.tag_faces,
    Icons.work,
    Icons.book,
    Icons.gamepad,
  ];

  final List<IconData> laterIcons = const [
    Icons.face_2,
    Icons.garage,
    Icons.work_off,
    Icons.book_online,
    Icons.handyman,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.orangeAccent,
            fontFamily: 'DancingScript',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<MyHomeBloc, MyHomeState>(
        builder: (context, state) {
          if (state is MyHomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MyHomeError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MyHomeBloc>().add(
                        const LoadPositionsEvent(),
                      );
                    },
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            );
          }
          if (state is MyHomeLoaded) {
            final positions = state.positions;
            final counter = state.counter;
            final width = MediaQuery.sizeOf(context).width;
            final int horizontalCount = width > 600 ? 2 : 1;
            final double horizontalChildAspectRatio = width > 600 ? 10 : 5;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Интернет-магазины',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Flexible(
                    child: Text(
                      'Учёт товаров, категоризация, взаимодействие с покупателями и продавцами, обработка платежей, логистика, оповещения, модерация, дизайн',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: positions.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<MyHomeBloc>().add(const UserTapped());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              positions[(counter + index) % positions.length].path,
                              width: 180,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: GridView.builder(
                      itemCount: positions.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: horizontalCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: horizontalChildAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              positions[index].briefDescription,
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            leading: Icon(earlyIcons[index]),
                            trailing: Icon(laterIcons[index]),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "${Routes.details}/$index",
                              );
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
                    ),
                  ),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 80.0, color: Colors.blue),
                        SizedBox(width: 40),
                        Flexible(
                          child: Text(
                            'Cтудент МИРЭА Сулейкин А.М ИКБО-61-23',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          // MyHomeInitial
          return const Center(child: Text('Данные ещё не загружены'));
        },
      ),
    );
  }
}
