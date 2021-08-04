// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Models/index.dart';
import 'package:app/Providers/index.dart';
import 'package:app/UI/Views/HomeBase/Profile/profile_page.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/custom_profile_button.dart';

class ProfilePageHandler extends StatefulWidget {
  const ProfilePageHandler(this.username);

  final String username;

  @override
  _ProfilePageHandlerState createState() => _ProfilePageHandlerState();
}

class _ProfilePageHandlerState extends State<ProfilePageHandler> {
  ProfileButtonWidget _profileButtonWidget;
  UserModel _userModel;
  UserProvider _userProvider;
  bool _isMine;

  bool _loading = true;

  void _setProfileButtonWidget({bool isMine, bool isFollowing}) {
    _profileButtonWidget = null;
    if (isMine == true) {
      _profileButtonWidget = ProfileButtonWidget(
        name: 'url/${_userModel.username}', // TODO: provide correct url
        onTap: () {},
      );
    } else if (isFollowing == true) {
      _profileButtonWidget = ProfileButtonWidget(
          name: 'Following',
          onTap: () async {
            final isSuccessful =
                await _userProvider.unfollowUser(_userModel.username);
            if (isSuccessful) {
              setState(() {
                _setProfileButtonWidget(isMine: false, isFollowing: false);
              });
            }
          });
    } else if (isFollowing == false) {
      _profileButtonWidget = ProfileButtonWidget(
          name: 'Follow',
          onTap: () async {
            final isSuccessful =
                await _userProvider.followUser(_userModel.username);
            if (isSuccessful) {
              setState(() {
                _setProfileButtonWidget(isMine: false, isFollowing: true);
              });
            }
          });
    }
  }

  Future<void> initiate() async {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _isMine = widget.username == _userProvider.user.username;

    if (_isMine) {
      _userModel = _userProvider.user;
      _setProfileButtonWidget(isMine: true);
    } else {
      final relationalData =
          await _userProvider.getUserRelationalData(widget.username);

      _userModel = relationalData.user;
      _setProfileButtonWidget(
          isMine: false, isFollowing: relationalData.following);
    }
    setState(() {
      _loading = _userModel == null;
    });
  }

  @override
  void initState() {
    initiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      // TODO: use siganture loading widget of this app
      return const Center(child: CircularProgressIndicator());
    }

    return ProfilePage(
      postCount: '${_userModel.userProfile.popScore}',
      viewsCount: '${_userModel.userProfile.views}',
      reactCount: '${_userModel.userProfile.reacts}',
      imageProfile: null, // TODO: provide imageProfile
      name: _userModel.fullname,
      userUrl: '', // TODO: provide url
      username: _userModel.username,
      pops: const [], // TODO: provide this list
      cameraPops: const [], // TODO: provide this list
      isMine: _isMine,
      profileButtonWidget: _profileButtonWidget,
    );
  }
}
