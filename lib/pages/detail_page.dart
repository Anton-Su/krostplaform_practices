import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_1/Di/di.dart';
import 'package:practice_1/pages/myHomePage/bloc/detail/detail_bloc.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DetailBloc>()..add(LoadDetail(id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Пункт $id: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.orangeAccent,
              fontFamily: 'DancingScript',
            ),
          ),
        ),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailError) {
              return Center(child: Text(state.message));
            }
            if (state is DetailLoaded) {
              final position = state.position;
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          position.path,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Описание пункта:",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.orangeAccent,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      position.description,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
