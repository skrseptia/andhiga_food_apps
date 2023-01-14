import 'package:flutter/material.dart';

class SuccessOrderScreen extends StatefulWidget {
  const SuccessOrderScreen({Key? key}) : super(key: key);
  static const routeName = '/successSuccessOrderScreen';

  @override
  State<SuccessOrderScreen> createState() => _SuccessOrderScreenState();
}

class _SuccessOrderScreenState extends State<SuccessOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Angkringan Andiga'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detail Pengantaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 102, 177, 239)),
                      ),
                      ListTile(
                        leading: SizedBox(
                          height: 100,
                          width: 50,
                          child: Image.asset('assets/foodicon.png'),
                        ),
                        title: const Text('Alamat Restoran'),
                        subtitle: const Text('Angkringan Andhiga, Klari'),
                      ),
                      ListTile(
                        leading: SizedBox(
                          height: 100,
                          width: 50,
                          child: Image.asset('assets/lokasiicon.png'),
                        ),
                        title: const Text('Lokasi Tujuan'),
                        subtitle: const Text('Perumahan Citra, 2.0km'),
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pesanan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 102, 177, 239)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 5),
                        height: MediaQuery.of(context).size.height * .3,
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            return const ListTile(
                              title: Text('Pecel lele'),
                              trailing: Text('2'),
                            );
                          }),
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detail Pembayaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 102, 177, 239)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text('Harga')),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text(
                                  '50000',
                                  textAlign: TextAlign.end,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text('Ongkir')),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text(
                                  '10000',
                                  textAlign: TextAlign.end,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text(
                                  'Total Pembayaran',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .35,
                                child: const Text(
                                  '60000',
                                  textAlign: TextAlign.end,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
