import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      this.child,
      this.actions = const [],
      this.isShowDrawerButton = false,
      this.scaffoldKey,
      this.bodyPadding,
      this.title,
      this.fab});

  final Widget? child;
  final FloatingActionButton? fab;
  final List<Widget> actions;
  final bool isShowDrawerButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final EdgeInsets? bodyPadding;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: fab,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: title,
        actions: actions,
      ),
      body: Padding(
          padding: bodyPadding ??
              EdgeInsets.symmetric(horizontal: context.sizesExtenstion.medium),
          child: child),
      drawer: isShowDrawerButton ? const AppDrawer() : null,
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
          context.goNamed(Routes.foodSelectionList);
        } else if (index == 2) {
          context.goNamed(Routes.foodList);
        }
        // else if (index == 3) {
        //   context.goNamed(Routes.profile);
        // }
      },
      selectedIndex: _selectedIndex,
      children: [
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        const NavigationDrawerDestination(
          icon: Icon(Ionicons.restaurant),
          label: Text('یادداشت خوراکِ صرف شده'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Ionicons.pie_chart),
          label: Text('تحلیل خوراکی‌های ثبت شده'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Ionicons.fish),
          label: Text('لیست خوراکی‌های قابل جستجو'),
        ),
        // const NavigationDrawerDestination(
        //   icon: Icon(Ionicons.person),
        //   label: Text('نمایه کاربر و روند پیشرفت'),
        // ),
        SizedBox(
          height: context.sizesExtenstion.extraLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'محتوای برنامه متعلق به تیم توسعه دهنده تندرست می باشد',
            style: context.themeData.textTheme.labelMedium,
          ),
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
      case Routes.foodSelectionList:
        return 1;
      case Routes.foodList:
        return 2;
      // case Routes.profile:
      //   return 3;

      default:
        throw Exception('Undefined location');
    }
  }
}
