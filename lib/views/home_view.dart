import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/post/providers/all_post_provider.dart';
import 'package:lomj/views/components/animations/models/empty_content_with_text_animation_view.dart';
import 'package:lomj/views/components/animations/models/error_animation_view.dart';
import 'package:lomj/views/components/animations/models/loading_animation_view.dart';
import 'package:lomj/views/constants/strings.dart';

import 'components/post/post_grid_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(allPostsProvider);
        return Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: posts.when(
          data: (posts) {
            if (posts.isEmpty) {
              return const EmptyContentAnimationWihText(
                text: Strings.noPostsAvailable,
              );
            } else {
              return PostGridView(
                posts: posts,
              );
            }
          },
          error: (error, stackTrace) {
            return const ErrorAnimationView();
          },
          loading: () {
            return const LoadingAnimationView();
          },
        ),
      ),
    );
  }
}
