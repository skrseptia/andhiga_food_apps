import 'package:flutter/material.dart';

import '../../../../../models/item.dart';

class BeverageList extends StatefulWidget {
  // final String category;

  const BeverageList({Key? key}) : super(key: key);
  static const routeName = '/BeverageList';

  @override
  State<BeverageList> createState() => _BeverageListState();
}

class _BeverageListState extends State<BeverageList> {
  void clickItem(Item item) {
    debugPrint(item.toString());
  }

  @override
  Widget build(BuildContext context) {
    // var item = Provider.of<Items>(context, listen: false).filterByCategory(widget.category);

    return const Scaffold(
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height,
        //         child: ListView.builder(
        //               itemBuilder: (context, index) {
        //                 return SingleChildScrollView(
        //                   child: ListTile(
        //                     leading: SizedBox(
        //                       height: 150,
        //                       width: 80,
        //                       child: Image.network(
        //                         item[index].image!,
        //                         height: 150,
        //                         width: 100,
        //                       ),
        //                     ),
        //                     title: Text(item[index].name!),
        //                     subtitle: Text(item[index].desc!),
        //                     trailing: Text(item[index].price.toString()),
        //                     onTap: () {
        //                       var id = item[index].id;
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => DetailProduct(id!),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 );
        //               },
        //               itemCount: item.length)
        //         ),

        //     ],
        //   ),
        // ),
        );
  }
}
