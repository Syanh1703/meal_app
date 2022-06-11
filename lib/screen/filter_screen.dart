
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget{

  static const filterRouteName = '/filter';

  //10_06: Take out the function from dart
  Function saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);


  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  initState(){
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  //Builder subtitle
  Widget _buildSubtitle(String sub){
    return Text(
      'Only $sub meals appear on your screen'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters', style: TextStyle(
          fontSize: 20,
        ),
        ),
        actions: <Widget>[
          IconButton(onPressed:() {
            final selectedFilters = {
              'gluten' : _isGlutenFree,
              'lactose': _isLactoseFree,
              'vegan' : _isVegan,
              'vegetarian': _isVegetarian,
            };
            widget.saveFilters(selectedFilters);

            }, icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Meal selection', style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              SwitchListTile(value: _isGlutenFree, onChanged: (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              },
              title: const Text('Gluten free'),
                subtitle: _buildSubtitle('Gluten free'),
              ),

              SwitchListTile(value: _isLactoseFree, onChanged: (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              },
                title: const Text('Lactose free'),
                subtitle: _buildSubtitle('Lactose free'),
              ),
              SwitchListTile(value: _isVegan, onChanged: (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              },
                title: const Text('Vegan free'),
                subtitle: _buildSubtitle('Vegan free'),
              ),
              SwitchListTile(value: _isVegetarian, onChanged: (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              },
                title: const Text('Vegetarian'),
                subtitle: _buildSubtitle('Vegetarian'),
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}