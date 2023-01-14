// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/items.dart';
import '../order/order_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: true);
    var items = Provider.of<Items>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      child: ListView.builder(
                        itemBuilder: ((context, i) {
                          var itemOnCart = cart.carts[i];
                          var item = items.findById(itemOnCart.id!);
                          int qty = itemOnCart.qty;
                          double price = item.price!;
                          double subtotal = price * qty;

                          return ListTile(
                            leading: SizedBox(
                              height: 150,
                              width: 80,
                              child: Image.network(
                                item.image!,
                                height: 150,
                                width: 100,
                              ),
                            ),
                            title: Text(item.name!),
                            subtitle: Text("$qty x $price = $subtotal"),
                            trailing: SizedBox(
                              width: 140,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 45,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (qty > 1) {
                                            cart.minusQty(itemOnCart);
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                content: const Text(
                                                    'Apakah anda yakin untuk menghapus?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Tidak'),
                                                    onPressed: () {
                                                      Navigator.of(ctx)
                                                          .pop(false);
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text('Ya'),
                                                    onPressed: () {
                                                      Navigator.of(ctx)
                                                          .pop(true);
                                                      cart.removeItemById(
                                                          item.id!);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text("-")),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: Center(child: Text('$qty')),
                                  ),
                                  SizedBox(
                                    width: 45,
                                    child: ElevatedButton(
                                        onPressed: () =>
                                            cart.addQty(itemOnCart),
                                        child: const Text("+")),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        itemCount: cart.carts.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderScreen(),
              ),
            );
            // ignore: avoid_print
            print('order');
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Order',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
