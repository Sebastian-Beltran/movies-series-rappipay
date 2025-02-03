import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeBottomItem extends Equatable {
  final String label;
  final IconData icon;

  const HomeBottomItem({
    required this.label,
    required this.icon,
  });

  @override
  List<Object?> get props => [label, icon];
}

List<HomeBottomItem> homeBottomItems = [
  HomeBottomItem(label: 'Movies', icon: Icons.movie),
  HomeBottomItem(label: 'Series', icon: Icons.tv),
  HomeBottomItem(label: 'Search', icon: Icons.search),
];
