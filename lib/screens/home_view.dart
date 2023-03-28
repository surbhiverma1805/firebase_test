import 'package:firebase_test/screens/account_view.dart';
import 'package:firebase_test/screens/booking_view.dart';
import 'package:firebase_test/screens/explore_view.dart';
import 'package:firebase_test/screens/saved_view.dart';
import 'package:firebase_test/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  List<Widget> pages = <Widget>[
    const ExploreView(),
    const BookingView(),
    const SavedView(),
    const AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: Constants.bookings,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
              ),
              label: Constants.bookings),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_outlined),
            label: Constants.saved,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: Constants.account,
          ),
        ],
      ),
    );
  }
}