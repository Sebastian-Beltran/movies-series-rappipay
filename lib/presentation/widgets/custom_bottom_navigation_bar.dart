import 'package:flutter/material.dart';
import 'package:movies_series_app/core/constants/palette.dart';
import 'package:movies_series_app/features/home/models/home_bottom_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double _iconSize = 21;
  static const double _iconSizeSelected = 25;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      backgroundColor: Palette.primary,
      items: homeBottomItems
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(
                e.icon,
                size: _iconSize,
                color: Palette.grey,
              ),
              activeIcon: Icon(
                e.icon,
                size: _iconSizeSelected,
                color: Palette.white,
              ),
              label: e.label,
            ),
          )
          .toList(),
    );
  }
}
