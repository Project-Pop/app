import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_video_player.dart';
import 'package:app/UI/Views/HomeBase/Widgets/setting_pages_app_bar.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';

class TagScreen extends StatefulWidget {
  const TagScreen(
      {Key key, this.searchUsers, this.thumbnailNotifier, this.uploadPost})
      : super(key: key);

  final Future<List<SearchUser>> Function(String searchString) searchUsers;

  final ValueNotifier<String> thumbnailNotifier;

  final Future<void> Function({
    @required BuildContext ctx,
    @required List<String> taggedUsernames,
    String description,
  }) uploadPost;

  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  bool _fetchingSearchResults = false;
  List<SearchUser> searchResults = [];

  /// contain usernames of tagged users
  final List<String> _taggedUsers = [];

  final _tagPeopleController = TextEditingController();

  bool _isPosting = false;

  Future<void> searchResult(String value) async {
    setState(() {
      _fetchingSearchResults = true;
    });

    List<SearchUser> tempList = [];

    if (value == '') {
      setState(() {
        tempList = [];
      });
    } else {
      tempList = await widget.searchUsers(value);
    }

    // removing already tagged users from search list if they are present in it.
    tempList.removeWhere((element) {
      return _taggedUsers
          .map((e) => element.username == e)
          .toList()
          .contains(true);
    });

    if (mounted) {
      setState(() {
        searchResults = tempList;
        _fetchingSearchResults = false;
      });
    }
  }

  void _addToTagList(String username) {
    _taggedUsers.removeWhere((element) => element == username);
    _taggedUsers.add(username);

    searchResults.removeWhere((element) => element.username == username);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Who did you pop?', context),
      body: SafeArea(
        child: _isPosting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    children: [
                      ValueListenableBuilder<String>(
                          valueListenable: widget.thumbnailNotifier,
                          builder: (context, url, child) {
                            return SizedBox(
                              height: 160,
                              width: 160,
                              child: url?.isNotEmpty == true
                                  ? CustomVideoPlayer(
                                      isFileUrl: true,
                                      videoUrl: url,
                                    )
                                  : Container(),
                            );
                          }),
                      const SizedBox(width: 8),
                      const MyText(
                        msg: 'Tag:',
                        maxLines: 1,
                        textStyle: TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                          child: TextField(
                        style: const TextStyle(color: Colors.white60),
                        onChanged: (val) {
                          searchResult(val);
                        },
                        controller: _tagPeopleController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                  if (_taggedUsers.isNotEmpty)
                    Row(children: showTagUser())
                  else
                    Container(),
                  if (_fetchingSearchResults)
                    const Center(child: CircularProgressIndicator())
                  else
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: TagUsersListLAyout(
                        tagUserList: searchResults,
                        addToTagList: _addToTagList,
                      ),
                    ),
                  if (!_fetchingSearchResults && _taggedUsers.isNotEmpty)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isPosting = true;
                        });
                        widget
                            .uploadPost(
                          ctx: context,
                          taggedUsernames: _taggedUsers,
                          description: '',
                        )
                            .then((_) {
                          if (!mounted) return;
                          setState(() {
                            _isPosting = false;
                          });
                        });
                      },
                      child: const Text('Post'),
                    ),
                ],
              ),
      ),
    );
  }

  List<Widget> showTagUser() {
    return _taggedUsers
        .map(
          (username) => Text(
            username,
            style: const TextStyle(color: Colors.white),
          ),
        )
        .toList();
  }
}

class TagUsersListLAyout extends StatefulWidget {
  const TagUsersListLAyout({
    Key key,
    this.tagUserList,
    this.addToTagList,
  }) : super(key: key);
  final List<SearchUser> tagUserList;
  final Function(String username) addToTagList;
  @override
  _TagUsersListLAyoutState createState() => _TagUsersListLAyoutState();
}

class _TagUsersListLAyoutState extends State<TagUsersListLAyout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.tagUserList.length,
          itemBuilder: (context, index) {
            final user = widget.tagUserList[index];
            return Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 18),
              child: GestureDetector(
                onTap: () {
                  widget.addToTagList(user.username);
                  setState(() {});
                },
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
                  ],
                ),
              ),
            );
          }),
    );
  }
}
