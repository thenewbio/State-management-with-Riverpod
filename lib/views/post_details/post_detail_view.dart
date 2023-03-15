import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/enums/date_sorting.dart';
import 'package:lomj/state/comments/models/post_comments_request.dart';
import 'package:lomj/state/post/models/post.dart';
import 'package:lomj/state/post/providers/can_current_user_delete_post_provider.dart';
import 'package:lomj/state/post/providers/delete_post_provider.dart';
import 'package:lomj/state/post/providers/specific_post_with_comments_provider.dart';
import 'package:lomj/views/components/animations/models/error_animation_view.dart';
import 'package:lomj/views/components/animations/models/loading_animation_view.dart';
import 'package:lomj/views/components/animations/models/small_error_animation_view.dart';
import 'package:lomj/views/components/comment/compact_coment_column.dart';
import 'package:lomj/views/components/dialogs/alert_dialog_model.dart';
import 'package:lomj/views/components/dialogs/delete_dialog.dart';
import 'package:lomj/views/components/like_button.dart';
import 'package:lomj/views/components/likes_count_view.dart';
import 'package:lomj/views/components/post/post_display_image_and_mesaage_view.dart';
import 'package:lomj/views/components/post/post_image%20_or_video_view.dart';
import 'package:lomj/views/constants/strings.dart';
import 'package:lomj/views/post_comments/post_comments_view.dart';
import 'package:share_plus/share_plus.dart';

import '../components/post/post_date_view.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;
  const PostDetailsView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = RequestForPostAndComments(
      postId: widget.post.postId,
      limit: 2, // at most 3 comments
      sortByCreatedAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );

    // get the actual post together with its comments
    final postWithComments = ref.watch(
      specificPostWithCommentsProvider(
        request,
      ),
    );

    // can we delete this post?
    final canDeletePost = ref.watch(
      canCurrentUserDeletePostProvider(
        widget.post,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.postDetails,
        ),
        actions: [
          // share button is always present
          postWithComments.when(
            data: (postWithComments) {
              return IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  final url = postWithComments.post.fileUrl;
                  Share.share(
                    url,
                    subject: Strings.checkOutThisPost,
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return const SmallErrorAnimationView();
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          // delete button or no delete button if user cannot delete this post
          if (canDeletePost.value ?? false)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final shouldDeletePost = await const DeletedDialog(
                        titleOfObjectToDelete: Strings.post)
                    .present(context)
                    .then((shouldDelete) => shouldDelete ?? false);
                if (shouldDeletePost) {
                  await ref
                      .read(deletePostProvider.notifier)
                      .deletePost(post: widget.post);
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
                // delete the post now
              },
            )
        ],
      ),
      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(
                  post: postWithComments.post,
                ),
                // like and comment buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // like button if post allows liking it
                    if (postWithComments.post.allowsLikes)
                      LikeButton(
                        postId: postId,
                      ),
                    // comment button if post allows commenting on it
                    if (postWithComments.post.allowsComments)
                      IconButton(
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostCommentsView(
                                postId: postId,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                // post details (shows divider at bottom)
                PostDisplayNameAndMessageView(
                  post: postWithComments.post,
                ),
                PostDateView(
                  dateTime: postWithComments.post.createdAt,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.white70,
                  ),
                ),
                // comments
                CompactCommentsColumn(
                  comments: postWithComments.comments,
                ),
                // display like count
                if (postWithComments.post.allowsLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikesCountView(
                          postId: postId,
                        ),
                      ],
                    ),
                  ),
                // add spacing to bottom of screen
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
