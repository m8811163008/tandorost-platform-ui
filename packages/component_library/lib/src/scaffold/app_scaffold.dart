import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      this.child,
      this.actions = const [],
      this.isShowDrawerButton = false,
      this.bodyPadding,
      this.title,
      this.fab});

  final Widget? child;
  final Widget? fab;
  final List<Widget> actions;
  final bool isShowDrawerButton;

  final EdgeInsets? bodyPadding;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

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
      bottomNavigationBar:
          isShowDrawerButton ? const BottomNavigationBar() : null,
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
      _selectedIndex = GoRouterState.of(context).uri.toString().toDrawerIndex();
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
        } else if (index == 3) {
          context.goNamed(Routes.profile);
        } else if (index == 4) {
          context.goNamed(Routes.strengthTraining);
        } else if (index == 5) {
          context.goNamed(Routes.vo2maxCalculator);
        }
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
        const NavigationDrawerDestination(
          icon: Icon(Ionicons.person),
          label: Text('پروفال کاربر و روند پیشرفت'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Ionicons.fitness),
          label: Text('افزایش ماهیچه و کاهش چربی'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Ionicons.fitness),
          label: Text('محاسبه حداکثر چربی سوزی'),
        ),
        SizedBox(
          height: context.sizesExtenstion.extraLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'محتوای برنامه متعلق به شرکت ویرا سیستم پایدار پارس شماره ثبت 539849 تیم توسعه دهنده تندرست می باشد. شماره پشتیبانی 09212805230',
            style: context.themeData.textTheme.labelMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(
            child: Text(
              'شماره پشتیبانی 09212805230',
              style: context.themeData.textTheme.labelMedium,
            ),
            onPressed: () async {
              final url = Uri.tryParse('tel:09212805230');
              if (url == null) return;
              try {
                await launchUrl(url);
              } catch (_, __) {}
            },
          ),
        ),
      ],
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    setState(() {
      _selectedIndex =
          GoRouterState.of(context).uri.toString().toBottomNavigationIndex();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (index) {
        if (index == 0) {
          context.goNamed(Routes.foodSelection);
        } else if (index == 1) {
          context.goNamed(Routes.foodSelectionList);
        } else if (index == 2) {
          context.goNamed(Routes.profile);
        } else if (index == 3) {
          context.goNamed(Routes.strengthTraining);
        }
      },
      selectedIndex: _selectedIndex,
      destinations: [
        NavigationDestination(
          icon: Icon(Ionicons.restaurant),
          label: 'خوراکِ صرف شده',
        ),
        NavigationDestination(
          icon: Icon(Ionicons.pie_chart),
          label: 'داشبرد',
        ),
        NavigationDestination(
          icon: Icon(Ionicons.person),
          label: 'نمایه کاربر',
        ),
        NavigationDestination(
          icon: Icon(Ionicons.fitness),
          label: 'افزایش ماهیچه',
        ),
      ],
    );
  }
}

extension on String {
  int toDrawerIndex() {
    if (contains(Routes.foodSelection)) {
      return 0;
    } else if (contains(Routes.foodSelectionList)) {
      return 1;
    } else if (contains(Routes.foodList)) {
      return 2;
    } else if (contains(Routes.profile)) {
      return 3;
    } else if (contains(Routes.strengthTraining)) {
      return 4;
    } else if (contains(Routes.vo2maxCalculator)) {
      return 5;
    } else {
      throw Exception('Undefined location');
    }
  }

  int toBottomNavigationIndex() {
    if (contains(Routes.foodSelection)) {
      return 0;
    } else if (contains(Routes.foodSelectionList)) {
      return 1;
      // workaround for a navigation bug i add || contains(Routes.foodSelection)
    } else if (contains(Routes.profile) || contains(Routes.foodList)) {
      return 2;
    } else if (contains(Routes.strengthTraining) ||
        contains(Routes.vo2maxCalculator)) {
      return 3;
    } else {
      throw Exception('Undefined location');
    }
  }
}
