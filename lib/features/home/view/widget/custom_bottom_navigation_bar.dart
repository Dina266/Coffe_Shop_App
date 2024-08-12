import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = const [
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          // BottomNavigationBarItem(
          //   // icon: AppIcons.iconGrid(Colors.grey),
          //   // activeIcon: AppIcons.iconGrid(AppColor.selectedViolet),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   // icon: AppIcons.iconShoppingCart(Colors.grey),
          //   // activeIcon: AppIcons.iconShoppingCart(AppColor.selectedViolet),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   // icon: AppIcons.iconUser(Colors.grey),
          //   // activeIcon: AppIcons.iconUser(AppColor.selectedViolet),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   // icon: AppIcons.iconUser(Colors.grey),
          //   // activeIcon: AppIcons.iconUser(AppColor.selectedViolet),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   // icon: AppIcons.iconUser(Colors.grey),
          //   // activeIcon: AppIcons.iconUser(AppColor.selectedViolet),
          //   label: '',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
