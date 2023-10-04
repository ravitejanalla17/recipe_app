import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'App_bloc.dart';
import 'recipes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => RecipeBloc(),
        child: const RecipeListApp(),
      ),
    );
  }
}

class RecipeListApp extends StatelessWidget {
  const RecipeListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.fastfood,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Flutter Recipe App',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(204, 255, 149, 68),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/premium-photo/restaurant-cafe-coffee-shop-interior-with-people-abstract-blur-background_293060-17461.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const RecipeList(),
      ),
    );
  }
}
