import 'package:flutter/material.dart';
import 'package:shop_app/models/meals.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadedInitState = false;

  @override
  void initState() {
    // ....
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitState) {
      final routesAgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryID = routesAgs['id'];
      categoryTitle = routesAgs['title'];
      _loadedInitState = true;
      displayMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryID))
          .toList();
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meals) => meals.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        // padding: EdgeInsets.all(15),
        itemCount: displayMeals.length,
        itemBuilder: (context, index) {
          var meal = displayMeals[index];
          return MealItem(
            id: meal.id,
            imageUrl: meal.imageUrl,
            title: meal.title,
            duration: meal.duration,
            affordability: meal.affordability,
            complexity: meal.complexity,
          );
        },
      ),
    );
  }
}
