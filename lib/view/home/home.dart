import 'package:dentist_shop/view/home/widgets/home_list.dart';
import 'package:dentist_shop/view/home/widgets/home_search.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        Widget page;

        switch (settings.name) {
          case '/search':
            page = const HomeSearch();
            break;
          default:
            page = const HomeList();
        }
        return MaterialPageRoute(
          builder: (_) => page,
        );
      },
    );
  }
}
