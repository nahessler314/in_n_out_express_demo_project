// import 'dart:ffi';

import 'package:flutter/material.dart';

class MyBurgersMenuPage extends StatefulWidget {
  const MyBurgersMenuPage({super.key, required this.title});

  // This widget is the BurgersMenu page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyBurgersMenuPage> createState() => _MyBurgersMenuPageState();
}

class _MyBurgersMenuPageState extends State<MyBurgersMenuPage> {
  final List<String> _items = [
    'Double Double',
    'Cheeseburger',
    'Hamburger',
  ];
  final List<String> _selected = [];
  final List<String> _quantities = [
    'None',
    'Light',
    'Regular',
    'Extra'
  ];
  final Map<String, String> _toppingQuantity = {
    'Item Type': '',
    'Lettuce': 'Regular',
    'Tomato': 'Regular',
    'Spread': 'Regular',
    'Raw Onions': 'Regular',
    'Grilled Onions': 'None',
    'Ketchup': 'None',
    'Mustard': 'None',
    'Pickles': 'None',
    'Peppers': 'None'
  };

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
        // Here we take the value from the MyBurgersMenuPage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: const Text('Choose Your Burger'),
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
                flex: 2,
                child: Text(''),
            ),
            const Expanded(
              flex: 40,
              child: Image(image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/cheeseburger@3x.png?package=INNOUT'))
            ),
            Expanded(
              flex: 7,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: _items.map((item) {
                  return ChoiceChip(
                    label: Text(item),
                    selected: _selected.contains(item),
                    selectedColor: Colors.red,
                    onSelected: (selected) {
                      setState(() {
                        _selected.clear();
                        if (selected && _selected.isEmpty) {
                          _selected.add(item);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 50,
              child: ListView.builder(
                itemCount: _toppingQuantity.length,
                itemBuilder: (BuildContext context, int index) {
                  return (index > 0) ? ListTile(
                    title: Text(
                        _toppingQuantity.keys.elementAt(index),
                    ),
                    trailing: Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: _quantities.map((quantity) {
                          return ChoiceChip(
                            label: Text(quantity),
                            selected: _toppingQuantity.values.elementAt(index).contains(quantity),
                            selectedColor: Colors.red,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _toppingQuantity[_toppingQuantity.keys.elementAt(index)] = quantity;
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    )
                  ) : const Expanded(flex: 0, child: Text(''));
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (_selected.isNotEmpty){
            Map<String,String> item = _toppingQuantity;
            item['Item Type'] = _selected[0];
            Navigator.pop(context, item);
          }
        },
        tooltip: 'Add to Cart',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

