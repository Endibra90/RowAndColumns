import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _filasController;
  PageController _columnasController;
  void initState() {
    _filasController = PageController();
    _columnasController = PageController();
    _filasController.addListener(() => _establecerFC());
    _columnasController.addListener(() => _establecerFC());
  }

  _establecerFC() {
    setState(() {
      filas = _filasController.page.floor();
      columnas = _columnasController.page.floor();
    });
  }

  static const _itemCount = 10;
  int filas = 1;
  int columnas = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 60,
                child: PageView.builder(
                  controller: _filasController,
                  itemBuilder: (context, page) {
                    return Center(child: Text("$page"));
                  },
                  itemCount: _itemCount,
                )),
            Divider(),
            SizedBox(
                height: 60,
                child: PageView.builder(
                  controller: _columnasController,
                  itemBuilder: (context, page) {
                    return Center(child: Text("$page"));
                  },
                  itemCount: _itemCount,
                )),
            Divider(),
            for (var f = 0; f < filas; f++)
              Expanded(
                //flex: fflex[f],
                child: Row(children: [
                  for (var c = 0; c < columnas; c++)
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border.all(color: Colors.black)),
                      child: Text("Hola manolo asi haceis los que haceis"),
                    ))
                ]),
              ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
