import 'package:flutter/material.dart';
import 'package:gridview_module/model/DataList/data.dart';

class CommonComponent {
  static AppBar appbar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontFamily: 'Merienda'),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF38929B),
    );
  }

  static Widget getRating(BuildContext context, int index, int index1) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: Icon(
        Icons.star,
        size: 15.0,
        color: index1 + 1 <= Data().menuItem[index].rating
            ? Colors.yellow.shade800
            : const Color(0xFFE0E0E0),
      ),
    );
  }
}
