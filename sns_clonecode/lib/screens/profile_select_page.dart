import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sns_clonecode/exceptions/custom_exception.dart';
import 'package:sns_clonecode/models/feed_model.dart';
import 'package:sns_clonecode/providers/feed/fedd_state.dart';
import 'package:sns_clonecode/providers/feed/feed_provider.dart';
import 'package:sns_clonecode/widgets/error_dialog_widget.dart';
import 'package:sns_clonecode/widgets/feed_card_widget.dart';
import 'package:sns_clonecode/widgets/profile_select_widget.dart';

class ProfileSelect extends StatefulWidget {
  const ProfileSelect({super.key});

  @override
  State<ProfileSelect> createState() => _ProfileSelectState();
}

class _ProfileSelectState extends State<ProfileSelect>
    with AutomaticKeepAliveClientMixin<ProfileSelect> {
  late final FeedProvider feedProvider;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    feedProvider = context.read<FeedProvider>();
  }

  void _get_FeedList() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await feedProvider.getFeedList();
      } on CustomException catch (e) {
        errorDialogWidget(context, e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    FeedState feedState = context.watch<FeedState>();
    List<FeedModel> feedList = feedState.feedList;

    if (feedState.feedStatus == FeedStatus.fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (feedState.feedStatus == FeedStatus.success && feedList.length == 0) {
      return Center(
        child: Text('feed가 존재하지 않습니다.'),
      );
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          _get_FeedList();
        },
        child: ListView.builder(
          itemCount: feedList.length,
          itemBuilder: (context, index) {
            return Profilewidget(feedModel: feedList[index]);
          },
        ),
      ),
    );
  }
}
