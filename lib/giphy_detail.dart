import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'giphy.dart';

class GiphyDetail extends StatelessWidget {
  final Giphy giphy;

  GiphyDetail(this.giphy);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(giphy.title),
      ),
      child: Container(
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1), color: Colors.black26, blurRadius: 1)
            ]),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            placeholder: CupertinoActivityIndicator(
              animating: true,
            ),
            imageUrl: giphy.imageUrl,
            fit: BoxFit.cover,
            width:  MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
