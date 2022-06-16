import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/views/navbars/histories/history_view.dart';
import 'package:kantin_online/ui/views/navbars/product_view.dart';
import 'package:kantin_online/ui/views/navbars/profile_view.dart';
import 'package:kantin_online/ui/views/navbars/qr_code_view.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({Key? key}) : super(key: key);

  @override
  _NavbarViewState createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {

  int _selectedNavbar = 0;

  final List<Widget> content = [
    const ProductView(),
    QrCodeView(),
    const HistoryView(),
    const ProfileView(),
  ];

  void _changeSelectedNavbar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: colorWhite,
      body: content[_selectedNavbar],
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorWhite,
        currentIndex: _selectedNavbar,
        onTap: _changeSelectedNavbar,
        iconSize: 32.0,
        selectedItemColor: colorRed,
        unselectedItemColor: colorGrey,
        showUnselectedLabels: false,
        showSelectedLabels: true,


        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Kode QR'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_outlined),
              label: 'Riwayat'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

}
