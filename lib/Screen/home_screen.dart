import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widget/custom_drawer.dart';
import 'package:flutter_social_ui/widget/following_users.dart';
import 'package:flutter_social_ui/widget/posts_carousel.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            "FRENZY",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 3.0,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontSize: 18.0),
            tabs: [
              Tab(text: "Trending"),
              Tab(text: "Latest"),
            ],
          ),
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: [
            FollowingUsers(),
            PostsCarousel(pageController: _pageController,title: "Posts",posts: posts),
          ],
        ),
      ),
    );
  }
}
