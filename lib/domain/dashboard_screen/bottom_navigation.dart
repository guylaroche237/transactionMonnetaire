
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/helpers/theme_helper.dart';

enum TabItem { home, convert, historical }
List<TabItem> userTabItems = [
  TabItem.home,
  TabItem.convert,
  TabItem.historical
];

Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.convert: 'Convert',
  TabItem.historical: 'Historical',

};

Map<TabItem, IconData> tabIcon = {

  TabItem.home: Icons.home,
  TabItem.convert: Icons.monetization_on,
  TabItem.historical: Icons.airport_shuttle,
};

class BottomNavigation extends StatelessWidget {
  final int role;
  BottomNavigation({this.currentTab, this.onSelectTab, @required this.role});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 2)]),
      child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 32,
          selectedItemColor: ThemeHelper.SECONDARY_COLOR,
          unselectedItemColor: ThemeHelper.PRIMARY_COLOR,
          type: BottomNavigationBarType.shifting,
          items: _buildBottomNavigationItemsFromRole(),
          onTap: (index) {
            onSelectTab(
              currentTabItemList[index],
            );
          }),
    );
  }

  List<TabItem> get currentTabItemList {
    return userTabItems;
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItemsFromRole() {
    return List<BottomNavigationBarItem>.from(
        currentTabItemList.map((v) => (_buildItem(tabItem: v))));
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? ThemeHelper.PRIMARY_COLOR : ThemeHelper.BLACL_COLOR;
  }
}
