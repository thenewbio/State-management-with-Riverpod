import 'package:lomj/views/components/animations/lottie_animation_view.dart';
import 'package:lomj/views/components/animations/models/lotie_animation.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
