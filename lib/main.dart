import 'package:csa/lcu/runes/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:lcu/lcu.dart';
import 'package:lcu/runes/rune.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key key, this.title, this.filePath})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String filePath;

  @override
  _MyHomePageState createState() => _MyHomePageState(filePath);
}

class _MyHomePageState extends State<MyHomePage> {
  LcuApi client;
  RunePage currentRunePage;
  _MyHomePageState(String filePath) {
    client = new LcuApi(filePath);
  }

  void _selectRunePage(RunePage page) {
    print(page.name);
    setState(() {
      currentRunePage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String portString;
    // portString = client.port.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: FutureBuilder(
                future: client.runeManager.allRunePages,
                builder: (bc, AsyncSnapshot<List<RunePage>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  } else {
                    return ListView.separated(
                      separatorBuilder: (bc, i) {
                        return Divider(
                          color: Colors.black,
                        );
                      },
                      itemCount: snapshot.data.length,
                      itemBuilder: (bc, i) {
                        return RunePageListTile(
                            snapshot.data[i], _selectRunePage);
                      },
                    );
                  }
                },
              ),
            ),
            // Flexible(
            //   flex: 4,
            //   child:
            // )
            // Flexible(child: )
          ],
        ),
      ),
    );
  }
}
