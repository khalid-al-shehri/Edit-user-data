import 'package:flutter/material.dart';

import 'EditData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'View User Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String FirstNameView = "Khaled";
  String LastNameView = "Mohammed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "First Name : ${FirstNameView}"
            ),

            SizedBox(height: 10,),

            Text(
                "Last Name : ${LastNameView}"
            ),

            SizedBox(height: 40,),

            Container(
              color: Colors.blue,
              child: RawMaterialButton(
                child: Text(
                  "  Edit User Data  ",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditData(
                      FirstNameFromViewData: FirstNameView,
                      LastNameFromViewData: LastNameView,
                    )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
