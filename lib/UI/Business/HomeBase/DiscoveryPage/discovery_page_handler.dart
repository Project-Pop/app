// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/HomeBase/ProfilePage/profile_page_handler.dart';
import 'package:app/UI/Views/HomeBase/search_page/grid_view_page.dart';
import 'package:app/UI/Views/models/search_user_model.dart';

class DiscoveryPageHandler extends StatefulWidget {
  @override
  _DiscoveryPageHandlerState createState() => _DiscoveryPageHandlerState();
}

class _DiscoveryPageHandlerState extends State<DiscoveryPageHandler> {
  UserProvider _userProvider;

  Future<List<SearchUser>> _searchUsers(String searchString) async {
    final list = await _userProvider.searchUsers(searchString);
    return list
        .map((e) => SearchUser(
              imgUrl: e.imageUrl ?? 'assets/images/profile.png',
              name: e.fullname,
              username: e.username,
            ))
        .toList();
  }

  void _onTappingProfile(BuildContext ctx, String username) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => ProfilePageHandler(username),
      ),
    );
  }

  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchPageGridView(
      popList: const [1, 2, 3, 4, 5, 6, 67, 7],
      recentSearches: const [],
      searchUsers: _searchUsers,
      onTappingProfile: _onTappingProfile,
    );
  }
}
