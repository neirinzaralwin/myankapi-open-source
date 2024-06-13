import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeNavModel extends Equatable {
  final String title;
  final String route;
  final int? branchIndex;
  final IconData icon;

  const HomeNavModel(
      {required this.title,
      required this.route,
      this.branchIndex,
      required this.icon});

  @override
  List<Object?> get props => [title, route, branchIndex, icon];
}
