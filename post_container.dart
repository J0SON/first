// TODO Implement this library.
import 'package:app/models/post_model.dart';
import 'package:app/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PostHeader(post: post),
            const SizedBox(height: 4.0),
            Text(post.caption,
            style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
            
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
       :const SizedBox.shrink(),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child:_PostStats(post.post),
      
      ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({ 
    Key? key
    @required this.post, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size:10.0,
                  color: Colors.redAccent,
                  ),
            ),
            const SizedBox(width: 4.0,),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
              ),
              ),
            ),
            const SizedBox(width: 4.0,),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
            ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '${post.shares} shares',
              style: TextStyle(
                color: Colors.grey[600],
            ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey[600],
                size: 20.0,
                ),

                label: 'favorite',
                onTap: () => print('favorite'),
              ),
                          _PostButton(
              icon: Icon(
                Icons.comment_outlined,
                color: Colors.grey[600],
                size: 20.0,
                ),

                label: 'comment',
                onTap: () => print('comment'),
              ),

                       _PostButton(
              icon: Icon(
                Icons.share_outlined,
                color: Colors.grey[600],
                size: 25.0,
                ),

                label: 'share',
                onTap: () => print('share'),
              ),




        ],
        ),

    ],
      
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key ?key,
    required this.icon,
    required this.label,
    required this.onTap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height:25.0,
            child: Row(children: [
              icon,
              const SizedBox(width:4.0),
              Text(label),
            ],
            ),
          ),
          
        ),
      ),
    );
  }
}