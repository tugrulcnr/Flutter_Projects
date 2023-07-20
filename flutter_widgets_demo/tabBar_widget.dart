import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_full_learn/container_widget.dart';
import 'package:flutter_full_learn/text_widget.dart';

class TabbarWidgetLearn extends StatefulWidget {
  const TabbarWidgetLearn({super.key});

  @override
  State<TabbarWidgetLearn> createState() => _TabbarWidgetLearnState();
}

class _TabbarWidgetLearnState extends State<TabbarWidgetLearn>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyPages.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyPages.values.length, // length of tabs
        initialIndex: _MyPages.Home.index,
        child: Scaffold(
            appBar: AppBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _tabController.animateTo(_MyPages.Market.index);
              },
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            
            bottomNavigationBar: BottomAppBar(
              notchMargin: 10,
              shape: const CircularNotchedRectangle(),
              child: TabBar(
                  padding: EdgeInsets.zero,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.red,
                  onTap: (int index) {},
                  controller: _tabController,
                  tabs: _MyPages.values.map((e) => Tab(text: e.name)).toList()),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: _MyPages.Home.PageColar(Colors.amber),
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.white,
                )
              ],
            )));
  }
}

enum _MyPages { Home, Market, Settings, Profile }

extension MyPagesNames on _MyPages {
  Color PageColar(Color? pageColor) {
    return pageColor ?? Colors.red;
  }
}
