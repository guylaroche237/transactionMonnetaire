
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/dashboard_screen/convert/convert_router.dart';
import 'package:moneytrans/domain/dashboard_screen/convert/convert_screen.dart';
import 'package:moneytrans/domain/dashboard_screen/historical/historical_screen.dart';
import 'package:moneytrans/domain/dashboard_screen/historical/historique_router.dart';
import 'package:moneytrans/domain/dashboard_screen/home/home_router.dart';
import 'package:moneytrans/domain/dashboard_screen/home/home_screen.dart';

import 'bottom_navigation.dart';

class PatronDashboardScreen extends StatefulWidget {
  static const ROUTE = "/patron-dashboard";
  PatronDashboardScreen({Key key}) : super(key: key);

  @override
  _PatronDashboardScreenState createState() => _PatronDashboardScreenState();
}

class _PatronDashboardScreenState extends State<PatronDashboardScreen> {
  //TabItem _currentTab = TabItem.jobs;
  TabItem _currentTab = TabItem.home;
  @override
  Widget build(BuildContext context) {
    Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
      TabItem.home: GlobalKey<NavigatorState>(),
      TabItem.convert: GlobalKey<NavigatorState>(),
      TabItem.historical: GlobalKey<NavigatorState>(),

    };
    List<TabItem> _hasRoute = [
      TabItem.home,
      TabItem.convert,
      TabItem.historical,
    ];
    void _selectTab(TabItem tabItem) {
      if (tabItem == _currentTab) {
        _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
      } else {
        setState(() => _currentTab = tabItem);
      }
    }

    Map<TabItem, Widget> _buildMap = {
      TabItem.home : HomeRouter(
        navigatorKey: _navigatorKeys[TabItem.home],
        selectTab: _selectTab,
      ),
      TabItem.convert: ConvertRouterScreen(
        navigatorKey: _navigatorKeys[TabItem.convert],
      ),
      TabItem.historical: HistoricalRouterScreen(
          navigatorKey: _navigatorKeys[TabItem.historical]
      ),

    };

    Widget _buildOffstageNavigator(TabItem tabItem) {
      return Offstage(
          offstage: _currentTab != tabItem,
          child: _hasRoute.contains(tabItem)
              ? _buildMap[tabItem]
              : Navigator(
              key: _navigatorKeys[tabItem],
              initialRoute: "/",
              onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (context) => _buildMap[tabItem])));
    }

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: SafeArea(
        child: new Scaffold(
            body: _buildOffstageNavigator(_currentTab),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigation(
              role: 0,
              currentTab: _currentTab,
              onSelectTab: _selectTab,
            )),
      ),
    );
  }
}