import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/auth/providers/auth_state_provider.dart';
import 'package:lomj/state/comments/providers/delete_comment_provider.dart';
import 'package:lomj/state/comments/providers/send_comment_provider.dart';
import 'package:lomj/state/image_upload/providers/image_uploader_provider.dart';
import 'package:lomj/state/post/providers/delete_post_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploaderProvider);
  final isSendingComment = ref.watch(sendCommentProvider);
  final isDeletingComment = ref.watch(deleteCommentProvider);
  final isDeletingPost = ref.watch(deletePostProvider);

  return authState.isLoading ||
      isUploadingImage ||
      isSendingComment ||
      isDeletingComment ||
      isDeletingPost;
});
