import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

import 'package:app/UI/Views/Theme/constants/colors.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(
      {Key key, this.searchResults, this.searchRecent, this.changeView})
      : super(key: key);
  final List<SearchUser> searchResults;
  final List<SearchUser> searchRecent;
  final bool changeView;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearchTap = false;
  bool isGridScreen = true;
  List<SearchUser> searchwiseresult = [];

  @override
  void initState() {
    changeView();
    super.initState();
  }

  void changeView() {
    if (widget.changeView) {
      setState(() {
        isSearchTap = true;
      });
      searchResults();
    }
  }

  //function for search functionality
  void searchResult(String value) {
    List<SearchUser> tempList = [];

    if (value == '') {
      setState(() {
        tempList = widget.searchRecent;
      });
    } else {
      for (final user in widget.searchResults) {
        if (user.name.contains(value)) {
          setState(() {
            //searchwiseresult = [];
            tempList.add(user);
          });
        } else {
          const Center(
            child: Text('No Product Availabel'),
          );
        }
      }
    }
    setState(() {
      searchwiseresult = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          InkWell(
            child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            border: Border.all(color: Colors.transparent),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                          ),
                          child: TextField(
                            autofocus: true,
                            onChanged: (value) {
                              searchResult(value);
                              isSearchTap = false;
                              isGridScreen = false;
                            },
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle:
                                    TextStyle(color: bgWhite, fontSize: 14),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: bgWhite,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          searchResults()
        ],
      ),
    ));
  }

//display recent searches or search results
  Widget searchResults() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount:
            isSearchTap ? widget.searchRecent.length : searchwiseresult.length,
        itemBuilder: (_, index) {
          isGridScreen = true;
          return Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 18),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    isSearchTap
                        ? widget.searchRecent[index].imgUrl
                        : searchwiseresult[index].imgUrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        msg: isSearchTap
                            ? widget.searchRecent[index].userNAme
                            : searchwiseresult[index].userNAme,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      MyText(
                          msg: isSearchTap
                              ? widget.searchRecent[index].name
                              : searchwiseresult[index].name,
                          textStyle: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        FlutterIcons.cross_ent,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
