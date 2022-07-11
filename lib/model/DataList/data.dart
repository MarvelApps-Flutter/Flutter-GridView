import 'package:flutter/material.dart';
import 'package:gridview_module/model/bottom_app_bar_model.dart';
import 'package:gridview_module/model/menu_item_model.dart';

class Data {
  List<String> foodLabel = [
    'Kinza',
    'Maman',
    'Tanuki',
    'Gastrol',
    'Maman',
    'Tanuki'
  ];

  List<String> foodType = [
    'All',
    'Salad',
    'Pizza',
    'Burger',
    'Desert',
  ];

  List<MenuItemModel> menuItem = [
    MenuItemModel(
        imageUrl:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2014%2F01%2F31%2Fvegetable-greens-hash-poached-egg-ck-x.jpg&q=60',
        name: 'Vegetables And Poached Egg',
        rating: 3,
        reviewCount: 15,
        amount: 13.50),
    MenuItemModel(
        imageUrl:
            'https://www.jessicagavin.com/wp-content/uploads/2020/07/avocado-salad-16-1200.jpg',
        name: 'Avocado Salad',
        rating: 4,
        reviewCount: 21,
        amount: 19.28),
    MenuItemModel(
        imageUrl:
            'https://www.tasteofhome.com/wp-content/uploads/2018/01/Cranberry-Orange-Pancakes_exps50157_SD19999445D08_30_1bC_RMS-4.jpg?fit=700,1024',
        name: 'Pancakes With Orange Sauce',
        rating: 3,
        reviewCount: 10,
        amount: 10.40),
    MenuItemModel(
        imageUrl:
            'https://static.onecms.io/wp-content/uploads/sites/19/2012/10/04/MexicanVegetableSaute_420x420.jpg',
        name: 'Vegetables',
        rating: 2,
        reviewCount: 8,
        amount: 15.47),
    MenuItemModel(
        imageUrl:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2014%2F01%2F31%2Fvegetable-greens-hash-poached-egg-ck-x.jpg&q=60',
        name: 'Vegetables And Poached Egg',
        rating: 3,
        reviewCount: 15,
        amount: 13.50),
    MenuItemModel(
        imageUrl:
            'https://www.jessicagavin.com/wp-content/uploads/2020/07/avocado-salad-16-1200.jpg',
        name: 'Avocado Salad',
        rating: 4,
        reviewCount: 21,
        amount: 19.28),
    MenuItemModel(
        imageUrl:
            'https://www.tasteofhome.com/wp-content/uploads/2018/01/Cranberry-Orange-Pancakes_exps50157_SD19999445D08_30_1bC_RMS-4.jpg?fit=700,1024',
        name: 'Pancakes With Orange Sauce',
        rating: 3,
        reviewCount: 10,
        amount: 10.40),
    MenuItemModel(
        imageUrl:
            'https://static.onecms.io/wp-content/uploads/sites/19/2012/10/04/MexicanVegetableSaute_420x420.jpg',
        name: 'Vegetables',
        rating: 2,
        reviewCount: 8,
        amount: 15.47),
  ];

  List<BottomAppBarModel> bottomAppBarItemList = [
    BottomAppBarModel(
        icon: Icons.menu_book_rounded, lable: 'Menu', isSelected: false),
    BottomAppBarModel(
        icon: Icons.account_box, lable: 'Account', isSelected: false),
    BottomAppBarModel(
        icon: Icons.shopping_cart, lable: 'Cart', isSelected: false)
  ];
}
