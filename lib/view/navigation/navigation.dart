import 'package:dentist_shop/view/account/account.dart';
import 'package:dentist_shop/view/categories/categories.dart';
import 'package:dentist_shop/view/favorites/favorites.dart';
import 'package:dentist_shop/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:dentist_shop/constants/colors.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Map<String, dynamic>> _actions = [
    {
      "title": "Home",
      "icon": Icons.home_outlined,
      "selectedIcon": Icons.home,
    },
    {
      "title": "Categorias",
      "icon": Icons.bubble_chart_outlined,
      "selectedIcon": Icons.bubble_chart
    },
    {
      "title": "Anunciar",
      "icon": Icons.add_circle_outline_rounded,
      "selectedIcon": Icons.add_circle_rounded
    },
    {
      "title": "Favoritos",
      "icon": Icons.favorite_border_rounded,
      "selectedIcon": Icons.favorite_rounded
    },
    {
      "title": "Conta",
      "icon": Icons.person_outline,
      "selectedIcon": Icons.person
    },
  ];

  final List<Widget> _screens = [
    const Home(),
    const Categories(),
    _buildScreen('Anunciar', Colors.transparent),
    const Favorites(),
    const Account(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width >= 640;

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen) _buildNavigationRail(),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWideScreen ? null : _buildBottomNavigationBar(),
    );
  }

  static Widget _buildScreen(String title, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }

  void _moveToPage(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      unselectedItemColor: AppColors.unselectedColor,
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        _moveToPage(index);
      },
      items: _actions.map((action) {
        return BottomNavigationBarItem(
          icon: Icon(action['icon']),
          activeIcon: Icon(action['selectedIcon']),
          label: action['title'],
        );
      }).toList(),
    );
  }

  NavigationRail _buildNavigationRail() {
    return NavigationRail(
      elevation: 8,
      onDestinationSelected: (int index) {
        _moveToPage(index);
      },
      selectedIndex: _selectedIndex,
      destinations: _actions.map((action) {
        return NavigationRailDestination(
          icon: Icon(action['icon']),
          selectedIcon: Icon(action['selectedIcon']),
          label: Text(action['title']),
        );
      }).toList(),
      labelType: NavigationRailLabelType.all,
      backgroundColor: Colors.white,
      indicatorColor: Colors.transparent,
      selectedLabelTextStyle: const TextStyle(color: AppColors.primaryColor),
      selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
      unselectedLabelTextStyle:
          const TextStyle(color: AppColors.unselectedColor),
      unselectedIconTheme:
          const IconThemeData(color: AppColors.unselectedColor),
    );
  }
}
