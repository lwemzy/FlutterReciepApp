import 'package:flutter/material.dart';
import 'package:RecipeApp/widgets/nav_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  final Function setFilters;
  final Map<String, bool> savedFilters;

  const FiltersScreen({
    Key key,
    this.setFilters,
    this.savedFilters,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'veggie': false,
    'vegan': false,
  };

  @override
  Widget build(BuildContext context) {
    // mutate _filters map state
    if (widget.savedFilters.isNotEmpty) {
      _filters = widget.savedFilters;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.setFilters(_filters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SwitchListTile(
                title: Text(
                  'Gluten-Free',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('only include gluten free'),
                onChanged: (val) {
                  setState(() {
                    _filters['gluten'] = val;
                  });
                },
                value: _filters['gluten'],
              ),
              Divider(),
              SwitchListTile(
                title: Text(
                  'Lactose-Free',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('only include lactose free'),
                onChanged: (val) {
                  setState(() {
                    _filters['lactose'] = val;
                  });
                },
                value: _filters['lactose'],
              ),
              Divider(),
              SwitchListTile(
                title: Text(
                  'Vegetarian',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('only include vegetarian dishes'),
                onChanged: (val) {
                  setState(() {
                    _filters['veggie'] = val;
                  });
                },
                value: _filters['veggie'],
              ),
              Divider(),
              SwitchListTile(
                title: Text(
                  'vegan',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('only include vegan dishes'),
                onChanged: (val) {
                  setState(() {
                    _filters['vegan'] = val;
                  });
                },
                value: _filters['vegan'],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
