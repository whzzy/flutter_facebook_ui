import 'package:basic_flutter/config/palette.dart';
import 'package:basic_flutter/models/models.dart';
import 'package:basic_flutter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// / create post container for posting
class PostContainer extends StatelessWidget {
  PostContainer({Key key, @required this.post}) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///TODO:Post Header
                _PostHeader(post: post),
                const SizedBox(
                  height: 6.0,
                ),
                //post Caption
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 12.0,
                      ),
              ],
            ),
          ),
          //Post Image
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.network(post.imageUrl),
                )
              : const SizedBox.shrink(),
          //PostStats
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        //
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${post.user.name}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${post.timeAgo} * ",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.public,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () => print("More"), icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({Key key, @required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Palette.facebookBlue),
            child: const Icon(Icons.thumb_up, size: 10.0, color: Colors.white),
          ),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              "${post.likes}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${post.comments} Comments",
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${post.shares} Shares",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
      const Divider(),
      // Button likes comments and shares
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'like',
              ontap: () => print("likes")),
          _PostButton(
              icon: Icon(
                MdiIcons.comment,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comments',
              ontap: () => print("Commentss")),
          _PostButton(
              icon: Icon(
                MdiIcons.share,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              ontap: () => print("Shares")),
        ],
      )
    ]);
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.ontap,
  }) : super(key: key);
  final Icon icon;
  final String label;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: ontap,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4.0,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
