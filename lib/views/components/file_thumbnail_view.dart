import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/image_upload/models/thumbnail_request.dart';
import 'package:lomj/state/image_upload/providers/thumbnail_provider.dart';
import 'package:lomj/views/components/animations/models/loading_animation_view.dart';
import 'package:lomj/views/components/animations/models/small_error_animation_view.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const FileThumbnailView({super.key, required this.thumbnailRequest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));
    return thumbnail.when(data: (imageWithAspectRatio) {
      return AspectRatio(
        aspectRatio: imageWithAspectRatio.aspectRatio,
        child: imageWithAspectRatio.image,
      );
    }, error: (error, stackTrace) {
      return const SmallErrorAnimationView();
    }, loading: () {
      return const LoadingAnimationView();
    });
  }
}
