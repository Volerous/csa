import 'package:flutter/material.dart';
import 'package:lcu/runes/rune.dart';

class RunePageListTile extends StatelessWidget {
  final RunePage page;
  final ValueChanged<RunePage> onSelected;
  RunePageListTile(this.page, this.onSelected);

  void _handleTap() {
    onSelected(page);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(page.name), Text(page.primaryStyleId.toString())],
        ),
      ),
      onTap: _handleTap,
    );
  }
}

class RunePageListView extends StatefulWidget {
  RunePageListView({Key key, this.pages, this.onSelected}) : super(key: key);
  final Future<List<RunePage>> pages;
  final ValueChanged<RunePage> onSelected;
  @override
  _RunePageListViewState createState() => _RunePageListViewState();
}

class _RunePageListViewState extends State<RunePageListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.pages,
      builder: (bc, AsyncSnapshot<List<RunePage>> snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        } else {
          return ListView.builder(
            // separatorBuilder: (bc, i) {
            //   return Divider(
            //     color: Colors.black,
            //   );
            // },
            itemCount: snapshot.data.length,
            itemBuilder: (bc, i) {
              return RunePageListTile(snapshot.data[i], widget.onSelected);
            },
          );
        }
      },
    );
  }
}
