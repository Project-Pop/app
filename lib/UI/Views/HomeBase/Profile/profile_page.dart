// Flutter imports:

import 'package:app/UI/Views/HomeBase/Profile/widgets/cameraView_Grid.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/custom_profile_button.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/popView_grid_widget.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/profile_app_bar.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/profile_header.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/tab_bar_delegate.dart';
//import 'package:app/UI/Views/HomeBase/Profile/widgets/grid_widget.dart';
//import 'package:app/UI/Views/HomeBase/Profile/widgets/popView_grid_widget.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/Theme/constants/colors.dart';
import 'package:flutter/material.dart';

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
      @required this.isAlreadyFollow,
      this.profileButtonWidget});

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
  final ProfileButtonWidget profileButtonWidget;

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
        appBar: getAppBar(widget.userTagName, widget.isMine, context,
            widget.userName, widget.userTagName, widget.imageProfile),
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: HeaderAccountWidget(
                        postCount: widget.postCount,
                        viewCount: widget.viewsCount,
                        reactCount: widget.reactCount,
                        userName: widget.userName,
                        profileButtonWidget: widget.profileButtonWidget,
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: TabBarSliverPersistentHeaderDelegate(
                          child: SizedBox(
                        height: 40,
                        child: TabBar(
                          indicatorColor:
                              Theme.of(context).colorScheme.onBackground,
                          tabs: [
                            const Tab(
                              icon: Icon(
                                Icons.grid_on,
                                color: bgWhite,
                              ),
                            ),
                            const Tab(
                              icon: Icon(
                                Icons.camera_alt,
                                color: bgWhite,
                              ),
                            )
                          ],
                        ),
                      )),
                    )
                  ];
                },
                body: TabBarView(children: [popView(), cameraView()])),
          ),
        ));
  }

  Widget popView() {
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
            const MyText(
              msg: 'No Pops of you yet',
              textAlign: TextAlign.center,
              textStyle: TextStyle(color: bgWhite, fontSize: 22),
              maxLines: 1,
              textScaleFactor: 1.8,
            ),
            const SizedBox(
              height: 10,
            ),
            const MyText(
              msg: 'When you get popped,they will \n appear here on profile',
              maxLines: 2,
              textAlign: TextAlign.center,
              textStyle: TextStyle(color: bgWhite, fontSize: 12),
              textScaleFactor: 1.3,
            )
          ],
        ),
      );
    }
  }

  Widget cameraView() {
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
            const MyText(
              msg: 'No Pops of you yet',
              textAlign: TextAlign.center,
              textStyle: TextStyle(color: bgWhite, fontSize: 22),
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const MyText(
              msg: 'When you get popped,they will \n appear here on profile',
              maxLines: 2,
              textAlign: TextAlign.center,
              textStyle: TextStyle(color: bgWhite, fontSize: 10),
            )
          ],
        ),
      );
    }
  }
}
