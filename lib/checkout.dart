import 'package:flutter/material.dart';
import 'package:in_n_out_express_demo/order_complete.dart';

class MyCheckoutPage extends StatefulWidget {
  MyCheckoutPage({super.key, required this.title, required this.cartItems, required this.price});

  // This widget is the Checkout page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  List<dynamic> cartItems;
  final double price;

  @override
  State<MyCheckoutPage> createState() => _MyCheckoutPageState();
}

class _MyCheckoutPageState extends State<MyCheckoutPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyCheckoutPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Checkout'),
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
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: const <Widget>[]
                ),
              ),
              Expanded(
                flex: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Amount to Pay',
                    ),
                    Text(
                      '\$${widget.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: "Name on Card",
                        labelText: "Name",
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(
                        hintText: "0000 0000 0000 0000",
                        labelText: "Card Number",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a card number";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cvvController,
                      decoration: const InputDecoration(
                        hintText: "000",
                        labelText: "CVV",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a CVV";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _expiryDateController,
                      decoration: const InputDecoration(
                        hintText: "MM/YY",
                        labelText: "Expiration Date",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an expiry date";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _zipController,
                      decoration: const InputDecoration(
                        hintText: "12345",
                        labelText: "ZIP Code",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a ZIP code";
                        }
                        return null;
                      },
                    ),

                  ],
                )
              ),
              Expanded(
                flex: 10,
                child: ElevatedButton(
                  onPressed: () {},
                  onLongPress: (){
                    // if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Card Info')),
                      );
                      while(Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>
                          const MyOrderCompletePage(title: "Order Complete")),
                      );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.red, // <-- Button color
                    foregroundColor: Colors.white, // <-- Splash color
                  ),
                  child: const Text('Submit', selectionColor: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
