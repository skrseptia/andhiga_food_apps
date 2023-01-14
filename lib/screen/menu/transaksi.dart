import 'package:flutter/material.dart';

class Transaksi extends StatelessWidget {
  static const routeName = '/transaksi';

  const Transaksi({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: ListTile(
                        leading: SizedBox(
                          height: 150,
                          width: 50,
                          child: Image.asset('assets/foodicon.png'),
                        ),
                        title: const Text('06-09-2022'),
                        subtitle: const Text('Makanan sudah diantar'),
                        trailing: const Text('Total : 34.000'),
                        onTap: () {},
                      ),
                    );
                  },
                  itemCount: 2),
            ),
          ],
        ),
      ),
    );
  }
}
