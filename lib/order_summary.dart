import 'package:flutter/material.dart';
import 'package:in_n_out_express_demo/checkout.dart';

class MyOrderSummaryPage extends StatefulWidget {
  MyOrderSummaryPage({super.key, required this.title, required this.cartItems});

  // This widget is the OrderSummary page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  List<dynamic> cartItems;

  @override
  State<MyOrderSummaryPage> createState() => _MyOrderSummaryPageState();
}

class _MyOrderSummaryPageState extends State<MyOrderSummaryPage> {
  final Map<String, double> _itemPriceList = {
    'Double Double': 3.45,
    'Cheeseburger': 2.40,
    'Hamburger': 2.10,
    'Fries': 1.60,
    'Drink': 1.50,
    'Shake': 2.05,
  };

  String _getSubtitle(Map<String, dynamic> cartItem) {
    String subtitle = '';
    if (cartItem['Item Type'].toString().contains('Combo')){
      subtitle += "Burger:\n${_getSubtitle(cartItem['Burger'])}\nFries:\n${_getSubtitle(cartItem['Fries'])}\nDrink:\n${_getSubtitle(cartItem['Drink'])}";
    }
    else{
      for (String option in cartItem.keys) {
        if (!cartItem[option].toString().contains('None') &&
            !(option.contains('Item Type') &&
                !(cartItem[option].toString().contains('Burger') ||
                    cartItem[option].toString().contains('Double')))) {
          subtitle += "$option - ${cartItem[option]}";
          if (option != cartItem.keys.last) {
            subtitle += ", ";
          }
        }
      }
    }
    return subtitle;
  }

  double _getPrice(Map<String, dynamic> cartItem){
    double price = 0.0;
    if (cartItem['Item Type'].toString().contains('Combo')){
      price += _getPrice(cartItem['Burger']) + _getPrice(cartItem['Fries']) + _getPrice(cartItem['Drink']);
    }
    else {
      price += _itemPriceList[cartItem['Item Type']]!;
      if (cartItem['Size'].toString().contains('Medium')) {
        price += 0.15;
      }
      if (cartItem['Size'].toString().contains('Large')) {
        price += 0.35;
      }
    }
    price = (price * 100).roundToDouble() / 100;
    return price;
  }

  double _getTotalPrice(){
    double totalPrice = 0.0;
    for (Map<String, dynamic> item in widget.cartItems){
      totalPrice += _getPrice(item);
    }
    return totalPrice;
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
      appBar: AppBar(
        // Here we take the value from the MyOrderSummaryPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Order Summary'), centerTitle: true,
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
            Expanded(
              flex: 85,
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(widget.cartItems[index]['Item Type'], style: Theme.of(context).textTheme.headline6,),
                    title: Text('\$${_getPrice(widget.cartItems[index]).toStringAsFixed(2)}'),
                    subtitle: Text(_getSubtitle(widget.cartItems[index])),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.cartItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 15,
              child: Text(
                'Subtotal: \$${_getTotalPrice().toStringAsFixed(2)}\nSales Tax: \$${(_getTotalPrice() * 0.0725).toStringAsFixed(2)}\nTotal: \$${(_getTotalPrice() * 1.0725).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline6,
                
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.cartItems.isNotEmpty) {
            double totalPrice = _getTotalPrice() * 1.0725;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCheckoutPage(title: "Checkout", cartItems: widget.cartItems, price: totalPrice)),
            );
          }
        },
        tooltip: 'Proceed to Checkout',
        child: const Icon(Icons.keyboard_double_arrow_right_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
