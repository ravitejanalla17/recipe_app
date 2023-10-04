import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['label']),
        backgroundColor: const Color.fromARGB(255, 139, 96, 125),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/premium-photo/restaurant-cafe-coffee-shop-interior-with-people-abstract-blur-background_293060-17461.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(recipe['image'])),
              const SizedBox(height: 25),
              Center(
                  child: Text('Source: ${recipe['source']}',
                      style: const TextStyle(fontSize: 15))),
              Center(
                  child: Text('Yield: ${recipe['yield']} servings',
                      style: const TextStyle(fontSize: 15))),
              Center(
                  child: Text('Calories: ${recipe['calories']} kcal',
                      style: const TextStyle(fontSize: 15))),
              Center(
                  child: Text('Total Weight: ${recipe['totalWeight']} g',
                      style: const TextStyle(fontSize: 15))),
              const SizedBox(height: 50),
              const Text(
                'INGREDIENTS :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0;
                      i < (recipe['ingredients'] as List).length;
                      i++)
                    _buildIngredientCard(i + 1, recipe['ingredients'][i]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientCard(int index, Map<String, dynamic> ingredient) {
    final text = ingredient['text'];
    final quantity = ingredient['quantity'];
    final measure = ingredient['measure'];
    final food = ingredient['food'];
    final weight = ingredient['weight'];
    final foodCategory = ingredient['foodCategory'];
    final image = ingredient['image'];

    return Card(
      margin: const EdgeInsets.only(bottom: 50),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('=> Ingredient $index:',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 185, 78, 39))),
            const SizedBox(height: 20),
            Text('$text', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('QUANTITY:  $quantity $measure'),
            const SizedBox(height: 8.0),
            Text('FOOD:  $food'),
            const SizedBox(height: 8.0),
            Text('WEIGHT:   $weight g'),
            const SizedBox(height: 8.0),
            Text('FOOD TYPE:  $foodCategory'),
            const SizedBox(height: 8.0),
            Image.network(image),
          ],
        ),
      ),
    );
  }
}
