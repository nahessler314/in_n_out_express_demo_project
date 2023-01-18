// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:in_n_out_express_demo/sides_menu.dart';

import 'burgers_menu.dart';
import 'drinks_menu.dart';

class MyCombosMenuPage extends StatefulWidget {
  const MyCombosMenuPage({super.key, required this.title});

  // This widget is the CombosMenu page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyCombosMenuPage> createState() => _MyCombosMenuPageState();
}

class _MyCombosMenuPageState extends State<MyCombosMenuPage> {
  Map<String, dynamic> cartItemsBurger = {};
  Map<String, dynamic> cartItemsFries = {};
  Map<String, dynamic> cartItemsDrink = {};

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
        // Here we take the value from the MyCombosMenuPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Choose Your Combo Items'),
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
              child: Image(image: NetworkImage('https://www.in-n-out.com/ResourcePackages/INNOUT/content/images/menu/cheeseburger-meal.png?package=INNOUT'))
            ),
            Expanded(
              flex: 50,
              child: ListView(
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBurgersMenuPage(title: ''))).then((item) => cartItemsBurger = item!);
                      setState(() {});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1.0,
                          )
                        ),
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(flex: 8, child: Icon((cartItemsBurger.isEmpty) ? Icons.check_box_outline_blank : Icons.check_box)),
                          const Expanded(
                            flex: 40,
                            child: Image(
                              image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/cheeseburger@3x.png?package=INNOUT')
                            ),
                          ),
                          const Expanded(flex: 10, child: Text('')),
                          const Expanded(flex: 40, child: Text('Burgers', style: TextStyle(fontSize: 24.0),)),
                        ],
                      )
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MySidesPage(title: ''))).then((item) => cartItemsFries = item!);
                      setState(() {});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1.0,
                          )
                        ),
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(flex: 8, child: Icon((cartItemsFries.isEmpty) ? Icons.check_box_outline_blank : Icons.check_box)),
                          const Expanded(
                            flex: 40,
                            child: Image(
                              image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/fries@3x.png?package=INNOUT')
                            ),
                          ),
                          const Expanded(flex: 10, child: Text('')),
                          const Expanded(flex: 40, child: Text('Fries', style: TextStyle(fontSize: 24.0),)),
                        ],
                      )
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDrinksMenuPage(title: ''))).then((item) => cartItemsDrink = item!);
                      setState(() {});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1.0,
                          )
                        ),
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex: 8, child: Icon((cartItemsDrink.isEmpty) ? Icons.check_box_outline_blank : Icons.check_box)),
                          const Expanded(
                            flex: 40,
                            child: Image(
                              image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/drinks/cups.png?v=1.2&package=INNOUT'),
                            ),
                          ),
                          const Expanded(flex: 10, child: Text('')),
                          const Expanded(flex: 40, child: Text('Drinks', style: TextStyle(fontSize: 24.0),)),
                        ],
                      )
                    ),
                  ),
                ]
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (cartItemsBurger.isNotEmpty && cartItemsFries.isNotEmpty && cartItemsDrink.isNotEmpty){
            Map<String, Object> item = {
              'Item Type' : 'Combo',
              'Burger': cartItemsBurger,
              'Fries': cartItemsFries,
              'Drink': cartItemsDrink
            };
            Navigator.pop(context, item);
          }
        },
        tooltip: 'Add to Cart',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
