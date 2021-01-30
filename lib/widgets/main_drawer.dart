import 'package:flutter/material.dart';
import 'package:shop_app/screens/filters_screen.dart';

class  MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(top: 20, left: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 15),
          buildListTile(
            context,
            'Meals',
            Icon(Icons.restaurant),
            () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          buildListTile(
            context,
            'Filters',
            Icon(Icons.settings),
            (){
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, String title, Icon icon, Function onTap) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
