import 'package:flutter/material.dart';
import 'package:shop_app/models/meals.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/screens/favorite_screen.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class TabsBarScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsBarScreen(this.favoriteMeals);
  @override
  _TabsBarScreenState createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Your favorites',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
