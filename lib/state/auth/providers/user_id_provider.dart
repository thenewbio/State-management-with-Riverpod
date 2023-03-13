import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/auth/providers/auth_state_provider.dart';
import 'package:lomj/state/post/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>((ref) {
  return ref.watch(authStateProvider).userId;
});
