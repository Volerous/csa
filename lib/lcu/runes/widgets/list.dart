import 'package:flutter/material.dart';
import 'package:lcu/runes/rune.dart';

class RunePageListTile extends StatelessWidget {
  final RunePage page;
  final ValueChanged<RunePage> onSelected;
  RunePageListTile(this.page, this.onSelected);

  void _handleTap(){
    onSelected(page);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(page.name), Text(page.primaryStyleId.toString())],
      ),
      onTap: _handleTap,
    );
  }
}

// class RunePageDetailView extends StatelessWidget{

// }
