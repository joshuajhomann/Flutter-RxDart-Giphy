import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'giphy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/giphy_detail.dart';

class GiphyCard extends StatefulWidget {
  final Giphy _giphy;

  GiphyCard(this._giphy) {
    this.createState();
  }

  @override
  _GiphyCardState createState() => _GiphyCardState();
}

class _GiphyCardState extends State<GiphyCard> {
  _GiphyCardState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return GiphyDetail(widget._giphy);
        }));
      },
      child: Container(
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1), color: Colors.black26, blurRadius: 1)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            placeholder: CupertinoActivityIndicator(
              animating: true,
            ),
            imageUrl: widget._giphy.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

class GiphyListView extends StatelessWidget {
  final List<Giphy> giphies;
  GiphyListView(this.giphies);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.black12),
      child: GridView.builder(
        itemCount: giphies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
        itemBuilder: (context, int) {
          return GiphyCard(giphies[int]);
        },
      ),
    );
  }
}