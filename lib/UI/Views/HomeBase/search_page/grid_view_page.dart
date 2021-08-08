// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Profile/widgets/pop_view_grid_widget.dart';
import 'package:app/UI/Views/HomeBase/search_page/search_page.dart';
import 'package:app/UI/Views/Theme/constants/colors.dart';
import 'package:app/UI/Views/models/search_user_model.dart';

class SearchPageGridView extends StatefulWidget {
  const SearchPageGridView({
    Key key,
    @required this.popList,
    @required this.recentSearches,
    @required this.searchUsers,
    @required this.onTappingProfile,
  }) : super(key: key);
  final List popList;
  final List<SearchUser> recentSearches;
  final Future<List<SearchUser>> Function(String searchString) searchUsers;
  final Function(BuildContext, String username) onTappingProfile;
  @override
  _SearchPageGridViewState createState() => _SearchPageGridViewState();
}

class _SearchPageGridViewState extends State<SearchPageGridView> {
  void _navigateToSearchPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return SearchPage(
        changeView: true,
        searchRecent: widget.recentSearches,
        searchUsers: widget.searchUsers,
        onTappingProfile: widget.onTappingProfile,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
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
                            child: InkWell(
                              onTap: () => _navigateToSearchPage(),
                              child: const TextField(
                                enabled: false,
                                decoration: InputDecoration(
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
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 180,
              child: StaggeredGridView.countBuilder(
                //shrinkWrap: true,
                crossAxisCount: 3,
                itemCount: widget.popList.length,
                itemBuilder: (BuildContext context, int index) {
                  return videoPop(index,
                      'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4');
                },
                staggeredTileBuilder: (int index) =>
                    const StaggeredTile.count(1, 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
