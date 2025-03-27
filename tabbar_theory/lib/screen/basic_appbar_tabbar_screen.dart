import 'package:flutter/material.dart';

import '../const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppBarScreen'),
          bottom: TabBar(
            indicatorColor: Colors.red,
            indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.blue,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w700
            ),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w100
            ),
            tabs:
                TABS
                    .map((e) => Tab(icon: Icon(e.icon), child: Text(e.label)))
                    .toList(),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: TABS.map((e) => Center(child: Icon(e.icon))).toList(),
        ),
      ),
    );
  }
}
