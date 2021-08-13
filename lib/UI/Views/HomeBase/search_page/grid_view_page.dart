// Flutter imports:
import 'dart:io';

import 'package:app/UI/Views/HomeBase/search_page/widgets/grid_list.dart';

import 'package:app/UI/Views/HomeBase/search_page/widgets/grid_vew_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:

import 'package:app/UI/Views/HomeBase/search_page/search_page.dart';
import 'package:app/UI/Views/Theme/constants/colors.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:path_provider/path_provider.dart';

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
  String dirPath;
  List<String> storedConvertedGifs = [];
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

  Future<void> convertGif() async {
    for (var i = 0; i < widget.popList.length; i++) {
      String timestamp() => DateTime.now().microsecondsSinceEpoch.toString();
      final Directory extDir = await getTemporaryDirectory();
      dirPath = extDir.path;

      final String rawDocumentPath = dirPath;

      final String outputPath = '$rawDocumentPath/output${timestamp()}.gif';

      final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
      final arguments = ['-i', widget.popList[i], outputPath];
      _flutterFFmpeg.executeWithArguments(arguments).then((rc) {
        setState(() {});
      });
      storedConvertedGifs.add(outputPath);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    convertGif();
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
                crossAxisCount: 4,
                itemCount: widget.popList.length,
                itemBuilder: (BuildContext context, int index) {
                  return storedConvertedGifs.isEmpty
                      ? GridViewShimmer()
                      : GridPopCard(
                          gifUrl: storedConvertedGifs[index],
                          vidUrl: widget.popList[index]);
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index % 4 == 0 ? 1.8 : 0.9),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
