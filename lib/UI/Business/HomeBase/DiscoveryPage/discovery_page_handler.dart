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
      popList: const [
        'https://images.all-free-download.com/footage_preview/mp4/smartphone_touch_screen_navigation_1102.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/guitar_players_street_musicians_music_1101.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/stunt_motorbikes_synchronous_extreme_1095.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/stand_up_paddling_scuba_diving_836.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/hands_support_marriage_love_romance_770.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/pot_fire_cooking_flames_heat_kettle_1053.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/laptop_typing_notebook_computer_work_372.mp4',
        'https://images.all-free-download.com/footage_preview/mp4/acoustic_guitar_guitar_player_805.mp4'
      ],
      recentSearches: const [],
      searchUsers: _searchUsers,
      onTappingProfile: _onTappingProfile,
    );
  }
}
