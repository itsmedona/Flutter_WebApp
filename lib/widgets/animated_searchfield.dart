import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:searchbar_animation/const/dimensions.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class SearchbarAnimation extends StatefulWidget {
  const SearchbarAnimation({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SearchbarAnimationState createState() => _SearchbarAnimationState();
}

class _SearchbarAnimationState extends State<SearchbarAnimation> {
  @override
  Widget build(BuildContext context) {
    return _buildSearchbarAnimation();
  }

  Widget _buildSearchbarAnimation() {
    return SearchBarAnimation(
      durationInMilliSeconds: Dimensions.t200,
      enableBoxBorder: true,
      isSearchBoxOnRightSide: true,
      searchBoxWidth: MediaQuery.of(context).size.width / 4,
      textEditingController: TextEditingController(),
      isOriginalAnimation: false,
      enableButtonShadow: false,
      enableKeyboardFocus: true,
      buttonElevation: 0,
      onExpansionComplete: () {
        debugPrint('do something just after searchbox is opened.');
      },
      onCollapseComplete: () {
        debugPrint('do something just after searchbox is closed.');
      },
      onPressButton: (isSearchBarOpens) {
        debugPrint(
            'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
      },
      trailingWidget: const Icon(
        Icons.search,
        size: 22,
        color: AppColors.tabcolor,
      ),
      secondaryButtonWidget: const Icon(
        Icons.close,
        size: 20,
        color: AppColors.tabcolor,
      ),
      buttonWidget: const Icon(
        Icons.search,
        size: 25,
        color: AppColors.tabcolor,
      ),
    );
  }
}
