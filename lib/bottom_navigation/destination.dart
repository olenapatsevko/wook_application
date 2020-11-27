import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.orange),
  Destination('Cook Book', Icons.book, Colors.deepOrange),
  Destination('Profile', Icons.assignment_ind_sharp, Colors.red),
  Destination('Settings', Icons.settings, Colors.blue)
];

