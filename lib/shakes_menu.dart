import 'package:flutter/material.dart';

class MyShakesPage extends StatefulWidget {
  const MyShakesPage({super.key, required this.title});

  // This widget is the Shakes page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyShakesPage> createState() => _MyShakesPageState();
}

class _MyShakesPageState extends State<MyShakesPage> {
  final List<String> _sizes = [
    'Small',
    'Medium',
    'Large',
  ];
  final Map<String,String> _item = {
    'Item Type' : 'Shake',
    'Size': '',
    'Type': ''
  };
  final List<String> _types = [
    'Vanilla',
    'Strawberry',
    'Chocolate',
  ];

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
        // Here we take the value from the MyShakesPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Choose Your Shake'),
        centerTitle: true,
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
            const Expanded(
                flex: 40,
                child: Image(image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/drinks/shakes.png?package=INNOUT'))
            ),
            Expanded(
              flex: 10,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: _sizes.map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: _item['Size']!.contains(size),
                    selectedColor: Colors.red,
                    onSelected: (selected) {
                      setState(() {
                        _item['Size'] = '';
                        if (selected && _item['Size']!.isEmpty) {
                          _item['Size'] = size;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 35,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: _types.map((type) {
                  return ChoiceChip(
                    label: Text(type),
                    selected: _item['Type']!.contains(type),
                    selectedColor: Colors.red,
                    onSelected: (selected) {
                      setState(() {
                        _item['Type'] = '';
                        if (selected && _item['Type']!.isEmpty) {
                          _item['Type'] = type;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (_item['Size']!.isNotEmpty && _item['Type']!.isNotEmpty){
            Navigator.pop(context, _item);
          }
        },
        tooltip: 'Add to Cart',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
