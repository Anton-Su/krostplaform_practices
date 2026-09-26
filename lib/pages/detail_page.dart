import 'package:flutter/material.dart';
import 'package:practice_1/MoсkDataBase.dart';


class DetailPage extends StatelessWidget {
  final int id;
  const DetailPage({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    positions[id].path,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),),),
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
                  positions[id].description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            )
        )
    );
  }
}