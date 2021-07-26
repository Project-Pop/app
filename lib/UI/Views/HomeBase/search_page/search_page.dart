// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/Theme/constants/colors.dart';
import 'package:app/UI/Views/models/search_user_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key key,
    this.searchUsers,
    this.searchRecent,
    this.changeView,
    this.onTappingProfile,
  }) : super(key: key);
  final Future<List<SearchUser>> Function(String searchString) searchUsers;
  final List<SearchUser> searchRecent;
  final bool changeView;
  final Function(BuildContext, String username) onTappingProfile;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearchTap = false;
  List<SearchUser> searchwiseresult = [];

  bool _fetchingSearchResults = false;

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
  Future<void> searchResult(String value) async {
    setState(() {
      _fetchingSearchResults = true;
    });

    List<SearchUser> tempList = [];

    if (value == '') {
      setState(() {
        tempList = widget.searchRecent;
      });
    } else {
      tempList = await widget.searchUsers(value);
    }
    setState(() {
      searchwiseresult = tempList;
      _fetchingSearchResults = false;
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
          if (_fetchingSearchResults)
            const Center(child: CircularProgressIndicator())
          else
            searchResults()
        ],
      ),
    ));
  }

//display recent searches or search results
  Widget searchResults() {
    final userList = isSearchTap ? widget.searchRecent : searchwiseresult;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: userList.length,
        itemBuilder: (_, index) {
          final user = userList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 18),
            child: GestureDetector(
              onTap: () => widget.onTappingProfile(context, user.username),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      user.imgUrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          msg: user.username,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        MyText(
                            msg: user.name,
                            textStyle: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),

                  // showing option to delete from recent searches only
                  if (isSearchTap)
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
            ),
          );
        });
  }
}
