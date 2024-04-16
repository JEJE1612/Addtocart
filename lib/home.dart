import 'package:addtocart/checkout.dart';
import 'package:addtocart/model/cart.dart';
import 'package:addtocart/model/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Item> item = [
      Item(name: "S20 ultra", price: 250),
      Item(name: "p30 Pro", price: 360)
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 125, 79, 79),
          title: Text('Home'),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Checkout();
                      }));
                    },
                    icon: const Icon(Icons.add_shopping_cart)),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.totalprice}");
                    },
                  ),
                )
              ],
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            return Card(
              child: Consumer<Cart>(
                builder: (context, cart, child) {
                  return ListTile(
                    title: Text("${item[i].name}"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add,
                      ),
                      onPressed: () {
                        cart.add(item[i]);
                      },
                    ),
                  );
                },
              ),
            );
          },
          itemCount: item.length,
        ));
  }
}
