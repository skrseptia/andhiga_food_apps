import 'package:flutter/material.dart';
import '../../../../../providers/items.dart';
import '../../../../../models/item.dart';
import 'package:provider/provider.dart';

import '../../../../detailProduct/detail_product.dart';

class ListMenuSemua extends StatefulWidget {
  const ListMenuSemua({Key? key}) : super(key: key);
  static const routeName = '/ListMenuSemua';

  @override
  State<ListMenuSemua> createState() => _ListMenuSemuaState();
}

class _ListMenuSemuaState extends State<ListMenuSemua> {
  Future<void> fetchData(BuildContext context) async {
    await Provider.of<Items>(context, listen: false).fetchData();
  }

  void clickItem(Item item) {
    debugPrint(item.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Consumer<Items>(builder: (context, data, child) {
                final items = data.items;
                return RefreshIndicator(
                  onRefresh: () => fetchData(context),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: ListTile(
                            leading: SizedBox(
                              height: 150,
                              width: 80,
                              child: Image.network(
                                items[index].image!,
                                height: 150,
                                width: 100,
                              ),
                            ),
                            title: Text(items[index].name!),
                            subtitle: Text(items[index].desc!),
                            trailing: Text(items[index].price.toString()),
                            onTap: () {
                              var id = items[index].id;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailProduct(id!),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      itemCount: items.length),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
