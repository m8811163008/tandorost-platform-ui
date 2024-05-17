import 'dart:math';

import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

import 'package:food_selection/food_selection.dart';
import 'package:user_repository/user_repository.dart';

class FoodSelectionRoute extends StatelessWidget {
  const FoodSelectionRoute({
    super.key,
  });
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      bodyPadding: EdgeInsets.zero,
      actions: const [
        // IconButton.outlined(
        //   onPressed: () {
        //     context.pushNamed(Routes.foodSelectionList);
        //   },
        //   icon: const Icon(
        //     Ionicons.list_sharp,
        //   ),
        //   tooltip: 'لیست غذاهای صرف شده',
        // )
      ],
      child: HomeScreenWidgets(),
    );
  }
}

class HomeScreenWidgets extends StatefulWidget {
  const HomeScreenWidgets({
    super.key,
  });

  @override
  State<HomeScreenWidgets> createState() => _HomeScreenWidgetsState();
}

class _HomeScreenWidgetsState extends State<HomeScreenWidgets> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      openKeyboardChild: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SearchedFoodsListBuilder(),
          // if (MediaQuery.of(context).viewInsets.bottom == 0.0) Spacer(),
          // if (value) Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.sizesExtenstion.medium,
                  vertical: context.sizesExtenstion.small),
              child: const SearchFieldTextField(),
            ),
          ),
          // if (value) Spacer(),
          // if (MediaQuery.of(context).viewInsets.bottom == 0.0) Spacer(),
        ],
      ),
      closeKeyboardChild: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 164, right: 16.0, left: 16.0),
            child: QuoteWidgetBuilder(),
          ),

          const SearchedFoodsListBuilder(),

          // if (MediaQuery.of(context).viewInsets.bottom == 0.0) Spacer(),
          // if (value) Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.sizesExtenstion.medium,
                  vertical: context.sizesExtenstion.small),
              child: const SearchFieldTextField(),
            ),
          ),
          // if (value) Spacer(),
          // if (MediaQuery.of(context).viewInsets.bottom == 0.0) Spacer(),
        ],
      ),
    );
  }
}

class QuoteWidgetBuilder extends StatelessWidget {
  const QuoteWidgetBuilder({
    super.key,
  });
  static const List<String> userTextList = [
    'کاربر ',
    'دوست ',
    'مشتری ',
    'مصرف کننده ',
  ];

  static const List<String> suffixes = [
    'عزیز',
    'گرامی',
    'ارجمند',
    'گرانقدر',
  ];
  static const List<String> buttonTitleList = [
    'استوری کن دوستات بفهمن',
    'اشتراک بذار مردم بدونن',
    'بفرست روبیکا دوستت ببینه',
    'واتس آپش کن دوستات ببینن',
    'وضعیت واتس آپش کن مردم بخونن',
    'بفرست واسه دوستت تا بدونه',
  ];

  String get userTextPart1 =>
      userTextList[Random().nextInt(userTextList.length)];
  String get userTextPart2 => suffixes[Random().nextInt(suffixes.length)];
  String get userText => '$userTextPart1$userTextPart2';

  String get buttonTitle =>
      buttonTitleList[Random().nextInt(buttonTitleList.length)];

  @override
  Widget build(BuildContext context) {
    if (Random().nextBool()) {
      return FutureBuilder(
        future:
            RepositoryProvider.of<UserRepostiory>(context).userProfile.first,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return SizedBox.shrink();
          }

          final userNameTitle = snapshot.data!.userName;
          // virgool be farsi khate bad darad
          return _buildQuoteWidget(context, '$userNameTitle، $userText');
        },
      );
    } else {
      return _buildQuoteWidget(context, userText);
    }
  }

  Widget _buildQuoteWidget(BuildContext context, String title) {
    return QuoteWidget(
      title: title,
      text: RepositoryProvider.of<FoodRepostiory>(context).foodTip,
      buttomTitle: buttonTitle,
    );
  }
}

class KeyboardVisibility extends StatefulWidget {
  const KeyboardVisibility(
      {super.key,
      required this.closeKeyboardChild,
      required this.openKeyboardChild});

  final Widget openKeyboardChild;
  final Widget closeKeyboardChild;

  @override
  State<KeyboardVisibility> createState() => _KeyboardVisibilityState();
}

class _KeyboardVisibilityState extends State<KeyboardVisibility>
    with WidgetsBindingObserver {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return _isOpen ? widget.openKeyboardChild : widget.closeKeyboardChild;
  }

  @override
  void initState() {
    super.initState();
    // Used to obtain the change of the window size to determine whether the keyboard is hidden.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // stop Observing the window size changes.
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _isOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    super.didChangeDependencies();
  }

  @override
  void didChangeMetrics() {
    setState(() {
      _isOpen = View.of(context).viewInsets.bottom != 0;
    });
  }
}

class QuoteWidget extends StatefulWidget {
  const QuoteWidget(
      {super.key, this.text = '', this.title = '', this.buttomTitle = ''});
  final String text;
  final String title;
  final String buttomTitle;

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controlller;
  late final Animation<double> curevedAnimation;

  @override
  void initState() {
    _controlller = AnimationController(
      value: 0,
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    curevedAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controlller, curve: Curves.easeInOutCubic),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controlller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: curevedAnimation.value,
      child: QuoteCard(
        text: widget.text,
        title: widget.title,
        buttomTitle: widget.buttomTitle,
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  const QuoteCard(
      {super.key, this.text = '', this.title = '', this.buttomTitle = ''});
  final String text;
  final String title;
  final String buttomTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.themeData.textTheme.bodyLarge,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          Text(
            text,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                Share.share(
                    'سلام \n $text \n \nنرم افزار لاغری تندرست(دانلود از کافه بازار)');
              },
              icon: Icon(Ionicons.people),
              label: Text(buttomTitle),
            ),
          )
        ],
      ),
    ));
  }
}
