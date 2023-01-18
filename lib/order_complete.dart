import 'package:flutter/material.dart';
import 'package:in_n_out_express_demo/main.dart';

class MyOrderCompletePage extends StatefulWidget {
  const MyOrderCompletePage({super.key, required this.title});

  // This widget is the OrderComplete page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyOrderCompletePage> createState() => _MyOrderCompletePageState();
}

class _MyOrderCompletePageState extends State<MyOrderCompletePage> {
  late DateTime _dateTime;


  DateTime _getOrderReadyTime() {
    _dateTime = DateTime.now().add(const Duration(minutes: 7, seconds: 30));
    return _dateTime;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
            Text(
              'Order Submitted!',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Ready by ${_getOrderReadyTime().hour}:${_getOrderReadyTime().minute}',
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton(
              onPressed: () {
                while(Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(title: 'Menu'),
                  ),
                );
              },
              child: const Text("Return to Menu"),
            ),
          ],
        ),
      ),
    );
  }
}
