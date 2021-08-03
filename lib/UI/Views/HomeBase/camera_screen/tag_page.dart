import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_video_player.dart';
import 'package:app/UI/Views/HomeBase/Widgets/setting_pages_app_bar.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';

class TagScreen extends StatefulWidget {
  const TagScreen(
      {Key key, this.tagPeopleController, this.tagUsersList, this.searchUsers})
      : super(key: key);
  final TextEditingController tagPeopleController;
  final List<SearchUser> tagUsersList;

  final Future<List<SearchUser>> Function(String searchString) searchUsers;
  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  final url =
      'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4';
  bool _fetchingSearchResults = false;
  List<SearchUser> searchResults;

  List tagUSers = [];

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
    setState(() {
      searchResults = tempList;
      _fetchingSearchResults = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Who did you pop?', context),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 120,
                  child: CustomVideoPlayer(
                    videoUrl: url,
                  ),
                ),
                const MyText(
                  msg: 'Tag:',
                  maxLines: 1,
                  textStyle: TextStyle(color: Colors.white60),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                  style: const TextStyle(color: Colors.white60),
                  onChanged: (val) {
                    searchResult(val);
                  },
                  controller: widget.tagPeopleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ))
              ],
            ),
            if (tagUSers.isNotEmpty)
              Row(
                children: [showTagUser()],
              )
            else
              Container(),
            if (_fetchingSearchResults)
              const Center(child: CircularProgressIndicator())
            else
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: TagUsersListLAyout(
                  tagUserList: [
                    SearchUser(
                        imgUrl: 'assets/images/profile.png',
                        name: 'xyz',
                        username: 'xyz@gmail'),
                    SearchUser(
                        imgUrl: 'assets/images/profile.png',
                        name: 'xyz',
                        username: 'xyz@gmail')
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  showTagUser() {
    int i;
    for (i = 0; i < tagUSers.length; i++) {
      return Text(
        tagUSers[i],
        style: const TextStyle(color: Colors.white),
      );
    }
  }
}

class TagUsersListLAyout extends StatefulWidget {
  const TagUsersListLAyout({Key key, this.tagUserList, this.taggedUser})
      : super(key: key);
  final List<SearchUser> tagUserList;
  final List taggedUser;
  @override
  _TagUsersListLAyoutState createState() => _TagUsersListLAyoutState();
}

class _TagUsersListLAyoutState extends State<TagUsersListLAyout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.tagUserList.length,
          itemBuilder: (context, index) {
            final user = widget.tagUserList[index];
            return Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 18),
              child: GestureDetector(
                onTap: () {
                  widget.taggedUser.add(widget.tagUserList[index].username);
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
