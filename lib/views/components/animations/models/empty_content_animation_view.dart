import 'package:lomj/views/components/animations/lottie_animation_view.dart';
import 'package:lomj/views/components/animations/models/lotie_animation.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  const EmptyContentAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
