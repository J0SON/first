import 'package:app/data/data.dart';
import 'package:app/models/post_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:app/widgets/post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: const Text(
              'SwashGram',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('search'),
              ),
              CircleButton(
                icon: Icons.message_outlined,
                iconSize: 30.0,
                onPressed: () => print('message'),
              ),
              CircleButton(
                icon: Icons.menu,
                iconSize: 30.0,
                onPressed: () => print('menu'),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
