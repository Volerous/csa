import 'package:flutter/material.dart';
import 'package:lcu/runes/rune.dart';

class RuneDetailView extends StatefulWidget {
  @override
  _RuneDetailViewState createState() => _RuneDetailViewState();
}

class _RuneDetailViewState extends State<RuneDetailView> {
  RunePage page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        page.name,
      ),
    );
  }
}
