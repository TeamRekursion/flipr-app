import 'package:flippr_app/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        borderRadius: BorderRadius.circular(90),
        elevation: 0,
        child: Container(
          width: double.infinity,
          height: 50,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              color: darkGrey,
              borderRadius: BorderRadius.circular(90),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search a State',
                  style: TextStyle(
                    color: disabledColor,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  Icons.search,
                  color: disabledColor,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
