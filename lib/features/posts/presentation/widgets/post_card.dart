import 'package:flutter/material.dart';
import 'package:q_project/features/posts/model/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Theme.of(context).cardColor,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              _PostTitleAndSummary(
                post: post,
              ),
              _PostDetails(
                post: post,
              )
            ])),
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTheme = Theme.of(context).textTheme.bodyText2;
    final TextStyle summaryTheme = Theme.of(context).textTheme.bodyText1;
    final String title = post.email;
    final String summary = post.message;

    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title, style: titleTheme),
          SizedBox(height: 8.0),
          Text(summary, style: summaryTheme),
        ],
      ),
    );
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _UserImage(),
        SizedBox(width: 8.0),
        _UserNameAndEmail(
          post: post,
        )
      ],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(post.email),
          SizedBox(height: 4.0,),
          Text(post.name),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        // backgroundImage: AssetImage(Post.avatar),
      ),
    );
  }
}
