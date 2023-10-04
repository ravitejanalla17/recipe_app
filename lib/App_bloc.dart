import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'recipe_actions.dart';
import 'recipe_status.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitialState());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is FetchRecipesEvent) {
      yield RecipeLoadingState();

      try {
        final recipes = await _fetchRecipes();
        yield RecipeLoadedState(recipes: recipes);
      } catch (e) {
        yield RecipeErrorState(error: 'Sorry, there was an error :(');
      }
    }
  }

  Future<List<Map<String, dynamic>>> _fetchRecipes() async {
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/search?q=salad&app_id=f30546b8&app_key=0576e775aa80dd71126508436d292b8f&health=alcohol-free'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['hits']
          .map((dynamic hit) => (hit as Map<String, dynamic>)['recipe']));
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
