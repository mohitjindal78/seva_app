import 'package:flutter/material.dart';
import 'package:seva_app/screens/seva_screen.dart';
import 'package:seva_app/screens/yogdan_screen.dart';
import 'package:seva_app/screens/sanstha_screen.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  TabController _tcontroller;
  final List<String> titleList = ["Active Seva", "My Yogdan", "Sanstha Page"];
  String currentTitle;

  @override
  void initState() {
    currentTitle = titleList[0];
    _tcontroller = TabController(length: 3, vsync: this);
    _tcontroller.addListener(changeTitle); // Registering listener
    super.initState();
  }

  // This function is called, every time active tab is changed
  void changeTitle() {
    setState(() {
      // get index of active tab & change current appbar title
      currentTitle = titleList[_tcontroller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
        centerTitle: true,
        bottom: TabBar(
          controller: _tcontroller,
          tabs: [
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.account_balance_wallet)),
            Tab(icon: Icon(Icons.admin_panel_settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tcontroller,
        children: [
          SevaScreen(),
          YogdanScreen(),
          SansthaScreen(),
        ],
      ),
    );
  }
}
