import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/comments/typedefs/notifiers/delete_comment_notifier.dart';
import 'package:lomj/state/image_upload/typedefs/is_loading.dart';

final deleteCommentProvider =
    StateNotifierProvider<DeleCommentStateNotifier, IsLoading>(
  (ref) => DeleCommentStateNotifier(),
);
