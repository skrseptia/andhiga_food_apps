import 'package:flutter/material.dart';

import 'ListMenu/tabs_screen_menu.dart';
import 'Slider/slidermenu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 260, child: SliderMenu()),
              SizedBox(
                height: 500,
                child: TabsScreenMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
