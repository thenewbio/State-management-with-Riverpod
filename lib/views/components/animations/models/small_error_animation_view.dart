import 'package:lomj/views/components/animations/lottie_animation_view.dart';
import 'package:lomj/views/components/animations/models/lotie_animation.dart';

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.smallError,
        );
}
