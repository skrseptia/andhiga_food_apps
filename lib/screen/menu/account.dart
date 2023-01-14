import 'package:flutter/material.dart';

import '../authscreen/auth_screen.dart';

class Profil extends StatelessWidget {
  static const routeName = '/profil';

  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 8, 66, 103),
                  Color.fromARGB(255, 36, 123, 177),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Leonardo Palmeiro',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: <Widget>[
                const ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 66, 103),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'palmeiro.leonardo@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    'Telp',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 66, 103),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '085866158601',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    'Alamat',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 66, 103),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Bojong Sari, Rawalumbu, Bekasi',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 66, 103),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        content: const Text('Apakah anda yakin untuk keluar?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Tidak'),
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                          ),
                          TextButton(
                            child: const Text('Ya'),
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AuthScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
