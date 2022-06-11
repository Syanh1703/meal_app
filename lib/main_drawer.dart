import 'package:flutter/material.dart';
import './screen/filter_screen.dart';

class MainDrawer extends StatelessWidget{
  Widget _buildListTile (IconData icon, String title, VoidCallback tabHandler){
    return ListTile(
      leading: Icon(icon, size: 25,),
      title: Text(title, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoCondensed',
        fontSize: 24,
      ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('App Menu', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            ),
            ),
          ),
          //08_06 Headings in Drawer
          const SizedBox(
            height: 20,
          ),
          _buildListTile(Icons.restaurant, 'Meals', (){
              Navigator.of(context).pushNamed('/');
          }),
          _buildListTile(Icons.settings, 'Filter', () {
              Navigator.of(context).pushNamed(FilterScreen.filterRouteName);
          }),
        ],
      ),
    );
  }

}