import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/auth/providers/user_id_provider.dart';
import 'package:lomj/state/comments/models/comment.dart';
import 'package:lomj/state/comments/providers/delete_comment_provider.dart';
import 'package:lomj/state/user_info/providers/user_info_provider.dart';
import 'package:lomj/views/components/animations/models/small_error_animation_view.dart';
import 'package:lomj/views/components/constants/strings.dart';
import 'package:lomj/views/components/dialogs/alert_dialog_model.dart';
import 'package:lomj/views/components/dialogs/delete_dialog.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;
  const CommentTile({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(
      userInfoModelProvider(
        comment.fromUserId,
      ),
    );
    return userInfo.when(
      data: (userInfo) {
        final currentUserId = ref.read(userIdProvider);
        return ListTile(
          trailing: currentUserId == comment.fromUserId
              ? IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final shouldDeleteComment =
                        await displayDeleteDialog(context);
                    if (shouldDeleteComment) {
                      await ref
                          .read(
                            deleteCommentProvider.notifier,
                          )
                          .deleteComment(
                            commentId: comment.id,
                          );
                    }
                  },
                )
              : null,
          title: Text(
            userInfo.displayName,
          ),
          subtitle: Text(
            comment.comment,
          ),
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
    );
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
      const DeletedDialog(titleOfObjectToDelete: Strings.comment)
          .present(context)
          .then(
            (value) => value ?? false,
          );
}
