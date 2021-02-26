import 'package:flutter/material.dart';
import 'package:lcu/runes/rune.dart';

class RuneDetailView extends StatefulWidget {
  
  final RunePage page;
  RuneDetailView(this.page);
  @override
  _RuneDetailViewState createState() => _RuneDetailViewState(page);
}

class _RuneDetailViewState extends State<RuneDetailView> {
  RunePage page;
  _RuneDetailViewState(this.page);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        page.name,
      ),
    );
  }
}
