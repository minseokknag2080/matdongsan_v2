import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sns_clonecode/exceptions/custom_exception.dart';
import 'package:sns_clonecode/models/feed_model.dart';
import 'package:sns_clonecode/models/urser_model.dart';
import 'package:sns_clonecode/providers/feed/fedd_state.dart';
import 'package:sns_clonecode/providers/feed/feed_provider.dart';
import 'package:sns_clonecode/providers/like/like_provider.dart';
import 'package:sns_clonecode/providers/profile/profile_provider.dart';
import 'package:sns_clonecode/providers/user/user_provider.dart';
import 'package:sns_clonecode/providers/user/user_state.dart';
import 'package:sns_clonecode/screens/comment_scrren.dart';
import 'package:sns_clonecode/utils/logger.dart';
import 'package:sns_clonecode/widgets/avatar_widget.dart';
import 'package:sns_clonecode/widgets/error_dialog_widget.dart';
import 'package:sns_clonecode/widgets/heart_animation_widget.dart';

class Profilewidget extends StatefulWidget {
  final FeedModel feedModel;
  final bool isProfile;

  const Profilewidget(
      {super.key, required this.feedModel, this.isProfile = false});

  @override
  State<Profilewidget> createState() => _ProfilewidgetState();
}

class _ProfilewidgetState extends State<Profilewidget> {
  final CarouselController carouselController = CarouselController();
  int _indicatorIndex = 0;
  bool isAnimating = false;

  @override
  Widget build(BuildContext context) {
    String currentUserId = context.read<UserState>().userModel.uid;

    FeedModel feedModel = widget.feedModel;
    UserModel userModel = feedModel.writer;
    bool isLike = feedModel.likes.contains(currentUserId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              AvatarWidget(userModel: userModel),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  userModel.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (currentUserId == feedModel.uid)
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: TextButton(
                              child: Text(
                                '삭제',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () async {
                                //삭제로직
                                try {
                                  await context
                                      .read<FeedProvider>()
                                      .deleteFeed(feedModel: feedModel);

                                  context
                                      .read<LikeProvider>()
                                      .deleteFeed(feedId: feedModel.feedId);

                                  if (widget.isProfile) {
                                    context
                                        .read<ProfileProvider>()
                                        .deleteFeed(feedId: feedModel.feedId);
                                    Navigator.pop(context);
                                  }

                                  Navigator.pop(context);
                                } on CustomException catch (e) {
                                  errorDialogWidget(context, e);
                                }
                              },
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.more_vert),
                )
            ],
          ),
        ),
      ]),
    );
    ;
  }
}
