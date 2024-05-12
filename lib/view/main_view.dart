import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/constants/plant_icons.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:disease_detection/view/common_remedies_view.dart';
import 'package:disease_detection/view/home_view.dart';
import 'package:disease_detection/view/profile_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _index = 0;
  final List<Widget> itemPages = [
    const HomeView(),
    const CommonRemediesView(),
    const ProfileView()
  ];
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  List<TabItem> items = [
    const TabItem(
      icon: PlantIcons.leaf_1,
      title: 'Home',
    ),
    const TabItem(
      icon: PlantIcons.vibrate,
      title: 'Remedy',
    ),
    const TabItem(
      icon: PlantIcons.profile,
      title: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: itemPages,
      ),
      bottomNavigationBar: BottomBarDivider(
        items: items,
        backgroundColor: kNeutral0,
        color: kNeutral600,
        colorSelected: const Color(0xff235F5F),
        titleStyle: TextStyleTheme.current.bodyText4Heavy,
        indexSelected: _index,
        onTap: (int index) => setState(() {
          _pageController.jumpToPage(index);
          setState(() {
            _index = index;
          });
        }),
      ),
    );
  }
}
