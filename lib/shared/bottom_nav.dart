import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.peopleGroup,
            size: 20,
          ),
          label: 'Crew',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.child,
            size: 20,
          ),
          label: 'Buddy',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bell,
            size: 20,
          ),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.addressCard,
            size: 20,
          ),
          label: 'Profile',
        ),
      ],
      fixedColor: Colors.green[700],
      unselectedItemColor: Colors.grey[600],
      onTap: (int index) {
        switch (index) {
          case 0:
            // Navigator.pushNamed(context, '/crews');
            break;
          case 1:
            Navigator.pushNamed(context, '/buddies');
            break;
          case 2:
            Navigator.pushNamed(context, '/feed');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
