import 'package:flutter/material.dart';
import 'package:hoop/components/player_widgets/player_search_item.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class PlayerSearch extends StatefulWidget {
  const PlayerSearch();

  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearch> {
  final TextEditingController _controller = new TextEditingController();
  Widget appBarTitle = new TextField(
      style: new TextStyle(
    color: Colors.white,
  ));
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = new GlobalKey<ScaffoldState>();
  var _playerList;
  bool _isSearching;
  //String _searchText = "";
  List searchresult = [];

  @override
  void initState() {
    super.initState();
    _playerList =
        Provider.of<JsonFiles>(context, listen: false).getAllPlayers();
    this.appBarTitle = new TextField(
      controller: _controller,
      style: new TextStyle(
        color: Colors.white,
      ),
      decoration: new InputDecoration(
          prefixIcon: new Icon(Icons.search, color: Colors.white),
          hintText: "Enter Player Name...",
          hintStyle: new TextStyle(color: Colors.white)),
      onChanged: doSearch,
    );
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                _resetSearch();
              });
            },
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [...searchresult],
          ),
        ));
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _resetSearch() {
    setState(() {
      this.appBarTitle = new TextField(
        controller: _controller,
        style: new TextStyle(
          color: Colors.white,
        ),
        decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            hintText: "Enter Player Name...",
            hintStyle: new TextStyle(color: Colors.white)),
        onChanged: doSearch,
      );
      _isSearching = false;
      _controller.clear();
      searchresult.clear();
    });
  }

  void doSearch(String searchText) {
    if (searchText == "") {
      setState(() {
        searchresult.clear();
      });
    } else {
      setState(() {
        searchresult.clear();
        if (_isSearching != null) {
          for (var player in _playerList["league"]["standard"]) {
            String fullName = player["firstName"] + " " + player["lastName"];
            if (fullName.toLowerCase().contains(searchText.toLowerCase())) {
              searchresult.add(PlayerSearchItem(
                player: player,
              ));
            }
          }
        }
      });
    }
  }
}
