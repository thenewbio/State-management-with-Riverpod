import 'package:lomj/views/components/animations/lottie_animation_view.dart';
import 'package:lomj/views/components/animations/models/lotie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}
