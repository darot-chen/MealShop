import 'package:flutter/material.dart';
import 'package:shop_app/models/meals.dart';
import 'package:shop_app/widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('You donot have any favorite yet - add some favorites'),
        ),
      );
    } else {
      return ListView.builder(
        // padding: EdgeInsets.all(15),
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (context, index) {
          var meal = widget.favoriteMeals[index];
          return MealItem(
            id: meal.id,
            imageUrl: meal.imageUrl,
            title: meal.title,
            duration: meal.duration,
            affordability: meal.affordability,
            complexity: meal.complexity,
          );
        },
      );
    }
  }
}
