import 'package:basic_flutter/config/palette.dart';
import 'package:basic_flutter/data/data.dart';
import 'package:basic_flutter/models/models.dart';
import 'package:basic_flutter/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              actions: [
                CircleButton(onpressed: () {}, icon: CupertinoIcons.search),
                CircleButton(onpressed: () {}, icon: Mdi.facebookMessenger),
              ],
              floating: true,
              // centerTitle: true,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                "Facebook",
                style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1.2,
                ),
              ),
            ),

            /// ? Post Container
            SliverToBoxAdapter(
              child: CreatePostContainer(
                currentUser: currentUser,
              ),
            ),
            // Rooms online suers
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUser: onlineUsers),
              ),
            ),
            // Users Stories Container
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              ),
            ),
            //Post users
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Post post = posts[index];

                  return PostContainer(
                    post: post,
                  );
                },
                childCount: posts.length,
              ),
            )
          ],
        ));
  }
}
