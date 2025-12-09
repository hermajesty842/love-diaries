import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) changeState;

  const NavbarWidget({
    super.key,
    required this.currentIndex,
    required this.changeState,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "home"),
        NavigationDestination(
          icon: Icon(Icons.person_2_rounded),
          label: "profile",
        ),
      ],
      onDestinationSelected: (value) {
        changeState(value);
        debugPrint(1.toString());
      },
      selectedIndex: currentIndex,
    );
  }
}
