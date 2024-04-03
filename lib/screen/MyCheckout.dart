import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import '../model/Item.dart';
import "../provider/shoppingcart_provider.dart";

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Center(
        child: Column(
          children: [
            const Text("Item Details"),
            const Divider(height: 4, color: Colors.blueGrey),
            getItems(context),
          ],
        ),
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Text('No items to checkout!')
        : Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  // display the name and price of the items
                  return ListTile(
                      title: Text(products[index].name),
                      trailing: Text(
                        "${products[index].price}",
                        style: const TextStyle(fontSize: 14),
                      ));
                },
              )),
              Flexible(
                  child: Column(
                children: [
                  const Divider(height: 4, color: Colors.blueGrey),

                  // display total cost of the items
                  computeCost(),

                  // button for pay now
                  ElevatedButton(
                      onPressed: () {
                        // clear shopping list and set the total to 0
                        context.read<ShoppingCart>().removeAll();

                        // display prompt at the snackbar
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Payment Successful!"),
                          duration: Duration(seconds: 2, milliseconds: 100),
                        ));

                        // navigate to the Product Catalog page
                        Navigator.pushNamed(context, "/products");
                      },
                      child: const Text("Pay Now!")),
                ],
              )),
            ],
          ));
  }

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total Cost to Pay: ${cart.cartTotal}");
    });
  }
}
