import 'package:flutter/material.dart';
import 'package:RecipeApp/models/meal.dart';
import 'package:RecipeApp/screens/favourite_screen.dart';
import 'package:RecipeApp/widgets/nav_drawer.dart';

import 'category_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favorites;

  const TabScreen({Key key, this.favorites}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  PageController _pageController;
  int _currentIndex = 0;
  // String _title = 'Food Categories';

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(_currentIndex == 0 ? 'Food Categories' : 'Favorite Foods'),
        ),
        drawer: NavigationDrawer(),
        body: PageView(
          onPageChanged: _changePage,
          controller: _pageController,
          children: <Widget>[
            CategoryScreen(),
            FavoriteScreen(
              faves: widget.favorites,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _changePage(index);
            navigationTapped(index);
          },
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Icon(Icons.star),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: Container(
                        color: Colors.red,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                          child: Text(
                            '${widget.favorites.length}',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              title: Text('Favorites'),
            )
          ],
        ),
      ),
    );
  }
}
