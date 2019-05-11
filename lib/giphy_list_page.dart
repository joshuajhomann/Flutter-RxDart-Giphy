import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'giphy_list_view_model.dart';
import 'giphy_list.dart';

class GiphyListPage extends StatefulWidget {
  GiphyListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GiphyListPage createState() => _GiphyListPage();
}

class _GiphyListPage extends State<GiphyListPage> {
  @override
  GiphyListViewModel _viewModel = GiphyListViewModel();
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoTextField(
          placeholder: "Search",
          onChanged: (text) {
            _viewModel.searchTerm.add(text);
          },
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: Colors.black54),
        child: StreamBuilder(
            stream: _viewModel.giphies,
            initialData: "",
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? GiphyListView(snapshot.data)
                  : CupertinoActivityIndicator(animating: true,);
            }
        ),
      ),
    );
  }
}