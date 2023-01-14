// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../../models/item.dart';
import '../../models/item_cart.dart';
import '../../providers/cart.dart';

import '../../providers/items.dart';
import '../cartScreen/cartScreen.dart';

class DetailProduct extends StatefulWidget {
  final int id;
  const DetailProduct(
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  void clickItem(Item item) {
    debugPrint(item.toString());
  }

  int _counter = 0;
  late int finalprice;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: true);
    var item = Provider.of<Items>(context, listen: false).findById(widget.id);
    double total = item.price! * double.parse('$_counter');
    log(item.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Menu'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, -4),
                      blurRadius: 8),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 24,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.name!,
                            style: GoogleFonts.ptSans(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      item.desc!,
                      style: GoogleFonts.ptSans(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          item.price.toString(),
                          style: GoogleFonts.ptSans(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed:
                            //  _decrementCounter,
                            () {
                          if (_counter > 0) {
                            _decrementCounter();
                          }
                        },
                        heroTag: 'Decrement',
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      SizedBox(
                        height: 49,
                        width: 100,
                        child: Center(
                          child: Text("$_counter"),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: _incrementCounter,
                        heroTag: 'Increment',
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: const Offset(0, -3),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: GoogleFonts.ptSans(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                total.toString(),
                                style: GoogleFonts.ptSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              cart.addToCart(ItemCart(
                                  name: item.name!,
                                  price: item.price!,
                                  id: item.id!,
                                  qty: _counter,
                                  subtotal: total));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartScreen(),
                                ),
                              );
                              // // print('Klik');
                              // cart.addToCart(ItemCart(
                              //     id: item.id,
                              //     name: 'ayam',
                              //     price: 2000,
                              //     qty: '1',
                              //     subtotal: 100000));
                              // print(ItemCart);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                ' Keranjang',
                                style: GoogleFonts.ptSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
