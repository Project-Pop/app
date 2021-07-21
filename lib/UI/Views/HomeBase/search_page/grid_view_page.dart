import 'package:app/UI/Views/HomeBase/Profile/widgets/popView_grid_widget.dart';
import 'package:app/UI/Views/HomeBase/search_page/search_page.dart';
import 'package:app/UI/Views/Theme/constants/colors.dart';
import 'package:app/UI/Views/models/search_user_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPageGridView extends StatefulWidget {
  const SearchPageGridView({Key key, this.popList}) : super(key: key);
  final List popList;

  @override
  _SearchPageGridViewState createState() => _SearchPageGridViewState();
}

class _SearchPageGridViewState extends State<SearchPageGridView> {
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
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return const SearchPage(
                                    changeView: true,
                                    searchRecent: [
                                      SearchUser(
                                          imgUrl: 'assets/images/profile.png',
                                          name: 'xyz',
                                          userNAme: 'xuz@gamil'),
                                      SearchUser(
                                          imgUrl: 'assets/images/profile.png',
                                          name: 'xyz',
                                          userNAme: 'xuz@gamil')
                                    ],
                                    searchResults: [
                                      SearchUser(
                                          imgUrl: 'assets/images/profile.png',
                                          name: 'xyz',
                                          userNAme: 'xuz@gamil'),
                                      SearchUser(
                                          imgUrl: 'assets/images/profile.png',
                                          name: 'ayz',
                                          userNAme: 'xuy@gamil')
                                    ],
                                  );
                                }));
                              },
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
                  return cardPop();
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
