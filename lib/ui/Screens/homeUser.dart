import 'package:biken/ui/Screens/Notificaciones.dart';
import 'package:biken/ui/Screens/Quienessomos.dart';
import 'package:biken/ui/Screens/profile_screen.dart';
import 'package:biken/ui/pruebas/pruebaviewprofile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/rendering.dart';
import 'package:biken/ui/Screens/screens_uploadBike/uploadBike_screen1.dart';
import 'package:biken/ui/styles/biken_icons_icons.dart';
import 'package:biken/ui/Screens/screens_home/start_Screen.dart';
//import 'package:biken/Screens/profile_screen.dart';

const _maxSize = 35.0;
bool expanded = false;

class HomeUser extends StatefulWidget {
  HomeUser({
    Key key,
  }) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  int pageActual = 0;
  List<Widget> pages = [
    ScreenStart(),
    ScreenUploadBike(),
    Notificaciones(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: AppBar(
            leading: Text(
              'Biken',
              style: TextStyle(
                color: HexColor('#2059BD'),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
            foregroundColor: Colors.transparent,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: pages[pageActual],
      bottomNavigationBar: tabBarAnimated(),
    );
  }

  Widget tabBarAnimated() {
    return SizedBox(
      height: _maxSize,
      child: BottomNavigationBar(
        iconSize: 25.0,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: HexColor('#2059BD'),
        onTap: (index) {
          setState(() {
            pageActual = index;
          });
        },
        currentIndex: pageActual,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey[800],
              size: 32.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BikenIcons.bike_fill,
              color: Colors.grey[800],
              size: 32.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.grey[800],
              size: 32.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                'https://cdn.forbes.com.mx/2019/04/blackrrock-invertir-1-640x360.jpg',
              ),
            ),
            label: '',
          ),
          /*  BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://raw.githubusercontent.com/luisfernandocastro/API_Biken/gh-pages/images/persona5.jpg',
              ),
            ),
            label: '',
          ),  */
        ],
      ),
    );
  }
}
