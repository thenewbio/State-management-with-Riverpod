import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/comments/typedefs/notifiers/send_comment_notifier.dart';
import 'package:lomj/state/image_upload/typedefs/is_loading.dart';

final sendCommentProvider =
    StateNotifierProvider<SendCommentNotifier, IsLoading>(
  (_) => SendCommentNotifier(),
);
