
import 'package:flutter/material.dart';
import 'package:flutter_spinwheel/flutter_spinwheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpinWheelWidget(),
    );
  }
}

class SpinWheelWidget extends StatefulWidget {

  @override
  _SpinWheelWidgetState createState() => _SpinWheelWidgetState();
}

class _SpinWheelWidgetState extends State<SpinWheelWidget> {


  List<String> questions;
  List<List<dynamic>> choices;
  List<String> answers;
  int select;

  @override

  void initState() {
    super.initState();

    questions = [
      'Which programming language you will use?'
    ];

    choices =[ [
      'Kotlin', 'Swift', 'Dart', 'Java', 'Python', 'C#', 'Ruby', 'PHP'
    ] ];

    select = 0;

    answers = ['', '', ''];

  }

  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('Flutter SpinWheel Demo'),
        automaticallyImplyLeading: false,
      ),

      body: Scrollbar(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder:(context, index){
            return  Container(
              height: MediaQuery.of(context).size.height / 1.7,
              // color: Colors.red,
              margin: EdgeInsets.all(30.0),

child: Center(
  child: Column(
    children: [
      Text(
        questions[index],
        style: TextStyle(
            fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold
        ),
      ),

      Text(
        answers[index],
        style: TextStyle(
          fontSize: 30,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.bold
        )
      ),

      Center(
        child: Spinwheel(
          size: MediaQuery.of(context).size.height*0.6,
          items: choices[index][0] is String ? choices[index].cast<String>() : null,
          select: select,
          autoPlay: false,
          hideOthers: false,
          shouldDrawBorder: true,
          onChanged: (val){
            if(this.mounted)
              setState(() {
                answers[index] = val;
              });
          },
        )
        ,
      )
    ],
  ),
),
              );
            }),
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {

  MyApp({Key key}): super(key: key);

  static const String _title = 'Flutter Future Code';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: _title,
    home: MyHomePage(title: _title),
    );
  }
}


class MyHomePage extends StatefulWidget {

  final String title;
  MyHomePage({Key key, this.title}):super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 3),
      () => 'Data Loaded'
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
        child: FutureBuilder(
            future: _calculation,
            builder: (BuildContext context, AsyncSnapshot snapshot){
             
              List<Widget> children;
              
              if(snapshot.hasData){
                children = <Widget>[
                  Icon(Icons.check_circle_outline, color: Colors.green, size: 60),
                  Padding(padding: EdgeInsets.only(top: 16), child: Text('Result: ${snapshot.data}'),),
                ];
              }else if(snapshot.hasError){
                children = <Widget>[
                  Icon(Icons.error_outline, color: Colors.red, size: 60,),
                  Padding(padding: EdgeInsets.only(top: 16), child: Text('Error: ${snapshot.hasError}'),)
                ];
              }else{
                children = <Widget>[
                  SizedBox(width: 60,height: 60, child: CircularProgressIndicator(),),
                  Padding(padding: EdgeInsets.only(top: 16), child: Text('Awaiting result...'))
                ];
              }
              
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              );
            }),
      ),
    );
  }
}*/



//
// class MyApp extends StatelessWidget {
//
//   const MyApp({Key key}) : super(key: key);
//
//   static const String _title = 'Flutter Demo Code';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: MyHomePage(title: _title),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   final Future<String> _calculation = Future<String>.delayed(
//     Duration(seconds: 3),
//       () => 'Data Loaded'
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTextStyle(
//           style: Theme.of(context).textTheme.headline2,
//           textAlign: TextAlign.center,
//           child:
//       FutureBuilder<String>(
//           future: _calculation,
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot){
//
//             List<Widget> children;
//
//             if(snapshot.hasData) {
//
//               children = <Widget>[
//
//                 // Icon(
//                 //   Icons.check_circle_outline,
//                 //   color: Colors.green,
//                 //   size: 60,
//                 // ),
//                 //
//                 // Padding(padding: EdgeInsets.only(top: 16),
//                 // child: Text('Result: ${snapshot.data}'),
//                 // ),
//               ];
//             }else if(snapshot.hasError){
//
//               children = <Widget>[
//
//                 Icon(Icons.error_outline,color: Colors.red,size: 60),
//                 Padding(padding: EdgeInsets.only(top:16.0), child: Text('Error: ${snapshot.error}'),)
//
//
//               ];
//             }else{
//               children = <Widget>[
//                 SizedBox(
//                   child: CircularProgressIndicator(),
//                   width: 60,
//                   height: 60,
//                 ),
//
//                 Padding(padding: EdgeInsets.only(top: 16),
//                 child: Text('Awaiting result...'),)
//               ];
//             }
//
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: children,
//               ),
//             );
//           })
//       ),
//     );
//   }
//
//   Widget _buildIcon(IconData icon, Color color){
//     return Icon(icon, color: color, size: 60);
//   }
//
//   Widget _buildPadding(String title){
//     return Padding(padding: EdgeInsets.only(top: 16), child: Text(title),);
//   }
// }
