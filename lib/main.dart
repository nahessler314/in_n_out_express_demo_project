// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_n_out_express_demo/burgers_menu.dart';
import 'package:in_n_out_express_demo/combos_menu.dart';
import 'package:in_n_out_express_demo/drinks_menu.dart';
import 'package:in_n_out_express_demo/order_summary.dart';
import 'package:in_n_out_express_demo/shakes_menu.dart';
import 'package:in_n_out_express_demo/sides_menu.dart';
import 'package:in_n_out_express_demo/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        primarySwatch: Colors.red,
      ),
      home: const MySignUpPage(title: 'Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<dynamic> cartItems = [];

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
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            TextButton(
                onPressed: () async {
                  final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCombosMenuPage(title: ''))).then((item) => cartItems.add(item!));
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
                  children: const [
                    Expanded(
                      flex: 40,
                      child: Image(
                          image: NetworkImage('https://www.in-n-out.com/ResourcePackages/INNOUT/content/images/menu/cheeseburger-meal.png?package=INNOUT')
                      ),
                    ),
                    Expanded(flex: 20, child: Text('')),
                    Expanded(flex: 40, child: Text('Combos', style: TextStyle(fontSize: 24.0),)),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBurgersMenuPage(title: ''))).then((item) => cartItems.add(item!));
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
                  children: const [
                    Expanded(
                      flex: 40,
                      child: Image(
                        image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/cheeseburger@3x.png?package=INNOUT')
                      ),
                    ),
                    Expanded(flex: 20, child: Text('')),
                    Expanded(flex: 40, child: Text('Burgers', style: TextStyle(fontSize: 24.0),)),
                  ],
                )
              ),
            ),
            TextButton(
              onPressed: () async {
                final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MySidesPage(title: ''))).then((item) => cartItems.add(item!));
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
                  children: const [
                    Expanded(
                      flex: 40,
                      child: Image(
                          image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/fries@3x.png?package=INNOUT')
                      ),
                    ),
                    Expanded(flex: 20, child: Text('')),
                    Expanded(flex: 40, child: Text('Fries', style: TextStyle(fontSize: 24.0),)),
                  ],
                )
              ),
            ),
            TextButton(
              onPressed: () async {
                final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDrinksMenuPage(title: ''))).then((item) => cartItems.add(item!));
                setState(() {

                });
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
                  children: const [
                    Expanded(
                      flex: 40,
                      child: Image(
                          image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/drinks/cups.png?v=1.2&package=INNOUT'),
                      ),
                    ),
                    Expanded(flex: 20, child: Text('')),
                    Expanded(flex: 40, child: Text('Drinks', style: TextStyle(fontSize: 24.0),)),
                  ],
                )
              ),
            ),
            TextButton(
              onPressed: () async {
                final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyShakesPage(title: ''))).then((item) => cartItems.add(item!));
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
                  children: const [
                    Expanded(
                      flex: 40,
                      child: Image(
                          image: NetworkImage('https://www.in-n-out.com/Frontend-Assembly/Telerik.Sitefinity.Frontend/content/images/menu/drinks/shakes.png?package=INNOUT')
                      ),
                    ),
                    Expanded(flex: 20, child: Text('')),
                    Expanded(flex: 40, child: Text('Shakes', style: TextStyle(fontSize: 24.0),)),
                  ],
                )
              ),
            ),
            // Expanded(child: Text(cartItems.toString()))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          if (cartItems.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  MyOrderSummaryPage(title: '', cartItems: cartItems)),
            );
          }
        },
        tooltip: 'View Cart',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
