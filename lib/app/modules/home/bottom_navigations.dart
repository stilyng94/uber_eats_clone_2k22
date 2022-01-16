import 'package:flutter/material.dart';

abstract class BottomNavigationItems {
  BottomNavigationItems._();
  static const bottomNavigationItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_sharp), label: 'Home', tooltip: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.search_sharp), label: 'Browse', tooltip: 'Browse'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_sharp),
        label: 'Grocery',
        tooltip: 'Grocery'),
    BottomNavigationBarItem(
        icon: Icon(Icons.receipt_sharp), label: 'Orders', tooltip: 'Orders'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_sharp), label: 'Account', tooltip: 'Account'),
  ];
}
