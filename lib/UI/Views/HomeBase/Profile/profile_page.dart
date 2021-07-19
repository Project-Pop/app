// Flutter imports:
import 'package:app/UI/Views/HomeBase/Profile/constants/colors.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/follow_widget.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {@required this.postCount,
      @required this.viewsCount,
      @required this.reactCount,
      @required this.imageProfile,
      @required this.userName,
      @required this.userUrl,
      @required this.userTagName,
      @required this.pops,
      @required this.cameraPops,
      @required this.followOrFollowing,
      @required this.isMine,
      @required this.isAlreadyFollow});

  final String postCount;
  final String viewsCount;
  final String reactCount;
  final Image imageProfile;
  final String userName;
  final String userUrl;
  final String userTagName;
  final List pops;
  final List cameraPops;
  final bool isMine;
  final bool isAlreadyFollow;

  final Widget followOrFollowing;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(widget.userTagName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: widget.isMine
                    ? const Icon(Icons.settings, color: Colors.white, size: 25)
                    : const Icon(Icons.more_horiz,
                        color: Colors.white, size: 25))
          ]),
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView(shrinkWrap: true, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45,
                      backgroundImage: AssetImage(
                        'assets/images/profile.png',
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(widget.userName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.postCount,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const Text(
                      'Posts',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.viewsCount,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const Text(
                      'Views',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.reactCount,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const Text(
                      'Reacts',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: FollowWidget(
              color: widget.isMine
                  ? Colors.grey[900]
                  : widget.isAlreadyFollow
                      ? Colors.grey[900]
                      : bgWhite,
              name: widget.isMine
                  ? widget.userUrl
                  : widget.isAlreadyFollow
                      ? 'following'
                      : 'follow',
            ),
          ),
        ],
      ),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: selectedIndex == 0 ? bgWhite : Colors.black),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: selectedIndex == 1 ? bgWhite : Colors.black),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      FontAwesome.th,
                      color: selectedIndex == 0
                          ? textWhite
                          : textWhite.withOpacity(0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      FontAwesome.camera,
                      color: selectedIndex == 1
                          ? textWhite
                          : textWhite.withOpacity(0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      IndexedStack(
        index: selectedIndex,
        children: [popView(selectedIndex), cameraView(selectedIndex)],
      ),
      
    ]);
  }

  Widget popView(int selectedIndex) {
    if (widget.pops.isNotEmpty) {
      return Column(children: [
        DyamicGridView(
          popList: widget.pops,
          isMinePop: widget.isMine,
          //tabIndex: selectedIndex,
        ),
      ]);
    } else {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'No Pops of you yet',
              textAlign: TextAlign.center,
              style: TextStyle(color: bgWhite, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'When you get popped,they will \n appear here on profile',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(color: bgWhite, fontSize: 10),
            )
          ],
        ),
      );
    }
  }

  Widget cameraView(int selectedIndex) {
    if (widget.cameraPops.isNotEmpty) {
      return Column(children: [
        DyamicGridViewForCameraPops(
          popList: widget.cameraPops,
          isMinePop: widget.isMine,
          //tabIndex: selectedIndex, //if we do not pass here thats also fine
        ),
      ]);
    } else {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'No Pops of you yet',
              textAlign: TextAlign.center,
              style: TextStyle(color: bgWhite, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'When you get popped,they will \n appear here on profile',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(color: bgWhite, fontSize: 10),
            )
          ],
        ),
      );
    }
  }
}
