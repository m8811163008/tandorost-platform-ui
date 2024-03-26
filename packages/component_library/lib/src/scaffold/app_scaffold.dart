import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.child,
    this.actions = const [],
    this.isShowDrawerButton = false,
    this.scaffoldKey,
  });

  final Widget? child;
  final List<Widget> actions;
  final bool isShowDrawerButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: actions
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: e,
                ))
            .toList(),
      ),
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.sizesExtenstion.medium),
          child: child),
      drawer: isShowDrawerButton ? AppDrawer() : null,
    );
  }
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    setState(() {
      _selectedIndex = GoRouterState.of(context).uri.toString().toIndex();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 0) {
          context.goNamed(Routes.foodSelection);
        } else if (index == 1) {
          context.goNamed(Routes.foodList);
        }
      },
      selectedIndex: _selectedIndex,
      children: [
        NavigationDrawerDestination(
          icon: Icon(Ionicons.restaurant),
          label: Text('یادداشت غذای صرف شده'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Ionicons.fish),
          label: Text('غذاها'),
        ),
      ],
    );
  }
}

extension on String {
  int toIndex() {
    switch (this) {
      case Routes.foodSelection:
        return 0;
      case Routes.foodList:
        return 1;

      default:
        throw Exception('Undefined location');
    }
  }
}
