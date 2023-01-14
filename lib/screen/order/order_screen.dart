import 'package:flutter/material.dart';

import 'success_order.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/orderScreen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String dropdownValue = 'Tunai';
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Anda'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListTile(
                title: const Text('Alamat pengantaran'),
                subtitle: Text(' ${_currentAddress ?? ""}'),
                trailing: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: _getCurrentPosition,
                    child: const Text(
                      'Lokasi Sekarang',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Detail Alamat'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              height: MediaQuery.of(context).size.height * .35,
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 150,
                      width: 80,
                      child: Image.network(
                        'https://img.kurio.network/OpH6XcpyRpN0qV_bjh4Xp8sKOx0=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/20/11/21/b2aecfb2-fefd-415f-9424-2485a95d41ef.png',
                        height: 150,
                        width: 100,
                      ),
                    ),
                    title: const Text('Pecel lele'),
                    subtitle: const Text('2 x 25000 = 50000'),
                  );
                }),
                itemCount: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rincian Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
            Padding(
              padding: const EdgeInsets.all(29),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: const Text(
                        'Metode Pembayaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        style: const TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blueAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Tunai', 'Transfer']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Total  60000',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Material(
              color: Colors.blue,
              child: InkWell(
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Pesan Sekarang',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessOrderScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
