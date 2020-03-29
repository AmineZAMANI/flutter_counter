import 'package:example/bloc/IncrementBloc.dart';
import 'package:example/bloc/IncrementEvent.dart';
import 'package:example/bloc/IncrementState.dart';
import 'package:example/model/Counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Counter counter = new Counter(0);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<IncrementBloc>(context)..add(IdleEvent());
                },
                child: Text(
                  "RAZ",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            BlocBuilder<IncrementBloc, IncrementState>(
              builder: (context, state) {
                print(state);
                if (state != null) {
                  if (state is Incremented) {
                    this.counter = state.counter;
                  } else if (state is Incrementing) {
                    return buildCounter("Loading...");
                  } else if (state is Idle) {
                    this.counter = new Counter(0);
                  }
                }
                return buildCounter(counter.value.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Clicked");
          BlocProvider.of<IncrementBloc>(context)
            ..add(IncrementByStepEvent(counter, 20));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildCounter(String value) {
    return Container(
      child: Center(
        child: Text(
          value,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
