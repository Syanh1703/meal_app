
import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../main_drawer.dart';
import '../screen/favs_screen.dart';
import '../screen/categories_screen.dart';

class TabScreen extends StatefulWidget{

  List<Meals> favMeals;
  TabScreen(this.favMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>{

  //Define tabs
  List<Map<String, dynamic>> _tabs = [];

  int _selectedTabIndex = 0;

  @override
  void initState() {
    _tabs  = [
      {'tab': CategoriesScreen(), 'title': 'Categories'},
      {'tab': FavouriteTab(widget.favMeals), 'title': 'Favourite'},
    ];
    super.initState();
  }

  void _selectedTab(int index){
    setState(() {
      _selectedTabIndex = index;
    });
  }

  final String mealTab = "Meal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tabs[_selectedTabIndex]['title'], style: const TextStyle(
            fontSize: 25
          ),
          ),
        ),
        drawer: MainDrawer(),
        body: _tabs[_selectedTabIndex]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.orange,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTabIndex,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.category),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Category'),
          BottomNavigationBarItem(icon: const Icon(Icons.star),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Favourite')
        ],
      ),
      );
  }
  
}