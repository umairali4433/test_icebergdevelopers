import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Draw {
  final String title;
  final IconData icon;
  Draw({ this.title,  this.icon});
}

final List<Draw> drawerItems = [
  Draw(title: 'Contact Us', icon: Icons.phone),
  Draw(title: 'Rate Us', icon: Icons.stars),
  Draw(title: 'Share the App', icon: Icons.share),
  Draw(title: 'Return Policy', icon: Icons.lock_clock),
  Draw(title: 'About Us', icon: Icons.add_box_outlined),
  Draw(title: 'Setting', icon: Icons.settings),
];